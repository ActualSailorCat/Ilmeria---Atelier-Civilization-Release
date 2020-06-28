--=============================================
-- Ilmeria / Expansions
--=============================================
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_SAILOR_ILMERIA_UA_XP_DESCRIPTION' WHERE TraitType = 'TRAIT_LEADER_SAILOR_ILMERIA_UA';
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types 
		(Type,										Kind)
VALUES	('ABILITY_SAILOR_ILMERIA_UA_MASTER',		'KIND_ABILITY');

-----------------------------------------------	
-- TypeTags
-----------------------------------------------	
INSERT INTO TypeTags
				(Type,								Tag)
SELECT DISTINCT	'ABILITY_SAILOR_ILMERIA_UA_MASTER',	Tag
FROM TypeTags WHERE Type IN (SELECT UnitType FROM Units WHERE PromotionClass IS NOT NULL
AND (TraitType IS NULL OR TraitType = 'TRAIT_CIVILIZATION_UNIT_SAILOR_ATLEER_UU')
AND ReligiousStrength = 0);

-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,						Name, Description, Inactive, Permanent)
VALUES	('ABILITY_SAILOR_ILMERIA_UA_MASTER',	NULL, NULL,		   1,		 1);

-----------------------------------------------			
-- TraitModifiers		
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_SAILOR_ILMERIA_UA',		'SAILOR_ILMERIA_UA_HIGH_CAM_ADJACENCY'),
		('TRAIT_LEADER_SAILOR_ILMERIA_UA',		'SAILOR_ILMERIA_UA_HIGH_IND_ADJACENCY');

-----------------------------------------------	
-- UnitAbilityModifiers
-----------------------------------------------	
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_SAILOR_ILMERIA_UA_MASTER',	'SAILOR_ILMERIA_UA_EXP_MOD');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,									ModifierType,											Permanent,	SubjectRequirementSetId)
VALUES	('SAILOR_ILMERIA_UA_HIGH_CAM_ADJACENCY',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				0,			'SAILOR_ILMERIA_UA_HIGH_ADJ_REQUIREMENTS'),
		('SAILOR_ILMERIA_UA_HIGH_CAM_ADJACENCY_MOD',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1,			NULL),
		('SAILOR_ILMERIA_UA_HIGH_IND_ADJACENCY',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				0,			'SAILOR_ILMERIA_UA_HIGH_ADJ_REQUIREMENTS'),
		('SAILOR_ILMERIA_UA_HIGH_IND_ADJACENCY_MOD',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1,			NULL);

-- Ability
INSERT INTO Modifiers
		(ModifierId,								ModifierType)
VALUES	('SAILOR_ILMERIA_UA_EXP_MOD',				'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('SAILOR_ILMERIA_UA_HIGH_CAM_ADJACENCY',		'ModifierId',	'SAILOR_ILMERIA_UA_HIGH_CAM_ADJACENCY_MOD'),
		('SAILOR_ILMERIA_UA_HIGH_CAM_ADJACENCY_MOD',	'AbilityType',	'ABILITY_SAILOR_ILMERIA_UA_MASTER'),
		('SAILOR_ILMERIA_UA_HIGH_IND_ADJACENCY',		'ModifierId',	'SAILOR_ILMERIA_UA_HIGH_IND_ADJACENCY_MOD'),
		('SAILOR_ILMERIA_UA_HIGH_IND_ADJACENCY_MOD',	'AbilityType',	'ABILITY_SAILOR_ILMERIA_UA_MASTER');

-- Ability
INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('SAILOR_ILMERIA_UA_EXP_MOD',				'Amount',		25);

-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('SAILOR_ILMERIA_UA_HIGH_ADJ_REQUIREMENTS',		'REQUIREMENTSET_TEST_ANY');


-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('SAILOR_ILMERIA_UA_HIGH_ADJ_REQUIREMENTS',		'SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS'),
		('SAILOR_ILMERIA_UA_HIGH_ADJ_REQUIREMENTS',		'SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE');

-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT');

-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments 
		(RequirementId,								Name,					Value) 
VALUES	('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'DistrictType',			'DISTRICT_CAMPUS'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'YieldType',			'YIELD_SCIENCE'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'Amount',				3),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'DistrictType',			'DISTRICT_INDUSTRIAL_ZONE'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'YieldType',			'YIELD_PRODUCTION'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'Amount',				3);