begin transaction;
create table poi_names (
       geonameid integer primary key,
       name text,
       feature_class char(1),
       elevation numeric);
select addGeometryColumn('poi_names', 'geom', 4326, 'POINT',2);

insert into poi_names 
       (geonameid, name, geom, feature_class, elevation) 
       (
       select 
       geonameid,
       name,
       st_setsrid(st_makepoint(longitude, latitude), 4326),
       feature_class,
       elevation
       from geonames
       );
commit transaction;

-- geometry index speeds up point lookups by an order of magnitude
create index poi_geom_index on poi_names using GIST ( geom );

--full text index on the names field for lookup by name
begin transaction;
alter table poi_names add column name_tsv tsvector;
update poi_names set name_tsv = to_tsvector('english', name);
commit transaction;
create index name_tsv_index on poi_names using gin(name_tsv);
