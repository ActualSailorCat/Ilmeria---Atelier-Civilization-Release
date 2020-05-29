--=============================================
-- Ilmeria / Agenda
--=============================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,							Kind)
VALUES	('TRAIT_AGENDA_SAILOR_ILMERIA',	'KIND_TRAIT');

-----------------------------------------------	
-- Agendas
-----------------------------------------------	
INSERT INTO Agendas
		(AgendaType,				Name,								Description)
VALUES	('AGENDA_SAILOR_ILMERIA',	'LOC_AGENDA_SAILOR_ILMERIA_NAME',	'LOC_AGENDA_SAILOR_ILMERIA_DESCRIPTION');

-----------------------------------------------	
-- Traits
-----------------------------------------------	
INSERT INTO Traits
		(TraitType,						Name,					Description)
VALUES	('TRAIT_AGENDA_SAILOR_ILMERIA',	'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');

-----------------------------------------------	
-- AgendaTraits
-----------------------------------------------	
INSERT INTO AgendaTraits
		(AgendaType,						TraitType)
VALUES	('AGENDA_SAILOR_ILMERIA',			'TRAIT_AGENDA_SAILOR_ILMERIA');

-----------------------------------------------	
-- TraitModifiers
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_AGENDA_SAILOR_ILMERIA',		'AGENDA_SAILOR_ILMERIA_HIGH_GREAT'),
		('TRAIT_AGENDA_SAILOR_ILMERIA',		'AGENDA_SAILOR_ILMERIA_LOW_GREAT');

-----------------------------------------------	
-- Modifiers
-----------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,								ModifierType,									SubjectRequirementSetId)
VALUES	('AGENDA_SAILOR_ILMERIA_HIGH_GREAT',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'SAILOR_ILMERIA_AGENDA_REQUIRES_HIGH_GREAT_PEOPLE'),
		('AGENDA_SAILOR_ILMERIA_LOW_GREAT',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'SAILOR_ILMERIA_AGENDA_REQUIRES_LOW_GREAT_PEOPLE');

-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	
INSERT INTO ModifierArguments
		(ModifierId,							Name,							Value)
VALUES	('AGENDA_SAILOR_ILMERIA_HIGH_GREAT',	'InitialValue',					10),
		('AGENDA_SAILOR_ILMERIA_HIGH_GREAT',	'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_ILMERIA_REASON_HIGH_GREAT'),
		('AGENDA_SAILOR_ILMERIA_HIGH_GREAT',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_ILMERIA_HIGH_GREAT'),
		('AGENDA_SAILOR_ILMERIA_LOW_GREAT',		'InitialValue',					-10),
		('AGENDA_SAILOR_ILMERIA_LOW_GREAT',		'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_ILMERIA_REASON_LOW_GREAT'),
		('AGENDA_SAILOR_ILMERIA_LOW_GREAT',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_ILMERIA_LOW_GREAT');

-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('SAILOR_ILMERIA_AGENDA_REQUIRES_HIGH_GREAT_PEOPLE',	'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_ILMERIA_AGENDA_REQUIRES_LOW_GREAT_PEOPLE',		'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('SAILOR_ILMERIA_AGENDA_REQUIRES_HIGH_GREAT_PEOPLE',	'REQUIRES_MET_10_TURNS_AGO'),
		('SAILOR_ILMERIA_AGENDA_REQUIRES_HIGH_GREAT_PEOPLE',	'REQUIRES_MAJOR_CIV_OPPONENT'),
		('SAILOR_ILMERIA_AGENDA_REQUIRES_HIGH_GREAT_PEOPLE',	'SAILOR_ILMERIA_REQUIRES_HIGH_GP'),
		('SAILOR_ILMERIA_AGENDA_REQUIRES_LOW_GREAT_PEOPLE',		'REQUIRES_MET_10_TURNS_AGO'),
		('SAILOR_ILMERIA_AGENDA_REQUIRES_LOW_GREAT_PEOPLE',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('SAILOR_ILMERIA_AGENDA_REQUIRES_LOW_GREAT_PEOPLE',		'SAILOR_ILMERIA_REQUIRES_LOW_GP');

-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,							RequirementType,						ProgressWeight)
VALUES	('SAILOR_ILMERIA_REQUIRES_HIGH_GP',		'REQUIREMENT_PLAYER_GOT_GREAT_PERSON',	1),
		('SAILOR_ILMERIA_REQUIRES_LOW_GP',		'REQUIREMENT_PLAYER_GOT_GREAT_PERSON',	1);
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments 
		(RequirementId,							Name,					Value) 
VALUES	('SAILOR_ILMERIA_REQUIRES_HIGH_GP',		'GreatPersonRatio',		0.75),
		('SAILOR_ILMERIA_REQUIRES_HIGH_GP',		'MinimumDelta',			2),
		('SAILOR_ILMERIA_REQUIRES_LOW_GP',		'GreatPersonRatio',		-1.2),
		('SAILOR_ILMERIA_REQUIRES_LOW_GP',		'MinimumDelta',			2);

-----------------------------------------------	
-- HistoricalAgendas
-----------------------------------------------	
INSERT INTO HistoricalAgendas
		(LeaderType,				AgendaType)
VALUES	('LEADER_SAILOR_ILMERIA',	'AGENDA_SAILOR_ILMERIA');

-----------------------------------------------	
-- ExclusiveAgendas
-----------------------------------------------	
INSERT INTO ExclusiveAgendas
		(AgendaOne,					AgendaTwo)
VALUES	('AGENDA_SAILOR_ILMERIA',	'AGENDA_GREAT_PERSON_ADVOCATE');

-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
		(ModifierId,							Context,		Text)
VALUES	('AGENDA_SAILOR_ILMERIA_HIGH_GREAT',	'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_SAILOR_ILMERIA_LOW_GREAT',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');
