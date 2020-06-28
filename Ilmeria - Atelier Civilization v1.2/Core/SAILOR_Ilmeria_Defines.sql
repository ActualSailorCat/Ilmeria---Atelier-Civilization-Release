--=============================================
-- Ilmeria / Defines
--=============================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,						Kind)
VALUES	('LEADER_SAILOR_ILMERIA',	'KIND_LEADER');

-----------------------------------------------	
-- Leaders
-----------------------------------------------	
INSERT INTO Leaders	
		(LeaderType,				Name,								Sex,		InheritFrom,		SceneLayers)
VALUES	('LEADER_SAILOR_ILMERIA',	'LOC_LEADER_SAILOR_ILMERIA_NAME',	'Female',	'LEADER_DEFAULT',	4);	

-----------------------------------------------
-- CivilizationLeaders
-----------------------------------------------	
INSERT INTO CivilizationLeaders	
		(CivilizationType,				LeaderType,					CapitalName)
VALUES	('CIVILIZATION_SAILOR_ATLEER',	'LEADER_SAILOR_ILMERIA',	'LOC_CITY_NAME_SAILOR_FLUSSHEIM');

-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------	
INSERT INTO LeaderQuotes	
		(LeaderType,				Quote)
VALUES	('LEADER_SAILOR_ILMERIA',	'LOC_PEDIA_LEADERS_PAGE_LEADER_SAILOR_ILMERIA_QUOTE');	

-----------------------------------------------	
-- LoadingInfo
-----------------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,				BackgroundImage, 					ForegroundImage,					PlayDawnOfManAudio)
VALUES	('LEADER_SAILOR_ILMERIA',	'LEADER_SAILOR_ILMERIA_BACKGROUND',	'LEADER_SAILOR_ILMERIA_NEUTRAL',	0);	
