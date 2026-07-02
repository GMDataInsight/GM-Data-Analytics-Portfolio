/*
==============================================================================
Project      : Automatic Production Line Analytics
Object       : vw_ProductionPlanMain
Type         : SQL View
Author       : Miroslav Grujic
Version      : 1.0

Description:
Unpivots and standardizes production planning data.

Output Grain:
Date + Shift + Production Line + Product (Planned data)
==============================================================================
*/

CREATE VIEW dbo.vw_ProductionPlanMain
AS

WITH PlanRaw AS
(
    SELECT
        [Year],
        [Week],
        [Line],
        [Product],
        ShiftCode,
        PlannedPositions
    FROM dbo.ProductionPlan

    UNPIVOT
    (
        PlannedPositions
        FOR ShiftCode IN
        (
            MON1, MON2, MON3,
            TUE1, TUE2, TUE3,
            WED1, WED2, WED3,
            THU1, THU2, THU3,
            FRI1, FRI2, FRI3,
            SAT1, SAT2, SAT3
        )
    ) u
),

PlanMapped AS
(
    SELECT

        [Year],
        [Week],
        [Line],

        LEFT(ShiftCode,3) AS DOW,

        CASE RIGHT(ShiftCode,1)
            WHEN '1' THEN 'I'
            WHEN '2' THEN 'II'
            WHEN '3' THEN 'III'
        END AS Shift,

        PlannedPositions

    FROM PlanRaw
)

SELECT

    [Year],
    [Week],
    [Line],
    DOW,
    Shift,

    SUM(TRY_CAST(PlannedPositions AS INT)) AS PlanPositions

FROM PlanMapped

GROUP BY

    [Year],
    [Week],
    [Line],
    DOW,
    Shift;