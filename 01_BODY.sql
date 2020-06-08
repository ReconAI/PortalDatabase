CREATE TABLE "Organisations" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar(255) UNIQUE NOT NULL,
  "VAT" varchar(255),
  "main_firstname" varchar(255),
  "main_lastname" varchar(255),
  "main_address" varchar(255),
  "main_phone" varchar(255),
  "main_email" varchar(255),
  "inv_firstname" varchar(255),
  "inv_lastname" varchar(255),
  "inv_address" varchar(255),
  "inv_phone" varchar(255),
  "inv_email" varchar(255)
);

CREATE TABLE "Users" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "organizationId" int NOT NULL,
  "firstname" varchar(255),
  "lastname" varchar(255),
  "address" varchar(255),
  "phone" varchar(255),
  "email" varchar(255),
  "created_dt" timestamp DEFAULT (now()),
  "username" varchar(255) UNIQUE,
  "password" varchar(255),
  "user_level" varchar(3)
);

CREATE TABLE "Licenses" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "license_type" varchar(3),
  "price" varchar(255),
  "userId" int NOT NULL,
  "nextPayment" timestamp,
  "purchaseDate" timestamp,
  "terminationDate" timestamp
);

CREATE TABLE "Projects" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "decription" varchar,
  "organizationId" int,
  "ecosystemId" int,
  "featuremodelId" int,
  "status" varchar(255),
  "settingsJSON" json
);

CREATE TABLE "Ecosystems" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "organizationId" int NOT NULL
);

CREATE TABLE "EdgeNodes" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "organisationId" int NOT NULL,
  "featureModelsJSON" json,
  "featureInstancesJSON" json,
  "dockerInstanceId" int
);

CREATE TABLE "DeviceInstances" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "deviceClassId" int,
  "serial" int,
  "parametersJSON" json
);

CREATE TABLE "DeviceClasses" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "dockerBase" varchar,
  "deviceParameters" int
);

CREATE TABLE "DockerModels" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "dockerPayload" varchar,
  "version" int
);

CREATE TABLE "DockerInstances" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "dockerModelId" int,
  "version" int
);

CREATE TABLE "FeatureModels" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "description" varchar,
  "algClassSequenceJSON" json,
  "inputDeviceClassReqsJSON" json,
  "inputDeviceParamReqsJSON" json,
  "highLevelReqsJSON" json,
  "version" int
);

CREATE TABLE "FeatureInstances" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "projectId" int,
  "featureModelId" int,
  "highLevelFidelityJSON" json,
  "totalCompTime" int,
  "parentECUclass" int,
  "version" int
);

CREATE TABLE "AlgorithmModels" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "description" varchar,
  "preprocessor" varchar,
  "architectureId" int,
  "postprocessor" varchar,
  "payload" varchar,
  "HyperparameterStructureJSON" json,
  "ValidationStructureJSON" json,
  "class" varchar(3),
  "isTrainable" bool,
  "initWeightsId" int,
  "version" int
);

CREATE TABLE "AlgorithmInstances" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "projectId" int,
  "algorithmModelId" int,
  "weightId" int,
  "version" int,
  "status" varchar(3),
  "currentValidationJSON" json,
  "progressPercentage" int,
  "validationHistoryJSON" json,
  "creationDate" timestamp DEFAULT (now()),
  "trainingLog" varchar
);

CREATE TABLE "ObjectModels" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "description" varchar,
  "objectFile" varchar(255),
  "version" int
);

CREATE TABLE "Architectures" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "description" varchar,
  "payload" varchar,
  "version" int
);

CREATE TABLE "Weights" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "payload" varchar,
  "version" int
);

CREATE TABLE "ProjectInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "ProjectId" int,
  "dataAcqInstId" int,
  "annotInstId" int,
  "augmentInstId" int,
  "trainingInstrId" int,
  "validationInstrId" int,
  "version" int
);

CREATE TABLE "DataAcqInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "videoDownload" boolean,
  "videoDownloadParamsJSON" json,
  "realDataParamsJSON" json,
  "SDGone" boolean,
  "SDGoneParamsJSON" json
);

