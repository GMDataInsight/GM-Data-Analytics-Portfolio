/*
==============================================================================
Project      : Automatic Production Line Analytics
Object       : vw_OEEAutoLine
Type         : SQL View
Author       : Miroslav Grujic
Version      : 1.0

Description:
Final analytical dataset used by Power BI reporting.

Output Grain:
Date + Shift + Production Line
==============================================================================
*/

CREATE VIEW dbo.vw_OEEAutoLine
as
WITH ProductionAgg AS 
(SELECT Year, MONTH(Date) AS Month, Week, Date, CASE DATENAME(WEEKDAY, Date) 
WHEN 'Monday' THEN 'MON' WHEN 'Tuesday' THEN 'TUE' WHEN 'Wednesday' THEN 'WED' WHEN 'Thursday' THEN 'THU' WHEN 'Friday' THEN 'FRI' WHEN 'Saturday' THEN 'SAT' WHEN 'Sunday' THEN 'SUN' END AS DOW,
Shift, Line,COUNT(DISTINCT(ProductCode)) AS Products, SUM(Produced) AS Produced, SUM(Scrap) AS Scrap,SUM(TotalWeight) as TotalWeight,sum(ScrapWeight) as ScrapWeight,sum(GoodWeight) as GoodWeight, SUM(ActualCycles) AS ActualCycles,
Max(RespID) as RespID,Max(Op1ID) as Op1ID,Max(Op2ID) as Op2ID
FROM      dbo.vw_Production_Detail
GROUP BY Year, Month, Week, Date, Shift, Line), 
PlanAgg AS
(SELECT d.Year, d.Month, d.Week, d.Date, d.DOW, p.Shift, p.Line, SUM(p.PlanPositions) AS PlanPositions
FROM      dbo.vw_ProductionPlanMain AS p INNER JOIN
dbo.DimDate AS d ON d.Year = p.Year AND d.Week = p.Week AND d.DOW = p.DOW
GROUP BY d.Year, d.Month, d.Week, d.Date, d.DOW, p.Shift, p.Line), 
Base AS
(SELECT COALESCE (pr.Year, pl.Year) AS Year, COALESCE (pr.Month, pl.Month) AS Month, COALESCE (pr.Week, pl.Week) AS Week, COALESCE (pr.Date, pl.Date) AS Date, COALESCE (pr.DOW, pl.DOW) AS DOW, COALESCE (pr.Shift, pl.Shift) 
AS Shift, COALESCE (pr.Line, pl.Line) AS Line,ISNULL(pr.Products, 0) AS Products, ISNULL(pr.Produced, 0) AS Produced, ISNULL(pr.Scrap, 0) AS Scrap,ISNULL(pr.TotalWeight,0) as TotalWeight,ISNULL(pr.GoodWeight,0) as GoodWeight,ISNULL(pr.ScrapWeight,0) as ScrapWeight, ISNULL(pr.ActualCycles, 0) AS ActualCycles, 
ISNULL(pl.PlanPositions, 0) AS PlanPositions,coalesce(pr.RespID,0) as RespID, coalesce(pr.Op1ID,0) as Op1ID,coalesce(pr.Op2ID,0) as Op2ID
FROM ProductionAgg AS pr FULL OUTER JOIN
PlanAgg AS pl ON pr.Date = pl.Date AND pr.Shift = pl.Shift AND pr.Line = pl.Line)
SELECT b.Year, b.Month, b.Week, b.Date, b.DOW, b.Shift, b.Line,b.RespID,b.Op1ID,b.Op2ID,b.Products, b.Produced, b.Scrap,b.TotalWeight,b.GoodWeight,b.ScrapWeight, b.ActualCycles,ct.TheoricPerShift,ct.TheoricPerShift*b.PlanPositions as TheoricCycles, ct.TotalPositions AS TotalPosition, ct.AvailablePositions AS PositionAvailable, b.PlanPositions, 
CASE WHEN b.PlanPositions > 0 THEN 28800 ELSE 0 END AS PlannedProdTime, 
CASE WHEN b.Produced > 0 THEN 28800 ELSE 0 END AS ActualProdTime, 
CASE WHEN ct.TotalPositions > 0 THEN ct.AvailablePositions * 1.0 / ct.TotalPositions ELSE NULL END AS IndustrialLoad, 
CASE WHEN ct.Positions > 0 THEN b.PlanPositions * 1.0 / ct.AvailablePositions ELSE NULL END AS VolumeLoad, 
CASE WHEN b.PlanPositions > 0 THEN (CASE WHEN b.Produced > 0 THEN 28800.0 ELSE 0 END) / 28800.0 ELSE NULL END AS Availability, 
CASE WHEN ct.TheoricPerShift > 0 and b.PlanPositions>0 then b.ActualCycles * 1.0 / (ct.TheoricPerShift*b.PlanPositions) ELSE NULL END AS Performance, 
CASE WHEN b.Produced > 0 THEN (b.Produced - b.Scrap) * 1.0 / b.Produced ELSE NULL END AS Quality, 
CASE WHEN b.PlanPositions > 0 AND ct.TheoricPerShiftTotal > 0 AND b.Produced > 0 THEN (((CASE WHEN b.Produced > 0 THEN 28800.0 ELSE 0 END) / 28800.0) * (b.ActualCycles * 1.0 / (ct.TheoricPerShift*b.PlanPositions)) * ((b.Produced - b.Scrap) 
* 1.0 / b.Produced)*(b.PlanPositions * 1.0 / ct.AvailablePositions)) ELSE 0 END AS OEE
FROM  Base AS b LEFT OUTER JOIN
dbo.ProductionLineParameter AS ct ON b.Year = ct.Year AND b.Month = ct.Month1 AND b.Line = ct.Line