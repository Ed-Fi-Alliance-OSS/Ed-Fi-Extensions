CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON sk.AssessmentAdministration
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON sk.CrisisDetails
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON sk.PostGraduateActivity
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