CREATE TABLE "AnnotationInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "outsourcedMetaJSON" json,
  "SDGtwo" boolean,
  "SDGtwoInstJSON" json
);

CREATE TABLE "OutsourcedInst" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "annotInstId" int,
  "questionXMLid" int,
  "frameDatasetId" int,
  "labelName" varchar(255),
  "labelDescription" varchar(255),
  "HITsetName" varchar(255),
  "HITsetDescription" varchar(255),
  "tOneMetadataJSON" json,
  "tTwoMetadataJSON" json
);

CREATE TABLE "QuestionXMLs" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "description" varchar,
  "answerFieldsJSON" json,
  "exampleFramesJSON" json,
  "tOneDirectPayload" varchar,
  "tTwoDirectPayload" varchar,
  "creationTime" timestamp,
  "questionTitle" varchar,
  "questionDescription" varchar,
  "questionInstText" varchar,
  "labelClassId" int,
  "labelClassArg" varchar,
  "labelClassConfArg" varchar
);

CREATE TABLE "HITsets" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "datasetId" int,
  "assocLabelsetId" int,
  "tOneWorkerBlacklistJSON" json,
  "name" varchar,
  "description" varchar,
  "status" varchar,
  "labelName" varchar,
  "labelDescription" varchar,
  "labelClass" int,
  "datasetName" varchar,
  "created_dt" timestamp,
  "timeRemaining" time,
  "HITpercentage" int,
  "succeeded" boolean,
  "tOneTotalDuration" int,
  "tOneTotalCost" varchar,
  "tTwoTotalDuration" int,
  "tTwoTotalCost" varchar,
  "totalDuration" int,
  "totalCost" varchar,
  "questionXMLid" int,
  "tOneMetadataJSON" json,
  "tTwoMetadataJSON" json
);

CREATE TABLE "LabelClasses" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "className" varchar(255),
  "classDescription" varchar(255),
  "UItool" varchar,
  "conflictDefinition" varchar(255),
  "isConflictArg" boolean,
  "isArgument" boolean,
  "argumentType" varchar(255),
  "structure" json
);

CREATE TABLE "Workers" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "associatedHITsetsJSON" json,
  "tOneAssignmentsDone" int,
  "tOneRating" real,
  "tTwoAssignmentsDone" int,
  "tTwoRating" real
);

CREATE TABLE "OperationInstances" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "frameDatasetId" int,
  "operationClassId" int,
  "parametersJSON" json,
  "ignoreOoB" boolean,
  "fillType" varchar
);

CREATE TABLE "OperationClasses" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "className" varchar,
  "argNamesJSON" json,
  "argTypesJSON" json,
  "framePayload" varchar,
  "labelPayload" varchar
);

CREATE TABLE "AugmentationInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "frameDatasetId" int,
  "projectId" int,
  "augOperationsJSON" json
);

CREATE TABLE "TrainingInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "dataSplitInst" int,
  "hyperparametersJSON" json
);

CREATE TABLE "QualityMetricStruct" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "Name" varchar(255),
  "Payload" varchar,
  "Type" varchar(255)
);

CREATE TABLE "DataSplitInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "metadataJSON" json
);

CREATE TABLE "ValidationInstructions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "metadataJSON" json
);

CREATE TABLE "RelevantData" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "deviceInstanceId" int,
  "projectId" int,
  "edgeNodeId" int,
  "featureModelId" int,
  "sensorGpsLat" decimal,
  "sensorGpsLong" decimal,
  "relDataType" varchar(255),
  "value" int,
  "objectModelId" int,
  "locationX" decimal,
  "locationY" decimal,
  "locationZ" decimal,
  "orientTheta" decimal,
  "orientPhi" decimal,
  "timestamp" timestamp DEFAULT (now()),
  "isTaggedData" bool,
  "taggedDataId" int,
  "parametersJSON" json
);

CREATE TABLE "Frames" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "frameFile" varchar(255),
  "timestamp" timestamp,
  "frameDatasetId" int,
  "isValidation" bool
);

