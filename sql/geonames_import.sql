create table geonames (
geonameid numeric primary key,        -- integer id of record in geonames database
name text,              -- name of geographical point (utf8) varchar(200)
asciiname text,        -- name of geographical point in plain ascii characters, varchar(200)
alternatenames text,   -- alternatenames, comma separated, ascii names automatically transliterated, convenience attribute from alternatename table, varchar(10000)
latitude numeric,         -- latitude in decimal degrees (wgs84)
longitude numeric,        -- longitude in decimal degrees (wgs84)
feature_class char(1),    -- see http--//www.geonames.org/export/codes.html, char(1)
feature_code text,     -- see http--//www.geonames.org/export/codes.html, varchar(10)
country_code text,     -- ISO-3166 2-letter country code, 2 characters
cc2 text,              -- alternate country codes, comma separated, ISO-3166 2-letter country code, 200 characters
admin1_code text,       -- fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)
admin2_code text,      -- code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)
admin3_code text,      -- code for third level administrative division, varchar(20)
admin4_code text,      -- code for fourth level administrative division, varchar(20)
population numeric,       -- bigint (8 byte int)
elevation numeric,        -- in meters, integer
dem numeric,             -- digital elevation model, srtm3 or gtopo30, average elevation of 3''x3'' (ca 90mx90m) or 30''x30'' (ca 900mx900m) area in meters, integer. srtm processed by cgiar/ciat.
timezone text,         -- the timezone id (see file timeZone.txt) varchar(40)
modification_date date -- date of last modification in yyyy-MM-dd format
);


-- copy geonames from '/path/to/geonames/import/cc.txt' with null '';

