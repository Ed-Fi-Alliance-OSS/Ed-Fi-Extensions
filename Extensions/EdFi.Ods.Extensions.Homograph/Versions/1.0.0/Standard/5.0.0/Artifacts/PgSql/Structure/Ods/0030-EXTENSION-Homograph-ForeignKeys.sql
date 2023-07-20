-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE homograph.Contact ADD CONSTRAINT FK_2b5c3d_Name FOREIGN KEY (ContactFirstName, ContactLastSurname)
REFERENCES homograph.Name (FirstName, LastSurname)
;

ALTER TABLE homograph.ContactAddress ADD CONSTRAINT FK_720058_Contact FOREIGN KEY (ContactFirstName, ContactLastSurname)
REFERENCES homograph.Contact (ContactFirstName, ContactLastSurname)
ON DELETE CASCADE
;

ALTER TABLE homograph.ContactStudentSchoolAssociation ADD CONSTRAINT FK_bf6531_Contact FOREIGN KEY (ContactFirstName, ContactLastSurname)
REFERENCES homograph.Contact (ContactFirstName, ContactLastSurname)
ON DELETE CASCADE
;

ALTER TABLE homograph.ContactStudentSchoolAssociation ADD CONSTRAINT FK_bf6531_StudentSchoolAssociation FOREIGN KEY (SchoolName, StudentFirstName, StudentLastSurname)
REFERENCES homograph.StudentSchoolAssociation (SchoolName, StudentFirstName, StudentLastSurname)
ON UPDATE CASCADE
;

ALTER TABLE homograph.School ADD CONSTRAINT FK_6cd2e3_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES homograph.SchoolYearType (SchoolYear)
;

ALTER TABLE homograph.SchoolAddress ADD CONSTRAINT FK_a09d7e_School FOREIGN KEY (SchoolName)
REFERENCES homograph.School (SchoolName)
ON DELETE CASCADE
;

ALTER TABLE homograph.Staff ADD CONSTRAINT FK_681927_Name FOREIGN KEY (StaffFirstName, StaffLastSurname)
REFERENCES homograph.Name (FirstName, LastSurname)
;

ALTER TABLE homograph.StaffAddress ADD CONSTRAINT FK_c0e4a3_Staff FOREIGN KEY (StaffFirstName, StaffLastSurname)
REFERENCES homograph.Staff (StaffFirstName, StaffLastSurname)
ON DELETE CASCADE
;

ALTER TABLE homograph.StaffStudentSchoolAssociation ADD CONSTRAINT FK_fec532_Staff FOREIGN KEY (StaffFirstName, StaffLastSurname)
REFERENCES homograph.Staff (StaffFirstName, StaffLastSurname)
ON DELETE CASCADE
;

ALTER TABLE homograph.StaffStudentSchoolAssociation ADD CONSTRAINT FK_fec532_StudentSchoolAssociation FOREIGN KEY (SchoolName, StudentFirstName, StudentLastSurname)
REFERENCES homograph.StudentSchoolAssociation (SchoolName, StudentFirstName, StudentLastSurname)
ON UPDATE CASCADE
;

ALTER TABLE homograph.Student ADD CONSTRAINT FK_2a164d_Name FOREIGN KEY (StudentFirstName, StudentLastSurname)
REFERENCES homograph.Name (FirstName, LastSurname)
;

ALTER TABLE homograph.Student ADD CONSTRAINT FK_2a164d_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES homograph.SchoolYearType (SchoolYear)
;

ALTER TABLE homograph.StudentAddress ADD CONSTRAINT FK_e70453_Student FOREIGN KEY (StudentFirstName, StudentLastSurname)
REFERENCES homograph.Student (StudentFirstName, StudentLastSurname)
ON DELETE CASCADE
;

ALTER TABLE homograph.StudentSchoolAssociation ADD CONSTRAINT FK_857b52_School FOREIGN KEY (SchoolName)
REFERENCES homograph.School (SchoolName)
;

ALTER TABLE homograph.StudentSchoolAssociation ADD CONSTRAINT FK_857b52_Student FOREIGN KEY (StudentFirstName, StudentLastSurname)
REFERENCES homograph.Student (StudentFirstName, StudentLastSurname)
;