CREATE TABLE "FrameDatasets" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar(255),
  "isContinuous" boolean,
  "timeStart" int,
  "timeEnd" int,
  "isLabeled" boolean,
  "VDLisDownloaded" boolean,
  "VDLaddress" varchar,
  "VDLtimestampFound" timestamp,
  "DataAcqInstructionsId" int,
  "augMetadataJSON" json
);

CREATE TABLE "LabelDatasets" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "parentFrameDatasetId" int,
  "labelName" varchar(255),
  "labelDescription" varchar,
  "parentAlgorithmModelId" int,
  "labelClass" int
);

CREATE TABLE "LabelData" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "dataProper" int,
  "labelDatasetId" int,
  "isVoid" bool,
  "parentFrame" int,
  "tOneHITid" varchar,
  "tTwoHITid" varchar
);

CREATE TABLE "DeviceParameters" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "isSensor" boolean,
  "isECU" boolean,
  "isCamera" boolean,
  "isLidar" boolean,
  "isIllu" boolean,
  "isThermal" boolean,
  "isRadar" boolean,
  "modelNumber" int,
  "manufacturer" varchar(255),
  "name" varchar(255),
  "email" varchar(255),
  "phone" int,
  "price" int,
  "DDPfin" int,
  "IPcode" varchar(255),
  "powerConsumption" int,
  "deviceSizeX" int,
  "deviceSizeY" int,
  "deviceSizeZ" int,
  "integratedMeasuresJSON" json,
  "cameraDataJSON" json,
  "ECUDataJSON" json,
  "lidarDataJSON" json,
  "illumDataJSON" json,
  "thermalDataJSON" json,
  "radarDataJSON" json,
  "PowerDataJSON" json,
  "OtherDataJSON" json
);

CREATE TABLE "TypeCode" (
  "typeName" varchar NOT NULL,
  "order" int,
  "value" varchar(3),
  "shortDescription" varchar(255),
  "longDescription" varchar(255),
  "created_dt" timestamp DEFAULT (now()),
  "created_by" varchar
);

CREATE TABLE "DetectedObjects" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "edgeNodeId" int,
  "objectType" varchar(3),
  "created_dt" timestamp DEFAULT (now()),
  "fileId" int,
  "parametersJSON" json
);

CREATE TABLE "EventsHistory" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "created_dt" timestamp DEFAULT (now()),
  "edgeNodeId" int,
  "eventType" varchar(3),
  "verificationResult" varchar(3),
  "parametersJSON" json
);

CREATE TABLE "DetectionsSummary" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "edgeNodeId" int,
  "observationDate" date DEFAULT (now()),
  "parametersJSON" json
);

CREATE TABLE "RoadConditions" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "edgeNodeId" int,
  "created_dt" timestamp DEFAULT (now()),
  "parametersJSON" json
);

CREATE TABLE "FileStorage" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "fileType" varchar(3),
  "link" varchar(255)
);

CREATE TABLE "ProjectEdgeNodes" (
  "projectId" int,
  "edgeNodeId" int
);

CREATE TABLE "EcosystemsEdgeNodes" (
  "ecosystemId" int,
  "edgeNodeId" int
);

CREATE TABLE "EdgeNodeDevices" (
  "edgeNodeId" int,
  "deviceInstanceId" int,
  "type" varchar(3)
);

CREATE TABLE "DockerModelDeviceClasses" (
  "dockerModelId" int,
  "deviceClassId" int,
  "type" varchar(3)
);

CREATE TABLE "DockerModelFeatureModel" (
  "dockerModelId" int,
  "featureModelId" int
);

CREATE TABLE "FeatureModelAlgorithm" (
  "featureModelId" int,
  "algorithmModelsId" int
);

CREATE TABLE "FeatureInstanceAlgorithm" (
  "featureInstanceId" int,
  "algorithmId" int
);

CREATE TABLE "AlgorithmInstanceObjectModel" (
  "algorithmInstanceId" int,
  "objectModelId" int
);

