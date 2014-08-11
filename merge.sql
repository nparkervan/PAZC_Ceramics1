select max(versionnum), ismerged from version;

select * from user where userid = 7;



attach database '/media/brian/BrianBackup/PAZC/4/VanValk_Tablet4/db.sqlite3' as import;
select '4';

select uuid, aenttimestamp, userid from import.archentity
except
select uuid, aenttimestamp, userid from main.archentity;


select uuid, valuetimestamp, userid from import.aentvalue
except
select uuid, valuetimestamp, userid from main.aentvalue;

select uuid, relationshipid, aentrelntimestamp from import.aentreln
except
select uuid, relationshipid, aentrelntimestamp from main.aentreln;

detach database import;
attach database '/media/brian/BrianBackup/PAZC/3/Vanvalk_tablet3/db.sqlite3' as import;

select '3';
select uuid, aenttimestamp, userid from import.archentity
except
select uuid, aenttimestamp, userid from main.archentity;


select uuid, valuetimestamp, userid from import.aentvalue
except
select uuid, valuetimestamp, userid from main.aentvalue;

select uuid, relationshipid, aentrelntimestamp from import.aentreln
except
select uuid, relationshipid, aentrelntimestamp from main.aentreln;
detach database import;
attach database '/media/brian/BrianBackup/PAZC/2/Vanvalk_Tablet2/db.sqlite3' as import;

select '2';

select uuid, aenttimestamp, userid from import.archentity
except
select uuid, aenttimestamp, userid from main.archentity;


select uuid, valuetimestamp, userid from import.aentvalue
except
select uuid, valuetimestamp, userid from main.aentvalue;

select uuid, relationshipid, aentrelntimestamp from import.aentreln
except
select uuid, relationshipid, aentrelntimestamp from main.aentreln;

detach database import;
attach database '/media/brian/BrianBackup/PAZC/1/VanValk_tablet1/db.sqlite3' as import;
select '1';
select uuid, aenttimestamp, userid from import.archentity
except
select uuid, aenttimestamp, userid from main.archentity;


select uuid, valuetimestamp, userid from import.aentvalue
except
select uuid, valuetimestamp, userid from main.aentvalue;

select uuid, relationshipid, aentrelntimestamp from import.aentreln
except
select uuid, relationshipid, aentrelntimestamp from main.aentreln;

detach database import;
/*

select uuid, aenttimestamp, userid, doi, aenttypeid, deleted, 5111, isdirty, isdirtyreason, a.isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn
  from import.archentity
  left outer join (
    select uuid, i.aenttimestamp, 1 as isForked
      from main.archentity m join  import.archentity i using (uuid, parenttimestamp)
    where m.aenttimestamp != i.aenttimestamp) a using (uuid, aenttimestamp)
  except
  select uuid, aenttimestamp, userid, doi, aenttypeid, deleted, 5111, isdirty, isdirtyreason, isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn
  from main.archentity;


/*




insert or replace into version(versionnum, userid, ismerged) values(5111, 7, 1);



insert or replace into main.archentity (
         uuid, aenttimestamp, userid, doi, aenttypeid, deleted, versionnum, isdirty, isdirtyreason, isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn)
  select uuid, aenttimestamp, userid, doi, aenttypeid, deleted, 5111, isdirty, isdirtyreason, a.isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn
  from import.archentity
  left outer join (
		select uuid, i.aenttimestamp, 1 as isForked
		  from main.archentity m join  import.archentity i using (uuid, parenttimestamp)
		where m.aenttimestamp != i.aenttimestamp) a using (uuid, aenttimestamp)
  except
  select uuid, aenttimestamp, userid, doi, aenttypeid, deleted, 5111, isdirty, isdirtyreason, isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn
  from main.archentity;


insert into main.aentvalue (
         uuid, valuetimestamp, userid, attributeid, vocabid, freetext, measure, certainty, deleted, versionnum, isdirty, isdirtyreason, isforked, parenttimestamp)
  select uuid, valuetimestamp, userid, attributeid, vocabid, freetext, measure, certainty, deleted, 5111, isdirty, isdirtyreason, a.isforked, parenttimestamp
  from import.aentvalue
  left outer join (
		select uuid, attributeid, i.valuetimestamp, 1 as isForked
		  from main.aentvalue m join  import.aentvalue i using (uuid, attributeid, parenttimestamp)
		where m.valuetimestamp != i.valuetimestamp) a using (uuid, attributeid, valuetimestamp)
  except
  select uuid, valuetimestamp, userid, attributeid, vocabid, freetext, measure, certainty, deleted, 5111, isdirty, isdirtyreason, isforked, parenttimestamp
  from main.aentvalue;


insert into main.relationship (
         relationshipid, userid, relntimestamp, relntypeid, deleted, versionnum, isdirty, isdirtyreason, isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn)
  select relationshipid, userid, relntimestamp, relntypeid, deleted, 5111, isdirty, isdirtyreason, a.isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn
  from import.relationship
	  left outer join (
		select relationshipid, i.relntimestamp, 1 as isForked
		  from main.relationship m join  import.relationship i using (relationshipid, parenttimestamp)
		where m.relntimestamp != i.relntimestamp) a using (relationshipid, relntimestamp)
  except
  select relationshipid, userid, relntimestamp, relntypeid, deleted, 5111, isdirty, isdirtyreason, isforked, parenttimestamp, geospatialcolumntype, geospatialcolumn
  from main.relationship;


insert into main.relnvalue (
         relationshipid, relnvaluetimestamp, userid, attributeid, vocabid, freetext, certainty, deleted, versionnum, isdirty, isdirtyreason, isforked, parenttimestamp)
  select relationshipid, relnvaluetimestamp, userid, attributeid, vocabid, freetext, certainty, deleted, 5111, isdirty, isdirtyreason, a.isforked, parenttimestamp
  from import.relnvalue
  left outer join (
		select relationshipid, attributeid, i.relnvaluetimestamp, 1 as isForked
		  from main.relnvalue m join  import.relnvalue i using (relationshipid, attributeid, parenttimestamp)
		where m.relnvaluetimestamp != i.relnvaluetimestamp) a using (relationshipid, attributeid, relnvaluetimestamp)
  except
  select relationshipid, relnvaluetimestamp, userid, attributeid, vocabid, freetext, certainty, deleted, 5111, isdirty, isdirtyreason, isforked, parenttimestamp
  from main.relnvalue;


insert into main.aentreln (
         uuid, relationshipid, userid, aentrelntimestamp, participatesverb, deleted, versionnum, isdirty, isdirtyreason, isforked, parenttimestamp)
  select uuid, relationshipid, userid, aentrelntimestamp, participatesverb, deleted, 5111, isdirty, isdirtyreason, a.isforked, parenttimestamp
  from import.aentreln
	left outer join (
		select relationshipid, uuid, i.aentrelntimestamp, 1 as isForked
		  from main.aentreln m join  import.aentreln i using (relationshipid, uuid, parenttimestamp)
		where m.aentrelntimestamp != i.aentrelntimestamp) a using (relationshipid, uuid, aentrelntimestamp)
  except
  select uuid, relationshipid, userid, aentrelntimestamp, participatesverb, deleted, 5111, isdirty, isdirtyreason, isforked, parenttimestamp
  from main.aentreln;




/*
select uuid, attributeid, valuetimestamp from main.latestnondeletedaentvalue
except
select uuid, attributeid, valuetimestamp from import.latestnondeletedaentvalue;
*/

--detach database import;

