CREATE FUNCTION tracked_deletes_ne.CrisisDetails_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.CrisisDetails(CrisisEventDescriptorId, Id, ChangeVersion)
    VALUES (OLD.CrisisEventDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.CrisisDetails 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.CrisisDetails_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.CrisisEventDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.CrisisEventDescriptor(CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT OLD.CrisisEventDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CrisisEventDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.CrisisEventDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.CrisisEventDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.CrisisTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.CrisisTypeDescriptor(CrisisTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.CrisisTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CrisisTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.CrisisTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.CrisisTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.DualCreditDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.DualCreditDescriptor(DualCreditDescriptorId, Id, ChangeVersion)
    SELECT OLD.DualCreditDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DualCreditDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.DualCreditDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.DualCreditDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.EarlyLearningSettingDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.EarlyLearningSettingDescriptor(EarlyLearningSettingDescriptorId, Id, ChangeVersion)
    SELECT OLD.EarlyLearningSettingDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EarlyLearningSettingDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.EarlyLearningSettingDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.EarlyLearningSettingDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.ImmigrantIndicatorDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.ImmigrantIndicatorDescriptor(ImmigrantIndicatorDescriptorId, Id, ChangeVersion)
    SELECT OLD.ImmigrantIndicatorDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ImmigrantIndicatorDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.ImmigrantIndicatorDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.ImmigrantIndicatorDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.PlacementTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.PlacementTypeDescriptor(PlacementTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.PlacementTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PlacementTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.PlacementTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.PlacementTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.PositionTitleDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.PositionTitleDescriptor(PositionTitleDescriptorId, Id, ChangeVersion)
    SELECT OLD.PositionTitleDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PositionTitleDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.PositionTitleDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.PositionTitleDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.PostGraduateActivityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.PostGraduateActivityDescriptor(PostGraduateActivityDescriptorId, Id, ChangeVersion)
    SELECT OLD.PostGraduateActivityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PostGraduateActivityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.PostGraduateActivityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.PostGraduateActivityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.PostGraduateActivityDeterminationDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.PostGraduateActivityDeterminationDescriptor(PostGraduateActivityDeterminationDescriptorId, Id, ChangeVersion)
    SELECT OLD.PostGraduateActivityDeterminationDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PostGraduateActivityDeterminationDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.PostGraduateActivityDeterminationDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.PostGraduateActivityDeterminationDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.PostGraduateActivity_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.PostGraduateActivity(LocalEducationAgencyId, SchoolYear, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.LocalEducationAgencyId, OLD.SchoolYear, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.PostGraduateActivity 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.PostGraduateActivity_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.SectionDeliveryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.SectionDeliveryDescriptor(SectionDeliveryDescriptorId, Id, ChangeVersion)
    SELECT OLD.SectionDeliveryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SectionDeliveryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.SectionDeliveryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.SectionDeliveryDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.SpecialEducationProgramDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.SpecialEducationProgramDescriptor(SpecialEducationProgramDescriptorId, Id, ChangeVersion)
    SELECT OLD.SpecialEducationProgramDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SpecialEducationProgramDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.SpecialEducationProgramDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.SpecialEducationProgramDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.StudentEarlyLearningProgramAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.StudentEarlyLearningProgramAssociation(BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT OLD.BeginDate, OLD.EducationOrganizationId, OLD.ProgramEducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.StudentUSI, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.GeneralStudentProgramAssociation WHERE BeginDate = OLD.BeginDate AND EducationOrganizationId = OLD.EducationOrganizationId AND ProgramEducationOrganizationId = OLD.ProgramEducationOrganizationId AND ProgramName = OLD.ProgramName AND ProgramTypeDescriptorId = OLD.ProgramTypeDescriptorId AND StudentUSI = OLD.StudentUSI;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.StudentEarlyLearningProgramAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.StudentEarlyLearningProgramAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_ne.UnilateralRemovalDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_ne.UnilateralRemovalDescriptor(UnilateralRemovalDescriptorId, Id, ChangeVersion)
    SELECT OLD.UnilateralRemovalDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.UnilateralRemovalDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON ne.UnilateralRemovalDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_ne.UnilateralRemovalDescriptor_TR_DelTrkg();