CREATE TABLE "AlgorithmInstanceTrainingInst" (
  "algorithmInstanceId" int,
  "trainingInstructionId" int
);

CREATE TABLE "AlgorithmInstanceDeployedDevices" (
  "algorithmInstanceId" int,
  "deployedDeviceInstanceId" int
);

CREATE TABLE "ObjectModelProject" (
  "objectModelId" int,
  "projectId" int
);

CREATE TABLE "ObjectModelFeatureModel" (
  "objectModelId" int,
  "featureModelId" int
);

CREATE TABLE "ObjectModelAlgorithmModel" (
  "objectModelId" int,
  "algorithmModelId" int
);

CREATE TABLE "OperationClassesSupportedLabelClasses" (
  "operationClassId" int,
  "labelClassId" int
);

CREATE TABLE "TrainingInstructionsLabelDatasets" (
  "TrainingInstId" int,
  "labelDatasetId" int
);

CREATE TABLE "FrameDatasetsProjects" (
  "frameDatasetId" int,
  "projectId" int
);

ALTER TABLE "Users" ADD FOREIGN KEY ("organizationId") REFERENCES "Organisations" ("id");

ALTER TABLE "Licenses" ADD FOREIGN KEY ("userId") REFERENCES "Users" ("id");

ALTER TABLE "Projects" ADD FOREIGN KEY ("organizationId") REFERENCES "Organisations" ("id");

ALTER TABLE "Projects" ADD FOREIGN KEY ("ecosystemId") REFERENCES "Ecosystems" ("id");

ALTER TABLE "Projects" ADD FOREIGN KEY ("featuremodelId") REFERENCES "FeatureModels" ("id");

ALTER TABLE "Ecosystems" ADD FOREIGN KEY ("organizationId") REFERENCES "Organisations" ("id");

ALTER TABLE "EdgeNodes" ADD FOREIGN KEY ("organisationId") REFERENCES "Organisations" ("id");

ALTER TABLE "EdgeNodes" ADD FOREIGN KEY ("dockerInstanceId") REFERENCES "DockerInstances" ("id");

ALTER TABLE "DeviceInstances" ADD FOREIGN KEY ("deviceClassId") REFERENCES "DeviceClasses" ("id");

ALTER TABLE "DeviceClasses" ADD FOREIGN KEY ("deviceParameters") REFERENCES "DeviceParameters" ("id");

ALTER TABLE "DockerInstances" ADD FOREIGN KEY ("dockerModelId") REFERENCES "DockerModels" ("id");

ALTER TABLE "FeatureInstances" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");

ALTER TABLE "FeatureInstances" ADD FOREIGN KEY ("featureModelId") REFERENCES "FeatureModels" ("id");

ALTER TABLE "FeatureInstances" ADD FOREIGN KEY ("parentECUclass") REFERENCES "DeviceClasses" ("id");

ALTER TABLE "AlgorithmModels" ADD FOREIGN KEY ("architectureId") REFERENCES "Architectures" ("id");

ALTER TABLE "AlgorithmModels" ADD FOREIGN KEY ("initWeightsId") REFERENCES "Weights" ("id");

ALTER TABLE "AlgorithmInstances" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");

ALTER TABLE "AlgorithmInstances" ADD FOREIGN KEY ("algorithmModelId") REFERENCES "AlgorithmModels" ("id");

ALTER TABLE "AlgorithmInstances" ADD FOREIGN KEY ("weightId") REFERENCES "Weights" ("id");

ALTER TABLE "ProjectInstructions" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("id");

ALTER TABLE "ProjectInstructions" ADD FOREIGN KEY ("dataAcqInstId") REFERENCES "DataAcqInstructions" ("id");

ALTER TABLE "ProjectInstructions" ADD FOREIGN KEY ("annotInstId") REFERENCES "AnnotationInstructions" ("id");

ALTER TABLE "ProjectInstructions" ADD FOREIGN KEY ("augmentInstId") REFERENCES "AugmentationInstructions" ("id");

