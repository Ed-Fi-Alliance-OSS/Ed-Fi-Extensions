CREATE FUNCTION tracked_deletes_sk.SpecialEducationProgramDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.SpecialEducationProgramDescriptor(SpecialEducationProgramDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEducationProgramDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEducationProgramDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.SpecialEducationProgramDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.SpecialEducationProgramDescriptor_TR_DelTrkg();

