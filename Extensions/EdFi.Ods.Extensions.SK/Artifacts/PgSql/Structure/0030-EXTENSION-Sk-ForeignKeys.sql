ALTER TABLE sk.SpecialEducationProgramDescriptor ADD CONSTRAINT FK_32084c_Descriptor FOREIGN KEY (SpecialEducationProgramDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentLanguageInstructionProgramAssociationExtension ADD CONSTRAINT FK_438c5c_StudentLanguageInstructionProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentLanguageInstructionProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_LocalEducationAgency FOREIGN KEY (ResidentLocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_880cb1_LocalEducationAgency
ON sk.StudentSchoolAssociationExtension (ResidentLocalEducationAgencyId ASC);

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_School FOREIGN KEY (ResidentSchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_880cb1_School
ON sk.StudentSchoolAssociationExtension (ResidentSchoolId ASC);

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_School1 FOREIGN KEY (ReportingSchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_880cb1_School1
ON sk.StudentSchoolAssociationExtension (ReportingSchoolId ASC);

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE sk.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

