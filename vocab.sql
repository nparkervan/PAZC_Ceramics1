select * from aentvalue limit 1;

SELECT uuid, attributeid, vocabid, attributename, vocabname, measure, freetext, certainty, attributetype, valuetimestamp, isDirty, isDirtyReason
    FROM aentvalue
    JOIN attributekey USING (attributeid) 
    LEFT OUTER JOIN vocabulary USING (vocabid, attributeid)
    JOIN (SELECT uuid, attributeid, valuetimestamp
            FROM aentvalue
            JOIN archentity USING (uuid)
           WHERE uuid = 1000081402709987741
        GROUP BY uuid, attributeid
          HAVING MAX(ValueTimestamp)
             AND MAX(AEntTimestamp)) USING (uuid, attributeid, valuetimestamp)
    WHERE deleted is NULl
 ORDER BY uuid, attributename ASC;


