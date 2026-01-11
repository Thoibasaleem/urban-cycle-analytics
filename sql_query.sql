WITH cte AS (
    SELECT *
    FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT *
    FROM dbo.bike_share_yr_1
)
SELECT
    a.dteday,
    a.season,
    a.yr,
    a.weekday,
    a.hr,
    a.rider_type,
    a.riders,
    b.price,
    b.COGS,
    (a.riders * b.price) AS revenue,
    (a.riders * b.price - b.COGS) AS profit
FROM cte AS a
LEFT JOIN dbo.cost_table AS b
    ON a.yr = b.yr;
