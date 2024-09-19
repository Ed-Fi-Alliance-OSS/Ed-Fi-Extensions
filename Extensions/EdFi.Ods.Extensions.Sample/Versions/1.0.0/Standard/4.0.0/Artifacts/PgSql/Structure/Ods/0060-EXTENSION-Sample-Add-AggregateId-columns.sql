-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE SEQUENCE sample.bus_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE sample.Bus ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('sample.bus_aggseq');
CREATE INDEX ix_bus_aggid ON sample.Bus (AggregateId);

CREATE SEQUENCE sample.busroute_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE sample.BusRoute ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('sample.busroute_aggseq');
CREATE INDEX ix_busroute_aggid ON sample.BusRoute (AggregateId);

CREATE SEQUENCE sample.studentgraduationplanassociation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE sample.StudentGraduationPlanAssociation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('sample.studentgraduationplanassociation_aggseq');
CREATE INDEX ix_studentgraduationplanassociation_aggid ON sample.StudentGraduationPlanAssociation (AggregateId);
