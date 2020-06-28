--=============================================
-- Ilmeria / Traits
--=============================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types 
		(Type,										Kind)
VALUES	('TRAIT_LEADER_SAILOR_ILMERIA_UA',			'KIND_TRAIT');
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
VALUES	('LEADER_SAILOR_ILMERIA',			'TRAIT_LEADER_SAILOR_ILMERIA_UA'),
		('LEADER_SAILOR_ILMERIA',			'TRAIT_LEADER_SCIENCE_MAJOR_CIV');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'SAILOR_ILMERIA_VISIBILITY_'||ResourceType,		'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_STRATEGIC' AND PrereqTech IS NOT NULL AND PrereqTech IN (SELECT TechnologyType FROM Boosts);

INSERT INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'SAILOR_ILMERIA_VISIBILITY_'||ResourceType,		'ResourceType',	ResourceType
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_STRATEGIC' AND PrereqTech IS NOT NULL AND PrereqTech IN (SELECT TechnologyType FROM Boosts);