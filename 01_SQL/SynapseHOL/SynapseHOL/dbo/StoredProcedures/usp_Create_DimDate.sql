CREATE PROCEDURE [dbo].[usp_Create_DimDate]
	@startDateYYYYMMDD nvarchar(10),
	@endDateYYYYMMDD nvarchar(10)
AS
BEGIN
    --DECLARE @startDateYYYYMMDD nvarchar(10) = '20200101'
	--DECLARE @endDateYYYYMMDD nvarchar(10)= '20200131'
    SET LANGUAGE Japanese; 
    SET DATEFIRST 7;
    SET DATEFORMAT ymd;
    DECLARE @startDate date = CONVERT(date,@startDateYYYYMMDD,112)
    DECLARE @endDate date = CONVERT(date,@endDateYYYYMMDD,112)
    --DECLARE @CutoffDate DATE = DATEADD(YEAR, @NumberOfYears, @startDate);

	IF OBJECT_ID(N'DimDate') IS NOT NULL
    BEGIN
	    DROP TABLE  [DimDate]
	END

    -- -- use the catalog views to generate as many rows as we need
    CREATE TABLE [dbo].[DimDate] WITH (DISTRIBUTION = REPLICATE)
    AS
    SELECT 
		convert(int ,convert(nvarchar(10),[date],112)) AS [Datekey]  ,
        [Date],
        DAY([date]) AS [Day],
		LEFT(DATENAME(WEEKDAY,[date]),1) AS [Weekday]  ,
       ((ABS(DAY([date])+DATEPART(WEEKDAY,EOMONTH(DATEADD(m,-1,[date]))))+1 )/7) + 1 AS  [WeekOfMonth],
        DATEPART(WEEK,[date]) AS [WeekOfYear],
        FORMAT([date],'MM') AS [Month] ,
        FORMAT([date],'yyyy MM')AS [YYYY MM] ,
        YEAR([date]) AS [CalendarYear] ,
        concat(DATEPART(QUARTER,    dateadd(month,-3,[date])),'Q') AS [FiscalQuarter],
        concat(YEAR(DATEADD(MONTH,-3,[date])),' ',DATEPART(QUARTER,    dateadd(month,-3,[date])),'Q') AS [FiscalYearQuarter],
        CASE WHEN DATEPART(MONTH,DATEADD(MONTH,-3,[date]))>6
                          THEN  concat(2,'H')
								          ELSE  concat(1,'H')
								         END AS [FiscalHalf]  ,
        CASE WHEN DATEPART(MONTH,DATEADD(MONTH,-3,[date]))>6
                          THEN  concat(YEAR(DATEADD(MONTH,-3,[date])),' ',2,'H')
								          ELSE  concat(YEAR(DATEADD(MONTH,-3,[date])),' ',1,'H')
								         END AS [Fiscal_Year_Half],
        YEAR(DATEADD(MONTH,-3,[date])) AS [FiscalYear]
    FROM
    (
    SELECT [date] = DATEADD(DAY, rn - 1, @startDate)
    FROM 
    (
        SELECT TOP (DATEDIFF(DAY, @startDate, @endDate)+1) 
        rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
        FROM sys.all_objects AS s1
        CROSS JOIN sys.all_objects AS s2
        ORDER BY s1.[object_id]
    ) AS x
    ) AS y;

END
