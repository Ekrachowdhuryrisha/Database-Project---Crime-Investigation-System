create database crime_investigation
use crime_investigation
CREATE TABLE Police_Station (
  station_id varchar(20) Primary Key,
  station_name varchar(50),
  address varchar(50),
  contact_number varchar(20)
);
CREATE TABLE Police_Officer (
  officer_id varchar(20) Primary Key,
  officer_name varchar(50),
  rank varchar(20),
   station_id varchar(20),
  contact_number varchar(20),
  email varchar(50),
  foreign key (station_id) references Police_Station (station_id)
);
CREATE TABLE Station_vehicle (
  vehicle_id varchar(20) Primary Key,
  station_id varchar(20),
  officer_id varchar(20),
  vehicle_type varchar(20),
  license_plate varchar(30),
  availability_status varchar(20),
  foreign key (station_id) references Police_Station (station_id),
  foreign key (officer_id) references Police_Officer (officer_id)
);
CREATE TABLE Complainant (
  complainant_id varchar(20) Primary Key,
  name varchar(50),
  contact_number varchar(20),
  address varchar(50),
  email varchar(50)
);
CREATE TABLE GD (
  gd_id varchar(20) Primary Key,
  date_recorded date,
  time_recorded time,
  assigned_officer_id varchar(20),
  description varchar(1500),
  station_id varchar(20),
  complainant_id varchar(20),
  foreign key (assigned_officer_id) references Police_Officer(officer_id),
  foreign key (station_id) references Police_Station (station_id),
  foreign key (complainant_id) references Complainant (complainant_id)
);

CREATE TABLE Victim (
  victim_id varchar(20) Primary Key,
  name varchar(50),
  description varchar(1500),
  address varchar(50),
  email varchar(50),
  contact_number varchar(20)
);

CREATE TABLE Criminal (
  criminal_id varchar(20) Primary Key,
  name varchar(50),
  alias varchar(50),
  date_of_birth date
);

CREATE TABLE Suspect (
  suspect_id varchar(20) Primary Key,
  name varchar(50),
  date_of_birth date
);

CREATE TABLE Witness (
  witness_id varchar(20) Primary Key,
  name varchar(30),
  statement varchar(1500),
  address varchar(50),
 contact_number varchar(20),
);

CREATE TABLE Evidence (
  evidence_id varchar(20) Primary Key,
  type varchar(20),
  description varchar(1500),
  collected_by varchar(20),
  collection_date date,
  foreign key (collected_by) references Police_Officer (officer_id)
);

CREATE TABLE Court (
  court_id varchar(20) Primary key,
  court_name varchar(30),
  address varchar(50)
);

CREATE TABLE Hearing (
  hearing_id varchar(20) Primary Key,
  date_of_hearing date,
  verdict varchar(1500),
  judge_name varchar(50),
  court_id varchar(20),
  
  foreign key (court_id) references Court (court_id)
  

);

CREATE TABLE Case_status (
  status_id varchar(20) Primary Key,
  status_description varchar(1500),
  date_updated date
);


CREATE TABLE FIR(

fir_id varchar(20) Primary Key,
 date_reported date,
 time_reported time,
 assigned_officer_id varchar(20),
 station_id varchar(20),
 complainant_id varchar(20),
 description varchar(1500),
 foreign key (assigned_officer_id) references Police_Officer (officer_id),
 foreign key (complainant_id)references Complainant (complainant_id),
  foreign key (station_id) references Police_Station (station_id)


);

CREATE TABLE Case_(
  case_id varchar(20) Primary Key,
  fir_id varchar(20) ,
  case_type varchar(20),
  description varchar(1500),
  
  start_date date,
  end_date date,
  
  
  
  case_status_id varchar(20),
  hearing_id varchar(20),
  
  evidence_id varchar(20),
  foreign key (fir_id) references FIR (fir_id),
  
  foreign key (case_status_id) references Case_status (status_id),
  foreign key (hearing_id) references Hearing (hearing_id),
  
   foreign key (evidence_id) references Evidence (evidence_id)

);

CREATE TABLE Investigation_team (
  team_id varchar(20) Primary Key,
  team_name varchar(100),
  team_leader_id varchar(20),
  team_member_id varchar(20),
  case_id varchar(20),

  foreign key (team_leader_id) references Police_Officer (officer_id),
  foreign key (team_member_id) references Police_Officer (officer_id),
  foreign key (case_id) references Case_ (case_id), 
);

