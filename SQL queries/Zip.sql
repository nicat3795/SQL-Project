WITH T1 AS (
    SELECT
        pc.postcode GEO_PC_POSTCODE,
        r3.name_lang1 GEO_PC_CITY,
        r2.name_lang1 GEO_PC_STATE,
        Country.iso GEO_PC_ISO,
        Country.name_lang1 GEO_PC_COUNTRY,
        pp.timezone GEO_PC_POSTCODE_TIMEZONE,
        FORMAT(tz.u_dst_start_date, 'MM/dd/2023 hh:mm') DST_START_DATETIME,
        FORMAT(tz.u_dst_end_date, 'MM/dd/2023 hh:mm') DST_END_DATETIME,
        pp.DST GEO_PC_DST,
        pp.UTC GEO_PC_UST,
        'EN' LANGUAGE,
        'POSTCODE' ADMIN_DIV_TYPE
    FROM
        (SELECT iso, id, parent_id, name_lang1, region_type 
         FROM GeoPC.dbo.GeoPC_WO_Regions_NORM 
         WHERE level = '0') Country
    JOIN GeoPC.dbo.GeoPC_WO_regions_NORM r1 ON Country.id = r1.parent_id
    JOIN GeoPC.dbo.GeoPC_WO_regions_NORM r2 ON r1.id = r2.parent_id
    JOIN GeoPC.dbo.GeoPC_WO_regions_NORM r3 ON r2.id = r3.parent_id
    JOIN GeoPC.dbo.GeoPC_WO_places_NORM pp ON pp.region_id = r3.id
    JOIN GeoPC.dbo.GeoPC_WO_Places_Postcodes_NORM ppc ON pp.id = ppc.place_id
    JOIN GeoPC.dbo.GeoPC_WO_Postcodes_NORM pc ON ppc.postcode_id = pc.id
    JOIN GeoPC.dbo.u_time_zone_db tz ON UPPER(tz.u_time_zone) = UPPER(pp.timezone)
    WHERE Country.iso = 'RS'
)

SELECT DISTINCT
    GEO_PC_POSTCODE,
    GEO_PC_CITY,
    GEO_PC_STATE,
    GEO_PC_ISO, 
    GEO_PC_COUNTRY,
    GEO_PC_POSTCODE_TIMEZONE,
    DST_START_DATETIME,
    DST_END_DATETIME,
    GEO_PC_DST,
    GEO_PC_UST,
    'EN' LANGUAGE,
    'POSTCODE' ADMIN_DIV_TYPE
FROM T1
ORDER BY 
    GEO_PC_POSTCODE,
    GEO_PC_COUNTRY,
    GEO_PC_STATE;
