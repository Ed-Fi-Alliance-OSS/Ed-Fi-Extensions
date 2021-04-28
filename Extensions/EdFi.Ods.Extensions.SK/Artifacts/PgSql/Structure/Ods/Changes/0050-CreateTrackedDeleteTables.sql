CREATE TABLE tracked_deletes_sk.SpecialEducationProgramDescriptor
(
       SpecialEducationProgramDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialEducationProgramDescriptor_PK PRIMARY KEY (ChangeVersion)
);