CREATE TABLE Case_Police_Officer (
  case_id varchar(20),
  officer_id varchar(20),
  PRIMARY KEY (case_id, officer_id),
  FOREIGN KEY (case_id) REFERENCES Case_ (case_id),
  FOREIGN KEY (officer_id) REFERENCES Police_Officer (officer_id)
);

CREATE TABLE Case_Victim (
  case_id varchar(20),
  victim_id varchar(20),
  PRIMARY KEY (case_id, victim_id),
  FOREIGN KEY (case_id) REFERENCES Case_ (case_id),
  FOREIGN KEY (victim_id) REFERENCES Victim (victim_id)
);


CREATE TABLE Case_Suspect (
  case_id varchar(20),
  suspect_id varchar(20),
  PRIMARY KEY (case_id, suspect_id),
  FOREIGN KEY (case_id) REFERENCES Case_ (case_id),
  FOREIGN KEY (suspect_id) REFERENCES Suspect (suspect_id)
);


CREATE TABLE Case_Witness (
  case_id varchar(20),
  witness_id varchar(20),
  PRIMARY KEY (case_id, witness_id),
  FOREIGN KEY (case_id) REFERENCES Case_ (case_id),
  FOREIGN KEY (witness_id) REFERENCES Witness (witness_id)
);

CREATE TABLE Suspect_Hearing (
  suspect_id varchar(20),
  hearing_id varchar(20),
  PRIMARY KEY (suspect_id, hearing_id),
  FOREIGN KEY (suspect_id) REFERENCES Suspect (suspect_id),
  FOREIGN KEY (hearing_id) REFERENCES Hearing (hearing_id)
);

CREATE TABLE Criminal_Hearing (
  criminal_id varchar(20),
  hearing_id varchar(20),
  PRIMARY KEY (criminal_id, hearing_id),
  FOREIGN KEY (criminal_id) REFERENCES Criminal (criminal_id),
  FOREIGN KEY (hearing_id) REFERENCES Hearing (hearing_id)
);

INSERT INTO Police_Station VALUES
('PS001', 'Motijheel Police Station', 'Dhaka, Bangladesh', '01711000001'),
('PS002', 'Kotwali Police Station', 'Chattogram, Bangladesh', '01711000002'),
('PS003', 'Zindabazar Police Station', 'Sylhet, Bangladesh', '01711000003'),
('PS004', 'Shaheb Bazar Police Station', 'Rajshahi, Bangladesh', '01711000004'),
('PS005', 'Daulatpur Police Station', 'Khulna, Bangladesh', '01711000005'),
('PS006', 'New Market Police Station', 'Barishal, Bangladesh', '01711000006'),
('PS007', 'Ganginarpar Police Station', 'Mymensingh, Bangladesh', '01711000007'),
('PS008', 'Modern More Police Station', 'Rangpur, Bangladesh', '01711000008'),
('PS009', 'Kandirpar Police Station', 'Comilla, Bangladesh', '01711000009'),
('PS010', 'Tongi Police Station', 'Gazipur, Bangladesh', '01711000010');



INSERT INTO Police_Officer VALUES
('PO001', 'Md. Rafiqul Islam', 'Inspector', 'PS001', '01712000001', 'rafiqul.islam@police.gov.bd'),
('PO002', 'Sharmin Akter', 'Sub-Inspector', 'PS002', '01712000002', 'sharmin.akter@police.gov.bd'),
('PO003', 'Zahid Hasan', 'Sergeant', 'PS003', '01712000003', 'zahid.hasan@police.gov.bd'),
('PO004', 'Nasrin Sultana', 'Inspector', 'PS004', '01712000004', 'nasrin.sultana@police.gov.bd'),
('PO005', 'Kamrul Hasan', 'Inspector', 'PS005', '01712000005', 'kamrul.hasan@police.gov.bd'),
('PO006', 'Taslima Jahan', 'Sergeant', 'PS006', '01712000006', 'taslima.jahan@police.gov.bd'),
('PO007', 'Abdullah Al Mamun', 'Sub-Inspector', 'PS007', '01712000007', 'abdullah.mamun@police.gov.bd'),
('PO008', 'Mahbub Alam', 'Inspector', 'PS008', '01712000008', 'mahbub.alam@police.gov.bd'),
('PO009', 'Nusrat Jahan', 'Inspector', 'PS009', '01712000009', 'nusrat.jahan@police.gov.bd'),
('PO010', 'Sajid Hossain', 'Sergeant', 'PS010', '01712000010', 'sajid.hossain@police.gov.bd');


