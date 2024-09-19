-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE SEQUENCE homograph.name_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.Name ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.name_aggseq');
CREATE INDEX ix_name_aggid ON homograph.Name (AggregateId);

CREATE SEQUENCE homograph.parent_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.Parent ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.parent_aggseq');
CREATE INDEX ix_parent_aggid ON homograph.Parent (AggregateId);

CREATE SEQUENCE homograph.school_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.School ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.school_aggseq');
CREATE INDEX ix_school_aggid ON homograph.School (AggregateId);

CREATE SEQUENCE homograph.schoolyeartype_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.SchoolYearType ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.schoolyeartype_aggseq');
CREATE INDEX ix_schoolyeartype_aggid ON homograph.SchoolYearType (AggregateId);

CREATE SEQUENCE homograph.staff_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.Staff ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.staff_aggseq');
CREATE INDEX ix_staff_aggid ON homograph.Staff (AggregateId);

CREATE SEQUENCE homograph.student_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.Student ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.student_aggseq');
CREATE INDEX ix_student_aggid ON homograph.Student (AggregateId);

CREATE SEQUENCE homograph.studentschoolassociation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE homograph.StudentSchoolAssociation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('homograph.studentschoolassociation_aggseq');
CREATE INDEX ix_studentschoolassociation_aggid ON homograph.StudentSchoolAssociation (AggregateId);
