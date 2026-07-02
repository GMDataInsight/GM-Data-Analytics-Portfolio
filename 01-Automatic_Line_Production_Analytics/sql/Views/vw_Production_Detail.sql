/*
==============================================================================
Project      : Automatic Production Line Analytics
Object       : vw_ProductionDetail
Type         : SQL View
Author       : Miroslav Grujic
Version      : 1.0

Description: Cleans and aggregates Production Data. Merges Quality, Production Data and Article Base

Output Grain:
Date + Shift + Production Line + Product + Tool
==============================================================================
*/

CREATE VIEW dbo.vw_Production_Detail
AS
WITH ProductionAgg AS (SELECT Year, Month, Week, Date, Shift, Line, ProductCode, Tool, SUM(Produced) AS Produced,mAX(OperatorRespID) AS RespID,max(Operator1ID) as Op1ID,max(Operator2ID) as Op2ID
FROM      dbo.ProductionData
GROUP BY Year, Month, Week, Date, Shift, Line, ProductCode, Tool), 
ScrapAgg AS
(SELECT Year, Month, Week, Date, Shift, Line, ProductCode, Tool, SUM(Total) AS Scrap
FROM      dbo.QualityData
GROUP BY Year, Month, Week, Date, Shift, Line, ProductCode, Tool)
SELECT COALESCE (p.Year, s.Year) AS Year, COALESCE (p.Month, s.Month) AS Month, COALESCE (p.Week, s.Week) AS Week, COALESCE (p.Date, s.Date) AS Date, COALESCE (p.Shift, s.Shift) AS Shift, 
COALESCE (p.Line, s.Line) AS Line,coalesce(p.respID,0) as RespID,coalesce(p.Op1ID,0) as Op1ID, coalesce(p.Op2ID,0) as Op2ID,
COALESCE (p.ProductCode, s.ProductCode) AS ProductCode, COALESCE (p.Tool, s.Tool) AS Tool, ISNULL(p.Produced, 0) AS Produced, ISNULL(s.Scrap, 0) AS Scrap, CASE WHEN ISNULL(b.ProductsPerTool, 0) > 0 THEN ISNULL(p.Produced, 0) 
* 1.0 / b.ProductsPertool ELSE 0 END AS ActualCycles, b.Weight AS PartWeight, b.Weight * ISNULL(p.Produced, 0) AS TotalWeight, b.Weight * (ISNULL(p.Produced, 0) - ISNULL(s.Scrap, 0)) AS GoodWeight, b.Weight * ISNULL(s.Scrap, 0) AS ScrapWeight
FROM     ProductionAgg AS p FULL OUTER JOIN
ScrapAgg AS s ON p.Date = s.Date AND p.Shift = s.Shift AND p.Line = s.Line AND p.ProductCode = s.ProductCode AND p.Tool = s.Tool LEFT OUTER JOIN
dbo.ArticleBase AS b ON COALESCE (p.ProductCode, s.ProductCode) = b.ProductCode