INSERT INTO Station_vehicle VALUES
('V001', 'PS001', 'PO001', 'Patrol Car', 'DM-1001', 'Available'),
('V002', 'PS002', 'PO002', 'Motorcycle', 'CTG-2002', 'Available'),
('V003', 'PS003', 'PO003', 'Van', 'SYL-3003', 'Unavailable'),
('V004', 'PS004', 'PO004', 'Jeep', 'RAJ-4004', 'Available'),
('V005', 'PS005', 'PO005', 'Truck', 'KHU-5005', 'Available'),
('V006', 'PS006', 'PO006', 'Patrol Car', 'BAR-6006', 'Unavailable'),
('V007', 'PS007', 'PO007', 'Motorcycle', 'MYM-7007', 'Available'),
('V008', 'PS008', 'PO008', 'Jeep', 'RAN-8008', 'Unavailable'),
('V009', 'PS009', 'PO009', 'Van', 'COM-9009', 'Available'),
('V010', 'PS010', 'PO010', 'Patrol Car', 'GAZ-1010', 'Available');


INSERT INTO Complainant VALUES
-- FIR Related
('C001', 'Abdur Rahim', '01812000001', 'Dhaka, Bangladesh', 'rahim@example.com'),
('C002', 'Hasina Akter', '01812000002', 'Chittagong, Bangladesh', 'hasina@example.com'),
('C003', 'Karim Ahmed', '01812000003', 'Sylhet, Bangladesh', 'karim@example.com'),
('C004', 'Sharif Uddin', '01812000004', 'Rajshahi, Bangladesh', 'sharif@example.com'),
('C005', 'Salma Begum', '01812000005', 'Khulna, Bangladesh', 'salma@example.com'),
('C006', 'Anisur Rahman', '01812000006', 'Barishal, Bangladesh', 'anisur@example.com'),
('C007', 'Afroza Khan', '01812000007', 'Mymensingh, Bangladesh', 'afroza@example.com'),
('C008', 'Jahangir Alam', '01812000008', 'Rangpur, Bangladesh', 'jahangir@example.com'),
('C009', 'Sumaiya Islam', '01812000009', 'Comilla, Bangladesh', 'sumaiya@example.com'),
('C010', 'Fahim Hossain', '01812000010', 'Gazipur, Bangladesh', 'fahim@example.com'),
-- GD Related
('C011', 'Motiur Rahman', '01812000011', 'Dhaka, Bangladesh', 'motiur@example.com'),
('C012', 'Jahanara Begum', '01812000012', 'Chittagong, Bangladesh', 'jahanara@example.com'),
('C013', 'Rashidul Islam', '01812000013', 'Sylhet, Bangladesh', 'rashidul@example.com'),
('C014', 'Farhana Sultana', '01812000014', 'Rajshahi, Bangladesh', 'farhana@example.com'),
('C015', 'Nazmul Huda', '01812000015', 'Khulna, Bangladesh', 'nazmul@example.com'),
('C016', 'Sabina Yasmin', '01812000016', 'Barishal, Bangladesh', 'sabina@example.com'),
('C017', 'Tariqul Islam', '01812000017', 'Mymensingh, Bangladesh', 'tariqul@example.com'),
('C018', 'Nurjahan Begum', '01812000018', 'Rangpur, Bangladesh', 'nurjahan@example.com'),
('C019', 'Shahadat Hossain', '01812000019', 'Comilla, Bangladesh', 'shahadat@example.com'),
('C020', 'Rabeya Sultana', '01812000020', 'Gazipur, Bangladesh', 'rabeya@example.com');


