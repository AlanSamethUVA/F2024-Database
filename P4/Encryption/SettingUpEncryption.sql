CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StudentIDEncryption!'; 

CREATE CERTIFICATE Certificate
	WITH SUBJECT = 'Certificate for Student ID Encryption';

CREATE SYMMETRIC KEY Stud_Key
	WITH ALGORITHM = AES_256
	ENCRYPTION BY CERTIFICATE Certificate; 
