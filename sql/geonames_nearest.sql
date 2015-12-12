select geonameid, name, st_astext(geom), feature_class from poi_names
order by geom <-> st_geomfromtext('POINT($longitude $latitude)' , 4326)
limit 10;
--before index 12715.384 ms
-- after index 154.967 ms