INSERT INTO GD VALUES
('GD001', '2024-11-01', '10:30:00', 'PO001', 'Missing person reported', 'PS001', 'C011'),
('GD002', '2024-11-02', '14:15:00', 'PO002', 'Lost mobile phone', 'PS002', 'C012'),
('GD003', '2024-11-03', '09:00:00', 'PO003', 'Dispute with neighbor', 'PS003', 'C013'),
('GD004', '2024-11-04', '12:45:00', 'PO004', 'Vandalism complaint', 'PS004', 'C014'),
('GD005', '2024-11-05', '11:20:00', 'PO005', 'Theft of personal items', 'PS005', 'C015'),
('GD006', '2024-11-06', '16:10:00', 'PO006', 'Noise disturbance', 'PS006', 'C016'),
('GD007', '2024-11-07', '08:50:00', 'PO007', 'Damage to vehicle', 'PS007', 'C017'),
('GD008', '2024-11-08', '13:30:00', 'PO008', 'Lost documents', 'PS008', 'C018'),
('GD009', '2024-11-09', '10:00:00', 'PO009', 'Threatening phone calls', 'PS009', 'C019'),
('GD010', '2024-11-10', '15:00:00', 'PO010', 'Trespassing complaint', 'PS010', 'C020');


INSERT INTO FIR VALUES
('FIR001', '2024-11-01', '11:00:00', 'PO001', 'PS001', 'C001', 'Robbery at a jewelry store'),
('FIR002', '2024-11-02', '14:45:00', 'PO002', 'PS002', 'C002', 'Assault incident in a market'),
('FIR003', '2024-11-03', '09:30:00', 'PO003', 'PS003', 'C003', 'Burglary at residential area'),
('FIR004', '2024-11-04', '13:00:00', 'PO004', 'PS004', 'C004', 'Fraudulent transactions reported'),
('FIR005', '2024-11-05', '10:00:00', 'PO005', 'PS005', 'C005', 'Homicide case investigation'),
('FIR006', '2024-11-06', '17:00:00', 'PO006', 'PS006', 'C006', 'Vehicle theft in parking lot'),
('FIR007', '2024-11-07', '12:00:00', 'PO007', 'PS007', 'C007', 'Domestic violence reported'),
('FIR008', '2024-11-08', '15:30:00', 'PO008', 'PS008', 'C008', 'Cybercrime - data breach'),
('FIR009', '2024-11-09', '11:30:00', 'PO009', 'PS009', 'C009', 'Kidnapping incident'),
('FIR010', '2024-11-10', '16:00:00', 'PO010', 'PS010', 'C010', 'Drug trafficking operation');


INSERT INTO Victim VALUES
('V001', 'Rahim Uddin', 'Victim of jewelry store robbery', 'Dhaka, Bangladesh', 'rahim.uddin@example.com', '01822000001'),
('V002', 'Hasina Banu', 'Victim of assault', 'Chittagong, Bangladesh', 'hasina.banu@example.com', '01822000002'),
('V003', 'Karimullah', 'Victim of residential burglary', 'Sylhet, Bangladesh', 'karimullah@example.com', '01822000003'),
('V004', 'Sharifa Khatun', 'Victim of fraud', 'Rajshahi, Bangladesh', 'sharifa.khatun@example.com', '01822000004'),
('V005', 'Salim Reza', 'Victim of homicide', 'Khulna, Bangladesh', 'salim.reza@example.com', '01822000005'),
('V006', 'Anis Ahmed', 'Victim of vehicle theft', 'Barishal, Bangladesh', 'anis.ahmed@example.com', '01822000006'),
('V007', 'Afroza Begum', 'Victim of domestic violence', 'Mymensingh, Bangladesh', 'afroza.begum@example.com', '01822000007'),
('V008', 'Jahangir Kabir', 'Victim of cybercrime', 'Rangpur, Bangladesh', 'jahangir.kabir@example.com', '01822000008'),
('V009', 'Sumaiya Rahman', 'Victim of kidnapping', 'Comilla, Bangladesh', 'sumaiya.rahman@example.com', '01822000009'),
('V010', 'Fahim Hasan', 'Victim of drug trafficking', 'Gazipur, Bangladesh', 'fahim.hasan@example.com', '01822000010');


INSERT INTO Criminal VALUES
('CR001', 'Abul Kalam', 'Kala Bhai', '1980-01-15'),
('CR002', 'Bashir Ahmed', 'Bashu', '1975-02-10'),
('CR003', 'Shahidul Islam', 'Shahid', '1982-03-25'),
('CR004', 'Salma Khatun', 'Sumi', '1985-04-30'),
('CR005', 'Jalil Uddin', 'Jallu', '1978-05-20'),
('CR006', 'Kamrul Hasan', 'Kamal', '1980-06-18'),
('CR007', 'Taslima Rahman', 'Tasha', '1983-07-12'),
('CR008', 'Jahangir Hossain', 'Jango', '1979-08-05'),
('CR009', 'Nurul Islam', 'Nuru', '1981-09-14'),
('CR010', 'Rakib Hossain', 'Raki', '1984-10-22');


