CREATE FUNCTION tracked_deletes_samplestudenttransportation.StudentTransportation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_samplestudenttransportation.StudentTransportation(AMBusNumber, PMBusNumber, SchoolId, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.AMBusNumber, OLD.PMBusNumber, OLD.SchoolId, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON samplestudenttransportation.StudentTransportation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_samplestudenttransportation.StudentTransportation_TR_DelTrkg();