ALTER TABLE "ProjectInstructions" ADD FOREIGN KEY ("trainingInstrId") REFERENCES "TrainingInstructions" ("id");

ALTER TABLE "ProjectInstructions" ADD FOREIGN KEY ("validationInstrId") REFERENCES "ValidationInstructions" ("id");

ALTER TABLE "OutsourcedInst" ADD FOREIGN KEY ("annotInstId") REFERENCES "AnnotationInstructions" ("id");

ALTER TABLE "OutsourcedInst" ADD FOREIGN KEY ("questionXMLid") REFERENCES "QuestionXMLs" ("id");

ALTER TABLE "OutsourcedInst" ADD FOREIGN KEY ("frameDatasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "QuestionXMLs" ADD FOREIGN KEY ("labelClassId") REFERENCES "LabelClasses" ("id");

ALTER TABLE "HITsets" ADD FOREIGN KEY ("datasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "HITsets" ADD FOREIGN KEY ("assocLabelsetId") REFERENCES "LabelDatasets" ("id");

ALTER TABLE "HITsets" ADD FOREIGN KEY ("questionXMLid") REFERENCES "QuestionXMLs" ("id");

ALTER TABLE "OperationInstances" ADD FOREIGN KEY ("frameDatasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "OperationInstances" ADD FOREIGN KEY ("operationClassId") REFERENCES "OperationClasses" ("id");

ALTER TABLE "AugmentationInstructions" ADD FOREIGN KEY ("frameDatasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "AugmentationInstructions" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");

ALTER TABLE "TrainingInstructions" ADD FOREIGN KEY ("dataSplitInst") REFERENCES "DataSplitInstructions" ("id");

ALTER TABLE "RelevantData" ADD FOREIGN KEY ("deviceInstanceId") REFERENCES "DeviceInstances" ("id");

ALTER TABLE "RelevantData" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");

ALTER TABLE "RelevantData" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "RelevantData" ADD FOREIGN KEY ("featureModelId") REFERENCES "FeatureModels" ("id");

ALTER TABLE "RelevantData" ADD FOREIGN KEY ("objectModelId") REFERENCES "ObjectModels" ("id");

ALTER TABLE "RelevantData" ADD FOREIGN KEY ("taggedDataId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "Frames" ADD FOREIGN KEY ("frameDatasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "FrameDatasets" ADD FOREIGN KEY ("DataAcqInstructionsId") REFERENCES "DataAcqInstructions" ("id");

ALTER TABLE "LabelDatasets" ADD FOREIGN KEY ("parentFrameDatasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "LabelDatasets" ADD FOREIGN KEY ("parentAlgorithmModelId") REFERENCES "AlgorithmModels" ("id");

ALTER TABLE "LabelDatasets" ADD FOREIGN KEY ("labelClass") REFERENCES "LabelClasses" ("id");

ALTER TABLE "LabelData" ADD FOREIGN KEY ("labelDatasetId") REFERENCES "LabelDatasets" ("id");

ALTER TABLE "LabelData" ADD FOREIGN KEY ("parentFrame") REFERENCES "Frames" ("id");

ALTER TABLE "DetectedObjects" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "DetectedObjects" ADD FOREIGN KEY ("fileId") REFERENCES "FileStorage" ("id");

ALTER TABLE "EventsHistory" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "DetectionsSummary" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "RoadConditions" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "ProjectEdgeNodes" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");

ALTER TABLE "ProjectEdgeNodes" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "EcosystemsEdgeNodes" ADD FOREIGN KEY ("ecosystemId") REFERENCES "Ecosystems" ("id");

ALTER TABLE "EcosystemsEdgeNodes" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "EdgeNodeDevices" ADD FOREIGN KEY ("edgeNodeId") REFERENCES "EdgeNodes" ("id");

ALTER TABLE "EdgeNodeDevices" ADD FOREIGN KEY ("deviceInstanceId") REFERENCES "DeviceInstances" ("id");

ALTER TABLE "DockerModelDeviceClasses" ADD FOREIGN KEY ("dockerModelId") REFERENCES "DockerModels" ("id");

ALTER TABLE "DockerModelDeviceClasses" ADD FOREIGN KEY ("deviceClassId") REFERENCES "DeviceClasses" ("id");

ALTER TABLE "DockerModelFeatureModel" ADD FOREIGN KEY ("dockerModelId") REFERENCES "DockerModels" ("id");

ALTER TABLE "DockerModelFeatureModel" ADD FOREIGN KEY ("featureModelId") REFERENCES "FeatureModels" ("id");

ALTER TABLE "FeatureModelAlgorithm" ADD FOREIGN KEY ("featureModelId") REFERENCES "FeatureModels" ("id");

ALTER TABLE "FeatureModelAlgorithm" ADD FOREIGN KEY ("algorithmModelsId") REFERENCES "AlgorithmModels" ("id");

ALTER TABLE "FeatureInstanceAlgorithm" ADD FOREIGN KEY ("featureInstanceId") REFERENCES "FeatureInstances" ("id");

ALTER TABLE "FeatureInstanceAlgorithm" ADD FOREIGN KEY ("algorithmId") REFERENCES "AlgorithmInstances" ("id");

ALTER TABLE "AlgorithmInstanceObjectModel" ADD FOREIGN KEY ("algorithmInstanceId") REFERENCES "AlgorithmInstances" ("id");

ALTER TABLE "AlgorithmInstanceObjectModel" ADD FOREIGN KEY ("objectModelId") REFERENCES "ObjectModels" ("id");

ALTER TABLE "AlgorithmInstanceTrainingInst" ADD FOREIGN KEY ("algorithmInstanceId") REFERENCES "AlgorithmInstances" ("id");

ALTER TABLE "AlgorithmInstanceTrainingInst" ADD FOREIGN KEY ("trainingInstructionId") REFERENCES "TrainingInstructions" ("id");

ALTER TABLE "AlgorithmInstanceDeployedDevices" ADD FOREIGN KEY ("algorithmInstanceId") REFERENCES "AlgorithmInstances" ("id");

ALTER TABLE "AlgorithmInstanceDeployedDevices" ADD FOREIGN KEY ("deployedDeviceInstanceId") REFERENCES "DeviceInstances" ("id");

ALTER TABLE "ObjectModelProject" ADD FOREIGN KEY ("objectModelId") REFERENCES "ObjectModels" ("id");

ALTER TABLE "ObjectModelProject" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");

ALTER TABLE "ObjectModelFeatureModel" ADD FOREIGN KEY ("objectModelId") REFERENCES "ObjectModels" ("id");

ALTER TABLE "ObjectModelFeatureModel" ADD FOREIGN KEY ("featureModelId") REFERENCES "FeatureModels" ("id");

ALTER TABLE "ObjectModelAlgorithmModel" ADD FOREIGN KEY ("objectModelId") REFERENCES "ObjectModels" ("id");

ALTER TABLE "ObjectModelAlgorithmModel" ADD FOREIGN KEY ("algorithmModelId") REFERENCES "AlgorithmModels" ("id");

ALTER TABLE "OperationClassesSupportedLabelClasses" ADD FOREIGN KEY ("operationClassId") REFERENCES "OperationClasses" ("id");

ALTER TABLE "OperationClassesSupportedLabelClasses" ADD FOREIGN KEY ("labelClassId") REFERENCES "LabelClasses" ("id");

ALTER TABLE "TrainingInstructionsLabelDatasets" ADD FOREIGN KEY ("TrainingInstId") REFERENCES "TrainingInstructions" ("id");

ALTER TABLE "TrainingInstructionsLabelDatasets" ADD FOREIGN KEY ("labelDatasetId") REFERENCES "LabelDatasets" ("id");

ALTER TABLE "FrameDatasetsProjects" ADD FOREIGN KEY ("frameDatasetId") REFERENCES "FrameDatasets" ("id");

ALTER TABLE "FrameDatasetsProjects" ADD FOREIGN KEY ("projectId") REFERENCES "Projects" ("id");