INSERT INTO Suspect VALUES
('S001', 'Abul Kalam', '1980-01-15'),
('S002', 'Bashir Ahmed', '1975-02-10'),
('S003', 'Shahidul Islam', '1982-03-25'),
('S004', 'Salma Khatun', '1985-04-30'),
('S005', 'Jalil Uddin', '1978-05-20'),
('S006', 'Kamrul Hasan', '1980-06-18'),
('S007', 'Taslima Rahman', '1983-07-12'),
('S008', 'Jahangir Hossain', '1979-08-05'),
('S009', 'Nurul Islam', '1981-09-14'),
('S010', 'Rakib Hossain', '1984-10-22');


INSERT INTO Witness VALUES
('W001', 'Motiur Rahman', 'Saw the robbery at Dhaka', 'Dhaka, Bangladesh', '01832000001'),
('W002', 'Jahanara Begum', 'Witnessed assault in Chittagong', 'Chittagong, Bangladesh', '01832000002'),
('W003', 'Rashidul Islam', 'Neighbor of burglary victim', 'Sylhet, Bangladesh', '01832000003'),
('W004', 'Farhana Sultana', 'Observed fraudulent activities', 'Rajshahi, Bangladesh', '01832000004'),
('W005', 'Nazmul Huda', 'Saw homicide incident', 'Khulna, Bangladesh', '01832000005'),
('W006', 'Sabina Yasmin', 'Reported vehicle theft', 'Barishal, Bangladesh', '01832000006'),
('W007', 'Tariqul Islam', 'Witnessed domestic violence', 'Mymensingh, Bangladesh', '01832000007'),
('W008', 'Nurjahan Begum', 'Reported cybercrime', 'Rangpur, Bangladesh', '01832000008'),
('W009', 'Shahadat Hossain', 'Witnessed kidnapping', 'Comilla, Bangladesh', '01832000009'),
('W010', 'Rabeya Sultana', 'Reported drug trafficking', 'Gazipur, Bangladesh', '01832000010');


INSERT INTO Evidence VALUES
('E001', 'Photograph', 'Photo of the scene of the robbery at the jewelry store', 'PO001', '2024-11-01'),
('E002', 'Document', 'Medical report of the assault victim in Chittagong', 'PO002', '2024-11-02'),
('E003', 'Fingerprint', 'Fingerprint found at the burglary site in Sylhet', 'PO003', '2024-11-03'),
('E004', 'Video', 'Surveillance footage of the fraudulent transaction', 'PO004', '2024-11-04'),
('E005', 'Weapon', 'Knife used in the homicide case', 'PO005', '2024-11-05'),
('E006', 'Vehicle', 'Stolen car found during vehicle theft investigation', 'PO006', '2024-11-06'),
('E007', 'Document', 'Domestic violence complaint letter', 'PO007', '2024-11-07'),
('E008', 'Digital', 'Hard drive containing cybercrime data', 'PO008', '2024-11-08'),
('E009', 'Witness Testimony', 'Testimony of witness to the kidnapping incident', 'PO009', '2024-11-09'),
('E010', 'Drugs', 'Drug packets recovered from drug trafficking investigation', 'PO010', '2024-11-10');


INSERT INTO Court VALUES
('C001', 'Dhaka High Court', 'Dhaka, Bangladesh'),
('C002', 'Chittagong District Court', 'Chittagong, Bangladesh'),
('C003', 'Sylhet District Court', 'Sylhet, Bangladesh'),
('C004', 'Rajshahi Court', 'Rajshahi, Bangladesh'),
('C005', 'Khulna District Court', 'Khulna, Bangladesh'),
('C006', 'Barishal District Court', 'Barishal, Bangladesh'),
('C007', 'Mymensingh Court', 'Mymensingh, Bangladesh'),
('C008', 'Rangpur Court', 'Rangpur, Bangladesh'),
('C009', 'Comilla District Court', 'Comilla, Bangladesh'),
('C010', 'Gazipur District Court', 'Gazipur, Bangladesh');

