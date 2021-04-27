CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON ne.AssessmentAdministration
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON ne.CrisisDetails
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON ne.PostGraduateActivity
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

