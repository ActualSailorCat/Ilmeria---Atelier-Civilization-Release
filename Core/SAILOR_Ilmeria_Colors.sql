-----------------------------------------------
-- Colors
-----------------------------------------------
INSERT INTO Colors
        (Type,								 Color)
VALUES  ('COLOR_SAILOR_ILMERIA_PRIMARY',	'79,101,177,255'),
        ('COLOR_SAILOR_ILMERIA_SECONDARY',	'138,173,215,255');

-----------------------------------------------
-- PlayerColors
-----------------------------------------------
INSERT INTO PlayerColors (
		Type,
		Usage, 
		PrimaryColor, 
		SecondaryColor, 
		Alt1PrimaryColor, 
		Alt1SecondaryColor, 
		Alt2PrimaryColor, 
		Alt2SecondaryColor, 
		Alt3PrimaryColor, 
		Alt3SecondaryColor)
SELECT	'LEADER_SAILOR_ILMERIA',
		'Unique',
		Alt3SecondaryColor,
		Alt3PrimaryColor,
		'COLOR_SAILOR_ILMERIA_PRIMARY',
		'COLOR_SAILOR_ILMERIA_SECONDARY',
		Alt2PrimaryColor,
		Alt2SecondaryColor,
		Alt3PrimaryColor,
		Alt3SecondaryColor
FROM PlayerColors WHERE Type = 'LEADER_SAILOR_TOTORI';