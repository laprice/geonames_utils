select geonameid, name, st_astext(geom), feature_class from poi_names
order by geom <-> st_geomfromtext('POINT($longitude $latitude)' , 4326)
limit 10;
--before index 12715.384 ms
-- after index 154.967 ms


--query by name ordered by nearest to location
select 
       geonameid,
       name, 
       feature_class, 
       elevation, 
       st_astext(geom) as point 
from poi_names 
where name_tsv @@ to_tsquery('$query') 
order by st_distance(geom,st_geomfromtext('POINT($longitude $latitude)', 4326)) 
limit 10;
-- note: text searches need to be built up properly and escaped using search
-- operators. Queries with spaces need each lexeme ANDed to the next
-- so "Seal Rock" needs to be passed as "seal & rock" to the to_tsquery function