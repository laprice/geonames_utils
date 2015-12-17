with poi_nearest as (
     select l.received, st_astext(l.geom) as point, nearest_poi(l.geom)
     from locations l
     where received is not null
     --fill in the where clause here to select by time 
) 
select n.received, n.point, p.name from poi_nearest n join poi_names p on n.nearest_poi=p.geonameid;
