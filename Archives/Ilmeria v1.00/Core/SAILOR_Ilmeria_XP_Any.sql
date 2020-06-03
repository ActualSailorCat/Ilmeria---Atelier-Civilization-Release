--=============================================
-- Ilmeria / Expansions
--=============================================
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_SAILOR_ILMERIA_UA_XP_DESCRIPTION' WHERE TraitType = 'TRAIT_LEADER_SAILOR_ILMERIA_UA';
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types 
		(Type,										Kind)
VALUES	('DYNMOD_SAILOR_ILMERIA_GPPMOD',			'KIND_MODIFIER');

-----------------------------------------------			
-- TraitModifiers		
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_LEADER_SAILOR_ILMERIA_UA',	'SAILOR_ILMERIA_UA_HIGH_CAMPUS_ADJACENCY'),
		('TRAIT_LEADER_SAILOR_ILMERIA_UA',	'SAILOR_ILMERIA_UA_HIGH_COMM_ADJACENCY'),
		('TRAIT_LEADER_SAILOR_ILMERIA_UA',	'SAILOR_ILMERIA_UA_HIGH_INDUST_ADJACENCY');

-----------------------------------------------	
-- DynamicModifiers
-----------------------------------------------	
INSERT INTO DynamicModifiers
		(ModifierType,						CollectionType,					EffectType)
VALUES	('DYNMOD_SAILOR_ILMERIA_GPPMOD',	'COLLECTION_PLAYER_CITIES',		'EFFECT_ADJUST_CITY_GREAT_PERSON_POINTS_MODIFIER');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,								ModifierType,						SubjectRequirementSetId)
VALUES	('SAILOR_ILMERIA_UA_HIGH_CAMPUS_ADJACENCY',	'DYNMOD_SAILOR_ILMERIA_GPPMOD',		'SAILOR_ILMERIA_UA_HIGH_ADJ_CAMPUS_REQUIREMENTS'),
		('SAILOR_ILMERIA_UA_HIGH_COMM_ADJACENCY',	'DYNMOD_SAILOR_ILMERIA_GPPMOD',		'SAILOR_ILMERIA_UA_HIGH_ADJ_COMM_REQUIREMENTS'),
		('SAILOR_ILMERIA_UA_HIGH_INDUST_ADJACENCY',	'DYNMOD_SAILOR_ILMERIA_GPPMOD',		'SAILOR_ILMERIA_UA_HIGH_ADJ_INDUST_REQUIREMENTS');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,								Name,		Value)
VALUES	('SAILOR_ILMERIA_UA_HIGH_CAMPUS_ADJACENCY',	'Amount',	50),
		('SAILOR_ILMERIA_UA_HIGH_COMM_ADJACENCY',	'Amount',	50),
		('SAILOR_ILMERIA_UA_HIGH_INDUST_ADJACENCY',	'Amount',	50);

-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('SAILOR_ILMERIA_UA_HIGH_ADJ_CAMPUS_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_ILMERIA_UA_HIGH_ADJ_COMM_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_ILMERIA_UA_HIGH_ADJ_INDUST_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL');

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('SAILOR_ILMERIA_UA_HIGH_ADJ_COMM_REQUIREMENTS',	'SAILOR_ILMERIA_UA_REQUIRES_HIGH_HUB'),
		('SAILOR_ILMERIA_UA_HIGH_ADJ_CAMPUS_REQUIREMENTS',	'SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS'),
		('SAILOR_ILMERIA_UA_HIGH_ADJ_INDUST_REQUIREMENTS',	'SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE');

-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('SAILOR_ILMERIA_UA_REQUIRES_HIGH_HUB',		'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT');

-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments 
		(RequirementId,								Name,					Value) 
VALUES	('SAILOR_ILMERIA_UA_REQUIRES_HIGH_HUB',		'DistrictType',			'DISTRICT_COMMERCIAL_HUB'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_HUB',		'YieldType',			'YIELD_GOLD'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_HUB',		'Amount',				4),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'DistrictType',			'DISTRICT_CAMPUS'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'YieldType',			'YIELD_SCIENCE'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_CAMPUS',	'Amount',				3),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'DistrictType',			'DISTRICT_INDUSTRIAL_ZONE'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'YieldType',			'YIELD_PRODUCTION'),
		('SAILOR_ILMERIA_UA_REQUIRES_HIGH_ZONE',	'Amount',				3);