INSERT INTO Hearing (hearing_id, date_of_hearing, verdict, judge_name, court_id)
VALUES
('H001', '2024-12-01', 'Guilty, sentenced to 10 years in prison', 'Judge Rashed', 'C001'),
('H002', '2024-12-02', 'Acquitted, insufficient evidence', 'Judge Nasim', 'C002'),
('H003', '2024-12-03', 'Guilty, sentenced to 5 years in prison', 'Judge Tariq', 'C003'),
('H004', '2024-12-04', 'Guilty, fined and sentenced to 2 years in prison', 'Judge Munir', 'C004'),
('H005', '2024-12-05', 'Acquitted, insufficient evidence', 'Judge Sabina', 'C005'),
('H006', '2024-12-06', 'Guilty, sentenced to 7 years in prison', 'Judge Alim', 'C006'),
('H007', '2024-12-07', 'Guilty, sentenced to 3 years in prison', 'Judge Saleha', 'C007'),
('H008', '2024-12-08', 'Acquitted, insufficient evidence', 'Judge Zubair', 'C008'),
('H009', '2024-12-09', 'Guilty, sentenced to life imprisonment', 'Judge Asma', 'C009'),
('H010', '2024-12-10', 'Acquitted, lack of evidence', 'Judge Khalid', 'C010');






INSERT INTO Case_status VALUES
('CS001', 'Ongoing Investigation', '2024-11-10'),
('CS002', 'Under Trial', '2024-11-15'),
('CS003', 'Closed - No evidence', '2024-11-20'),
('CS004', 'Sentenced', '2024-12-05'),
('CS005', 'Acquitted', '2024-12-07'),
('CS006', 'Under Investigation', '2024-12-10'),
('CS007', 'Under Review', '2024-12-15'),
('CS008', 'Appealed', '2024-12-20'),
('CS009', 'In Trial', '2024-12-22'),
('CS010', 'Case Discontinued', '2024-12-25');

INSERT INTO Case_ (case_id, fir_id, case_type, description, start_date, end_date, case_status_id, hearing_id, evidence_id)
VALUES
('C001', 'FIR001', 'Robbery', 'Robbery at a jewelry store in Dhaka', '2024-11-01', '2024-11-20', 'CS001', 'H001', 'E001'),
('C002', 'FIR002', 'Assault', 'Assault incident in a market in Chittagong', '2024-11-02', '2024-11-18', 'CS002', 'H002', 'E002'),
('C003', 'FIR003', 'Burglary', 'Burglary at a residential area in Sylhet', '2024-11-03', '2024-11-17', 'CS003', 'H003', 'E003'),
('C004', 'FIR004', 'Fraud', 'Fraudulent transactions in Rajshahi', '2024-11-04', '2024-11-25', 'CS004', 'H004', 'E004'),
('C005', 'FIR005', 'Homicide', 'Homicide case in Khulna', '2024-11-05', '2024-11-30', 'CS005', 'H005', 'E005'),
('C006', 'FIR006', 'Vehicle Theft', 'Vehicle theft in Barishal', '2024-11-06', '2024-11-20', 'CS006', 'H006', 'E006'),
('C007', 'FIR007', 'Domestic Violence', 'Domestic violence case in Mymensingh', '2024-11-07', '2024-11-19', 'CS007', 'H007', 'E007'),
('C008', 'FIR008', 'Cybercrime', 'Cybercrime involving data breach', '2024-11-08', '2024-11-21', 'CS008', 'H008', 'E008'),
('C009', 'FIR009', 'Kidnapping', 'Kidnapping case in Comilla', '2024-11-09', '2024-11-22', 'CS009', 'H009', 'E009'),
('C010', 'FIR010', 'Drug Trafficking', 'Drug trafficking case in Gazipur', '2024-11-10', '2024-11-23', 'CS010', 'H010', 'E010');

INSERT INTO Investigation_team VALUES
('T001', 'Dhaka Major Crimes Unit', 'PO001', 'PO002', 'C001'),
('T002', 'Chattogram Special Assault Unit', 'PO003', 'PO004', 'C002'),
('T003', 'Sylhet Property Crimes Division', 'PO005', 'PO006', 'C003'),
('T004', 'Rajshahi Financial Fraud Unit', 'PO007', 'PO008', 'C004'),
('T005', 'Khulna Homicide Investigation Team', 'PO009', 'PO010', 'C005'),
('T006', 'Barishal Auto Theft Taskforce', 'PO001', 'PO002', 'C006'),
('T007', 'Mymensingh Family Protection Unit', 'PO003', 'PO004', 'C007'),
('T008', 'Rangpur Digital Forensics Unit', 'PO005', 'PO006', 'C008'),
('T009', 'Comilla Anti-Kidnapping Squad', 'PO007', 'PO008', 'C009'),
('T010', 'Gazipur Narcotics Control Taskforce', 'PO009', 'PO010', 'C010');

