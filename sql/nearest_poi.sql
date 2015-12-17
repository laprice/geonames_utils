--function to find the nearest poi to point
create or replace function nearest_poi (location geometry(Point,4326)) returns integer
       as 'select geonameid from poi_names order by geom <-> location limit 1'
       language sql
       returns null on null input;
