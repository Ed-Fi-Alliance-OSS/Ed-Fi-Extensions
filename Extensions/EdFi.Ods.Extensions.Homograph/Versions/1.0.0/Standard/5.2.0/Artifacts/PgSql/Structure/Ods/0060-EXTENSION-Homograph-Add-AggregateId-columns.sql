-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Create sequences, alter tables to add the AggregateId column, and create indexes in PostgreSQL

-- For the "Contact" table
CREATE SEQUENCE homograph.contact_aggseq START WITH -2147483648 INCREMENT BY 1;
ALTER TABLE homograph.contact ADD COLUMN aggregateid INT NOT NULL DEFAULT nextval('homograph.contact_aggseq');
CREATE INDEX ix_contact_aggregateid ON homograph.contact (aggregateid);

-- For the "Name" table
CREATE SEQUENCE homograph.name_aggseq START WITH -2147483648 INCREMENT BY 1;
ALTER TABLE homograph.name ADD COLUMN aggregateid INT NOT NULL DEFAULT nextval('homograph.name_aggseq');
CREATE INDEX ix_name_aggregateid ON homograph.name (aggregateid);

-- For the "School" table
CREATE SEQUENCE homograph.school_aggseq START WITH -2147483648 INCREMENT BY 1;
ALTER TABLE homograph.school ADD COLUMN aggregateid INT NOT NULL DEFAULT nextval('homograph.school_aggseq');
CREATE INDEX ix_school_aggregateid ON homograph.school (aggregateid);