INSERT INTO FIR (fir_id, date_reported, time_reported, assigned_officer_id, station_id, complainant_id, description) VALUES
('FIR011', '2024-11-15', '21:00:00', 'PO001', 'PS001', 'C011', 'Armed robbery at a bank in Motijheel involving Md. Jashim Uddin'),
('FIR012', '2024-11-16', '23:30:00', 'PO002', 'PS002', 'C012', 'Attempted murder in Kotwali area involving Rahima Begum');

INSERT INTO Victim (victim_id, name, description, address, email, contact_number) VALUES
('V011', 'Md. Jashim Uddin', 'Victim of armed robbery at a bank', 'Motijheel, Dhaka, Bangladesh', 'jashim.uddin@example.com', '01723000011'),
('V012', 'Rahima Begum', 'Victim of attempted murder', 'Kotwali, Chattogram, Bangladesh', 'rahima.begum@example.com', '01723000012');

INSERT INTO Case_Police_Officer (case_id, officer_id) VALUES
('C001', 'PO001'),
('C002', 'PO002'),
('C003', 'PO003'),
('C004', 'PO004'),
('C005', 'PO005'),
('C006', 'PO006'),
('C007', 'PO007'),
('C008', 'PO008'),
('C009', 'PO009'),
('C010', 'PO010');

INSERT INTO Case_Victim (case_id, victim_id) VALUES
('C001', 'V001'),
('C002', 'V002'),
('C003', 'V003'),
('C004', 'V004'),
('C005', 'V005'),
('C006', 'V006'),
('C007', 'V007'),
('C008', 'V008'),
('C009', 'V009'),
('C010', 'V010');

INSERT INTO Case_Witness (case_id, witness_id) VALUES
('C001', 'W001'),
('C002', 'W002'),
('C003', 'W003'),
('C004', 'W004'),
('C005', 'W005'),
('C006', 'W006'),
('C007', 'W007'),
('C008', 'W008'),
('C009', 'W009'),
('C010', 'W010');

INSERT INTO Case_Suspect (case_id, suspect_id) VALUES
('C001', 'S001'),
('C002', 'S002'),
('C003', 'S003'),
('C004', 'S004'),
('C005', 'S005'),
('C006', 'S006'),
('C007', 'S007'),
('C008', 'S008'),
('C009', 'S009'),
('C010', 'S010');

INSERT INTO Suspect_Hearing (hearing_id, suspect_id) VALUES
('H001', 'S001'),
('H002', 'S002'),
('H003', 'S003'),
('H004', 'S004'),
('H005', 'S005'),
('H006', 'S006'),
('H007', 'S007'),
('H008', 'S008'),
('H009', 'S009'),
('H010', 'S010');

INSERT INTO Criminal_Hearing (hearing_id, criminal_id) VALUES
('H001', 'CR001'),
('H002', 'CR002'),
('H003', 'CR003'),
('H004', 'CR004'),
('H005', 'CR005'),
('H006', 'CR006'),
('H007', 'CR007'),
('H008', 'CR008'),
('H009', 'CR009'),
('H010', 'CR010');

----1. Retreieve all cases from the database.

SELECT * from Case_

--2. Retreieve all police officers from the database

SELECT * FROM Police_Officer


--3. List all cases with their assigned officer names:

SELECT Case_.case_id , police_officer.officer_name,Case_.case_type 
FROM police_officer, case_, Case_Police_Officer
WHERE Case_Police_Officer.case_id = case_.case_id
AND Case_Police_Officer.officer_id = police_officer.officer_id;

 --4.Calculate the Average Number of Victims Involved in Cases

SELECT AVG(victim_count) AS avg_victims_per_case
FROM (
    SELECT case_id, COUNT(victim_id) AS victim_count
    FROM Case_Victim
    GROUP BY case_id
) AS case_victims;


--5. Count the total number of FIRs:

SELECT COUNT(*) AS total_firs 
FROM FIR;


--6. List all vehicles that are unavailable or not assigned to a station:

