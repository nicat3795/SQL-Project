WITH T1 AS (
    SELECT DISTINCT
        Country.iso GEO_PC_ISO,
        Country.name_lang1 GEO_PC_COUNTRY,
        r2.name_lang1 GEO_PC_STATE,
        r3.name_lang1 GEO_PC_CITY,
        pp.timezone GEO_PC_CITY_TIMEZONE,
        pp.utc GEO_PC_UTC,
        pp.dst GEO_PC_DST,
        pp.timezone GEO_PC_STATE_TIMEZONE,
        FORMAT(tz.u_dst_start_date, 'MM/dd/2023 hh:mm') DST_START_DATETIME,
        FORMAT(tz.u_dst_end_date, 'MM/dd/2023 hh:mm') DST_END_DATETIME
    FROM 
        (SELECT iso, id, parent_id, name_lang1, region_type 
         FROM GeoPC.dbo.GeoPC_WO_Regions_NORM 
         WHERE parent_id IS NULL) Country
    JOIN GeoPC.dbo.GeoPC_WO_regions_NORM r1 ON Country.id = r1.parent_id
    LEFT JOIN GeoPC.dbo.GeoPC_WO_regions_NORM r2 ON r1.id = r2.parent_id
    LEFT JOIN GeoPC.dbo.GeoPC_WO_regions_NORM r3 ON r2.id = r3.parent_id
    LEFT JOIN GeoPC.dbo.GeoPC_WO_places_NORM pp ON pp.region_id = r3.id
    LEFT JOIN GeoPC.dbo.u_time_zone_db tz ON UPPER(tz.u_time_zone) = UPPER(pp.timezone)
    WHERE Country.iso = 'RS'
)

SELECT
    GEO_PC_ISO,
    GEO_PC_COUNTRY,
    GEO_PC_STATE,
    GEO_PC_CITY,
    GEO_PC_CITY_TIMEZONE,
    GEO_PC_UTC,
    GEO_PC_DST,
    GEO_PC_STATE_TIMEZONE,
    DST_START_DATETIME,
    DST_END_DATETIME,
    'City' ADMIN_DIV_TYPE,
    'EN' LANGUAGE
FROM T1
ORDER BY GEO_PC_STATE;
