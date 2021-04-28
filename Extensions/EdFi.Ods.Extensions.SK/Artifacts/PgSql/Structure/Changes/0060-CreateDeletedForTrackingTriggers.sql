CREATE FUNCTION tracked_deletes_sk.AssessmentAdministration_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.AssessmentAdministration(AssessmentIdentifier, EducationOrganizationId, Namespace, Id, ChangeVersion)
    VALUES (OLD.AssessmentIdentifier, OLD.EducationOrganizationId, OLD.Namespace, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.AssessmentAdministration 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.AssessmentAdministration_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.CrisisDetails_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.CrisisDetails(CrisisEventDescriptorId, Id, ChangeVersion)
    VALUES (OLD.CrisisEventDescriptorId, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.CrisisDetails 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.CrisisDetails_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.CrisisEventDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.CrisisEventDescriptor(CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT OLD.CrisisEventDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CrisisEventDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.CrisisEventDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.CrisisEventDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.CrisisTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.CrisisTypeDescriptor(CrisisTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.CrisisTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.CrisisTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.CrisisTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.CrisisTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.DualCreditDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.DualCreditDescriptor(DualCreditDescriptorId, Id, ChangeVersion)
    SELECT OLD.DualCreditDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.DualCreditDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.DualCreditDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.DualCreditDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.EarlyLearningSettingDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.EarlyLearningSettingDescriptor(EarlyLearningSettingDescriptorId, Id, ChangeVersion)
    SELECT OLD.EarlyLearningSettingDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.EarlyLearningSettingDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.EarlyLearningSettingDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.EarlyLearningSettingDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.ImmigrantIndicatorDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.ImmigrantIndicatorDescriptor(ImmigrantIndicatorDescriptorId, Id, ChangeVersion)
    SELECT OLD.ImmigrantIndicatorDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.ImmigrantIndicatorDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.ImmigrantIndicatorDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.ImmigrantIndicatorDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.PlacementTypeDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.PlacementTypeDescriptor(PlacementTypeDescriptorId, Id, ChangeVersion)
    SELECT OLD.PlacementTypeDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PlacementTypeDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.PlacementTypeDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.PlacementTypeDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.PositionTitleDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.PositionTitleDescriptor(PositionTitleDescriptorId, Id, ChangeVersion)
    SELECT OLD.PositionTitleDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PositionTitleDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.PositionTitleDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.PositionTitleDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.PostGraduateActivityDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.PostGraduateActivityDescriptor(PostGraduateActivityDescriptorId, Id, ChangeVersion)
    SELECT OLD.PostGraduateActivityDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PostGraduateActivityDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.PostGraduateActivityDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.PostGraduateActivityDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.PostGraduateActivityDeterminationDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.PostGraduateActivityDeterminationDescriptor(PostGraduateActivityDeterminationDescriptorId, Id, ChangeVersion)
    SELECT OLD.PostGraduateActivityDeterminationDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.PostGraduateActivityDeterminationDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.PostGraduateActivityDeterminationDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.PostGraduateActivityDeterminationDescriptor_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.PostGraduateActivity_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.PostGraduateActivity(LocalEducationAgencyId, SchoolYear, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.LocalEducationAgencyId, OLD.SchoolYear, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.PostGraduateActivity 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.PostGraduateActivity_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.SectionDeliveryDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.SectionDeliveryDescriptor(SectionDeliveryDescriptorId, Id, ChangeVersion)
    SELECT OLD.SectionDeliveryDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.SectionDeliveryDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.SectionDeliveryDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.SectionDeliveryDescriptor_TR_DelTrkg();

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

CREATE FUNCTION tracked_deletes_sk.StudentEarlyLearningProgramAssociation_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.StudentEarlyLearningProgramAssociation(BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT OLD.BeginDate, OLD.EducationOrganizationId, OLD.ProgramEducationOrganizationId, OLD.ProgramName, OLD.ProgramTypeDescriptorId, OLD.StudentUSI, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.GeneralStudentProgramAssociation WHERE BeginDate = OLD.BeginDate AND EducationOrganizationId = OLD.EducationOrganizationId AND ProgramEducationOrganizationId = OLD.ProgramEducationOrganizationId AND ProgramName = OLD.ProgramName AND ProgramTypeDescriptorId = OLD.ProgramTypeDescriptorId AND StudentUSI = OLD.StudentUSI;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.StudentEarlyLearningProgramAssociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.StudentEarlyLearningProgramAssociation_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_sk.UnilateralRemovalDescriptor_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_sk.UnilateralRemovalDescriptor(UnilateralRemovalDescriptorId, Id, ChangeVersion)
    SELECT OLD.UnilateralRemovalDescriptorId, Id, nextval('changes.ChangeVersionSequence')
    FROM edfi.Descriptor WHERE DescriptorId = OLD.UnilateralRemovalDescriptorId;
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON sk.UnilateralRemovalDescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_sk.UnilateralRemovalDescriptor_TR_DelTrkg();