SELECT vehicle_id, vehicle_type, license_plate 
FROM Station_vehicle 
WHERE availability_status = 'Unavailable'
UNION 
SELECT vehicle_id, vehicle_type, license_plate 
FROM Station_vehicle 
WHERE station_id IS NULL;


--7. Find all complainants who have not filed any FIR.
SELECT complainant_id, name 
FROM Complainant 
WHERE complainant_id NOT IN (
    SELECT complainant_id 
    FROM FIR
);

--8.Find suspects who have not been found guilty.

SELECT s.suspect_id, s.name 
FROM Suspect s, Suspect_Hearing sh, Hearing h
WHERE s.suspect_id = sh.suspect_id 
  AND sh.hearing_id = h.hearing_id
  AND s.suspect_id NOT IN (
      SELECT sh.suspect_id
      FROM Suspect_Hearing sh, Hearing h
      WHERE sh.hearing_id = h.hearing_id 
        AND h.verdict LIKE '%Guilty%'
  );

--9. Retrieve all police officers from "Dhaka, Bangladesh".
SELECT officer_name, rank, contact_number 
FROM Police_Officer 
WHERE station_id IN (
    SELECT station_id 
    FROM Police_Station 
    WHERE address LIKE '%Dhaka%'
);


-- 10. Find all available vehicles and their station names 

SELECT sv.vehicle_id, sv.vehicle_type, sv.license_plate, ps.station_name 
FROM Station_vehicle sv, Police_Station ps
WHERE sv.station_id = ps.station_id AND sv.availability_status = 'Available';

--11. List all FIRs along with the name of the complainant.
SELECT fir_id, date_reported, description, 
       (SELECT name 
        FROM Complainant 
        WHERE Complainant.complainant_id = FIR.complainant_id) AS complainant_name
FROM FIR;

-- 12. Retrieve the details of all cases involving a specific victim ("Rahim Uddin").

SELECT c.case_id, c.case_type, c.case_status_id, c.start_date 
FROM Case_ c, Case_Victim cv, Victim v 
WHERE c.case_id = cv.case_id 
  AND cv.victim_id = v.victim_id 
  AND v.name = 'Rahim Uddin';

  -- 13. Count the total number of FIRs filed by each complainant.
SELECT complainant_id, 
       (SELECT name FROM Complainant WHERE complainant_id = FIR.complainant_id) AS complainant_name, 
       COUNT(*) AS total_firs
FROM FIR
GROUP BY complainant_id;

-- 14. Find the list of cases assigned to an officer named "Shamim Ahmed".

SELECT c.case_id, c.case_type, c.start_date 
FROM Case_ c, Case_Police_Officer cpo, Police_Officer po 
WHERE c.case_id = cpo.case_id 
  AND cpo.officer_id = po.officer_id 
  AND po.officer_name = 'Sharmin Akter';

-- 15. find the police officer names 
--who have been assigned to a robbery related case

SELECT police_officer.officer_name,Case_.case_type
FROM police_officer, case_, Case_Police_Officer
WHERE case_.case_type = 'robbery'
AND Case_Police_Officer.case_id = case_.case_id
AND Case_Police_Officer.officer_id = police_officer.officer_id;


--View 1 : FIRs with Complainant Details
CREATE VIEW FIRWithComplainants AS
SELECT 
    fir.fir_id,
    fir.date_reported,
    fir.description,
    c.name AS complainant_name
FROM 
    FIR fir, 
    Complainant c
WHERE 
    fir.complainant_id = c.complainant_id;


--View 2 : Available Vehicles with Station Details
	CREATE VIEW AvailableVehicles AS
SELECT 
    sv.vehicle_id,
    sv.vehicle_type,
    sv.license_plate,
    ps.station_name
FROM 
    Station_Vehicle sv, 
    Police_Station ps
WHERE 
    sv.station_id = ps.station_id
    AND sv.availability_status = 'Available';


	SELECT vehicle_id, vehicle_type, license_plate
FROM Station_vehicle
WHERE availability_status = 'Available';

SELECT po.officer_name, po.rank
FROM Police_Officer po, Police_Station ps
WHERE po.station_id = ps.station_id 
  AND ps.station_name = 'chottogram';

  SELECT f.fir_id, f.date_reported, f.description, c.name AS complainant_name
FROM FIR f
JOIN Complainant c ON f.complainant_id = c.complainant_id;
