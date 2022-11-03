DROP DATABASE FraudDB;
CREATE DATABASE FraudDB;

CREATE TABLE Provider (
BeneID varchar(50),
DOB date,
DOD date,
Sex int,
Race int,
RenalDiseaseIndicator varchar(2),
State int,
County int,
NoOfMonths_PartACov int,
NoOfMonths_PartBCov int,
ChronicCond_Alzheimer int,
ChronicCond_Heartfailure int,
ChronicCond_KidneyDisease int,
ChronicCond_Cancer int,
ChronicCond_ObstrPulmonary int,
ChronicCond_Depression int,
ChronicCond_Diabetes int,
ChronicCond_IschemicHeart int,
ChronicCond_Osteoporasis int,
ChronicCond_rheumatoidarthritis int,
ChronicCond_stroke int,
IPAnnualReimbursementAmt decimal(18,2),
IPAnnualDeductibleAmt decimal(18,2),
OPAnnualReimbursementAmt decimal(18,2),
OPAnnualDeductibleAmt decimal(18,2),
PRIMARY KEY (BeneID)
);

CREATE TABLE Fraud (
Provider varchar(50),
PotentialFraud varchar(10),
PRIMARY KEY (Provider)
);


CREATE TABLE InpatientData (
InpatientVisitID int,
BeneID varchar(50),
ClaimID varchar(50),
ClaimStartDt date,
ClaimEndDt date,
Provider varchar(50),
InscClaimAmtReimbursed decimal(18,2),
AttendingPhysician varchar(50),
OperatingPhysician varchar(50),
OtherPhysician varchar(50),
AdmissionDT date,
ClmAdmitDiagnosisCode varchar(50),
DeductibleAmtPaid decimal(18,2),
DischargeDt date,
DiagnosisGroupCode int,
ClmDiagnosisCode_1 varchar(12),
ClmDiagnosisCode_2 varchar(12),
ClmDiagnosisCode_3 varchar(12),
ClmDiagnosisCode_4 varchar(12),
ClmDiagnosisCode_5 varchar(12),
ClmDiagnosisCode_6 varchar(12),
ClmDiagnosisCode_7 varchar(12),
ClmDiagnosisCode_8 varchar(12),
ClmDiagnosisCode_9 varchar(12),
ClmDiagnosisCode_10 varchar(12),
ClmProcedureCode_1 varchar(12),
ClmProcedureCode_2 varchar(12),
ClmProcedureCode_3 varchar(12),
ClmProcedureCode_4 varchar(12),
ClmProcedureCode_5 varchar(12),
ClmProcedureCode_6 varchar(12),
PRIMARY KEY (InpatientVisitID)
);

CREATE TABLE OutpatientData (
OutpatientVisitID int,
BeneID varchar(50),
ClaimID varchar(50),
ClaimStartDt date,
ClaimEndDt date,
Provider varchar(50),
InscClaimAmtReimbursed decimal(18,2),
AttendingPhysician varchar(50),
OperatingPhysician varchar(50),
OtherPhysician varchar(50),
ClmDiagnosisCode_1 varchar(12),
ClmDiagnosisCode_2 varchar(12),
ClmDiagnosisCode_3 varchar(12),
ClmDiagnosisCode_4 varchar(12),
ClmDiagnosisCode_5 varchar(12),
ClmDiagnosisCode_6 varchar(12),
ClmDiagnosisCode_7 varchar(12),
ClmDiagnosisCode_8 varchar(12),
ClmDiagnosisCode_9 varchar(12),
ClmDiagnosisCode_10 varchar(12),
ClmProcedureCode_1 varchar(12),
ClmProcedureCode_2 varchar(12),
ClmProcedureCode_3 varchar(12),
ClmProcedureCode_4 varchar(12),
ClmProcedureCode_5 varchar(12),
ClmProcedureCode_6 varchar(12),
DeductibleAmtPaid decimal(18,2),
ClmAdmitDiagnosisCode varchar(50),
PRIMARY KEY (OutpatientVisitID)
);

ALTER TABLE InpatientData
ADD FOREIGN KEY (BeneID) REFERENCES Provider(BeneID),
ADD FOREIGN KEY (Provider) REFERENCES Fraud(Provider),
ADD FOREIGN KEY (AttendingPhysician) REFERENCES Fraud(Provider),
ADD FOREIGN KEY (OperatingPhysician) REFERENCES Fraud(Provider),
ADD FOREIGN KEY (OtherPhysician) REFERENCES Fraud(Provider);

ALTER TABLE OutpatientData
ADD FOREIGN KEY (BeneID) REFERENCES Provider(BeneID),
ADD FOREIGN KEY (Provider) REFERENCES Fraud(Provider),
ADD FOREIGN KEY (AttendingPhysician) REFERENCES Fraud(Provider),
ADD FOREIGN KEY (OperatingPhysician) REFERENCES Fraud(Provider),
ADD FOREIGN KEY (OtherPhysician) REFERENCES Fraud(Provider);