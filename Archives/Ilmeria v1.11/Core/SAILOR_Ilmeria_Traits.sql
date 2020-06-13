--=============================================
-- Ilmeria / Traits
--=============================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types 
		(Type,										Kind)
VALUES	('TRAIT_LEADER_SAILOR_ILMERIA_UA',			'KIND_TRAIT'),
		('DYNMOD_SAILOR_ILMERIA_TEACHING',			'KIND_MODIFIER');
-----------------------------------------------
-- Traits
-----------------------------------------------
INSERT INTO Traits
		(TraitType,									Name,												Description)
VALUES	('TRAIT_LEADER_SAILOR_ILMERIA_UA',			'LOC_TRAIT_LEADER_SAILOR_ILMERIA_UA_NAME',			'LOC_TRAIT_LEADER_SAILOR_ILMERIA_UA_DESCRIPTION');

-----------------------------------------------
-- LeaderTraits
-----------------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,						TraitType)
VALUES	('LEADER_SAILOR_ILMERIA',			'TRAIT_LEADER_SAILOR_ILMERIA_UA');

-----------------------------------------------			
-- TraitModifiers		
-----------------------------------------------	
CREATE TABLE IF NOT EXISTS Sailor_Ilmeria_Adjacencies (DistrictType text default NULL, YieldType text default NULL);
INSERT INTO Sailor_Ilmeria_Adjacencies
		(DistrictType,					YieldType)
VALUES	('DISTRICT_CAMPUS',				'YIELD_SCIENCE'),
		('DISTRICT_COMMERCIAL_HUB',		'YIELD_GOLD'),
		('DISTRICT_INDUSTRIAL_ZONE',	'YIELD_PRODUCTION');

INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
SELECT 'TRAIT_LEADER_SAILOR_ILMERIA_UA',	'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType
FROM Sailor_Ilmeria_Adjacencies;

-----------------------------------------------	
-- DynamicModifiers
-----------------------------------------------	
INSERT INTO DynamicModifiers
		(ModifierType,						CollectionType,					EffectType)
VALUES	('DYNMOD_SAILOR_ILMERIA_TEACHING',	'COLLECTION_PLAYER_CITIES',		'EFFECT_IMPROVEMENT_ADJACENCY');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,										ModifierType)
SELECT 'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType,	'DYNMOD_SAILOR_ILMERIA_TEACHING'
FROM Sailor_Ilmeria_Adjacencies;

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,										Name,			Value)
SELECT	'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType,	'Amount',		1
FROM Sailor_Ilmeria_Adjacencies;

INSERT INTO ModifierArguments
		(ModifierId,										Name,			Value)
SELECT	'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType,	'YieldType',	YieldType
FROM Sailor_Ilmeria_Adjacencies;

INSERT INTO ModifierArguments
		(ModifierId,										Name,				Value)
SELECT	'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType,	'ImprovementType',	'IMPROVEMENT_SAILOR_ATLEER_UI'
FROM Sailor_Ilmeria_Adjacencies;

INSERT INTO ModifierArguments
		(ModifierId,										Name,			Value)
SELECT	'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType,	'DistrictType',	DistrictType
FROM Sailor_Ilmeria_Adjacencies;

INSERT INTO ModifierArguments
		(ModifierId,										Name,			Value)
SELECT	'SAILOR_ILMERIA_UA_ATLEER_UI_ADJ_'||DistrictType,	'Description',	'LOC_SAILOR_ILMERIA_UA_'||DistrictType
FROM Sailor_Ilmeria_Adjacencies;