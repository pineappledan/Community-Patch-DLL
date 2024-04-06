CREATE TEMP TABLE TriggerYields (
	HistoricEventType text,
	YieldType text
);

CREATE TEMP TABLE DifficultyBonusAmounts (
	HandicapType text,
	EraType text,
	Amount integer
);

-- Yield types given for each type of difficulty bonus trigger
INSERT INTO TriggerYields
	(HistoricEventType, YieldType)
VALUES
	('HISTORIC_EVENT_WON_WAR', 'YIELD_FOOD'),
	('HISTORIC_EVENT_WON_WAR', 'YIELD_GOLD'),
	('HISTORIC_EVENT_WON_WAR', 'YIELD_CULTURE'),
	('HISTORIC_EVENT_WON_WAR', 'YIELD_SCIENCE'),
	('DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_FOOD'),
	('DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_CULTURE'),
	('DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_SCIENCE'),
	('DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_FOOD'),
	('DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_CULTURE'),
	('DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_SCIENCE'),
	('DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 'YIELD_CULTURE'),
	('DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 'YIELD_SCIENCE'),
	('DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 'YIELD_CULTURE'),
	('DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 'YIELD_SCIENCE'),
	('DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 'YIELD_CULTURE'),
	('DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 'YIELD_SCIENCE'),
	('HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_GOLD'),
	('HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_CULTURE'),
	('HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_SCIENCE'),
	('HISTORIC_EVENT_WORLD_WONDER', 'YIELD_GOLD'),
	('HISTORIC_EVENT_WORLD_WONDER', 'YIELD_CULTURE'),
	('HISTORIC_EVENT_WORLD_WONDER', 'YIELD_SCIENCE'),
	('DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_FOOD'),
	('DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE'),
	('DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_FOOD'),
	('DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_GOLD'),
	('DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE'),
	('HISTORIC_EVENT_DIG', 'YIELD_FOOD'),
	('HISTORIC_EVENT_DIG', 'YIELD_GOLD'),
	('HISTORIC_EVENT_GREAT_PERSON', 'YIELD_FOOD'),
	('HISTORIC_EVENT_GREAT_PERSON', 'YIELD_GOLD'),
	('HISTORIC_EVENT_TRADE_LAND', 'YIELD_FOOD'),
	('HISTORIC_EVENT_TRADE_LAND', 'YIELD_GOLD'),
	('HISTORIC_EVENT_TRADE_SEA', 'YIELD_FOOD'),
	('HISTORIC_EVENT_TRADE_SEA', 'YIELD_GOLD'),
	('HISTORIC_EVENT_TRADE_CS', 'YIELD_FOOD'),
	('HISTORIC_EVENT_TRADE_CS', 'YIELD_GOLD');

-- Base amounts by Difficulty Level and Era
INSERT INTO DifficultyBonusAmounts
	(HandicapType, EraType, Amount)
VALUES
	-- PRINCE
	('HANDICAP_PRINCE', 'ERA_ANCIENT', 24),
	('HANDICAP_PRINCE', 'ERA_CLASSICAL', 24),
	('HANDICAP_PRINCE', 'ERA_MEDIEVAL', 44),
	('HANDICAP_PRINCE', 'ERA_RENAISSANCE', 92),
	('HANDICAP_PRINCE', 'ERA_INDUSTRIAL', 107),
	('HANDICAP_PRINCE', 'ERA_MODERN', 150),
	('HANDICAP_PRINCE', 'ERA_POSTMODERN', 202),
	('HANDICAP_PRINCE', 'ERA_FUTURE', 262),

	-- KING
	('HANDICAP_KING', 'ERA_ANCIENT', 46),
	('HANDICAP_KING', 'ERA_CLASSICAL', 46),
	('HANDICAP_KING', 'ERA_MEDIEVAL', 87),
	('HANDICAP_KING', 'ERA_RENAISSANCE', 189),
	('HANDICAP_KING', 'ERA_INDUSTRIAL', 220),
	('HANDICAP_KING', 'ERA_MODERN', 312),
	('HANDICAP_KING', 'ERA_POSTMODERN', 421),
	('HANDICAP_KING', 'ERA_FUTURE', 548),

	-- EMPEROR
	('HANDICAP_EMPEROR', 'ERA_ANCIENT', 72),
	('HANDICAP_EMPEROR', 'ERA_CLASSICAL', 72),
	('HANDICAP_EMPEROR', 'ERA_MEDIEVAL', 139),
	('HANDICAP_EMPEROR', 'ERA_RENAISSANCE', 304),
	('HANDICAP_EMPEROR', 'ERA_INDUSTRIAL', 359),
	('HANDICAP_EMPEROR', 'ERA_MODERN', 512),
	('HANDICAP_EMPEROR', 'ERA_POSTMODERN', 695),
	('HANDICAP_EMPEROR', 'ERA_FUTURE', 906),

	-- IMMORTAL
	('HANDICAP_IMMORTAL', 'ERA_ANCIENT', 91),
	('HANDICAP_IMMORTAL', 'ERA_CLASSICAL', 91),
	('HANDICAP_IMMORTAL', 'ERA_MEDIEVAL', 177),
	('HANDICAP_IMMORTAL', 'ERA_RENAISSANCE', 393),
	('HANDICAP_IMMORTAL', 'ERA_INDUSTRIAL', 465),
	('HANDICAP_IMMORTAL', 'ERA_MODERN', 667),
	('HANDICAP_IMMORTAL', 'ERA_POSTMODERN', 907),
	('HANDICAP_IMMORTAL', 'ERA_FUTURE', 1185),

	-- DEITY
	('HANDICAP_DEITY', 'ERA_ANCIENT', 114),
	('HANDICAP_DEITY', 'ERA_CLASSICAL', 114),
	('HANDICAP_DEITY', 'ERA_MEDIEVAL', 226),
	('HANDICAP_DEITY', 'ERA_RENAISSANCE', 504),
	('HANDICAP_DEITY', 'ERA_INDUSTRIAL', 601),
	('HANDICAP_DEITY', 'ERA_MODERN', 864),
	('HANDICAP_DEITY', 'ERA_POSTMODERN', 1178),
	('HANDICAP_DEITY', 'ERA_FUTURE', 1542);

-- Fill the table with entries
INSERT INTO HandicapInfo_AIDifficultyBonus
	(HandicapType, EraType, HistoricEventType, YieldType, Amount)
SELECT
	a.HandicapType, a.EraType, b.HistoricEventType, b.YieldType, a.Amount
FROM DifficultyBonusAmounts a, TriggerYields b;

DROP TABLE TriggerYields;
DROP TABLE DifficultyBonusAmounts;

-- Multipliers for specific triggers
CREATE TEMP TABLE DifficultyBonusMultipliers (
	HistoricEventTypeTemp text,
	IsGold boolean,
	MultiplierTimes100 integer
);

INSERT INTO DifficultyBonusMultipliers
VALUES
	('HISTORIC_EVENT_WON_WAR', 0, 200), -- 2x for winning a war
	('HISTORIC_EVENT_WON_WAR', 1, 200),
	('DIFFICULTY_BONUS_CITY_CONQUEST', 0, 150), -- 1.5x for city conquest
	('DIFFICULTY_BONUS_CITY_CONQUEST', 1, 150),
	('DIFFICULTY_BONUS_ADOPTED_POLICY', 0, 33), -- 0.33x for adopting a policy
	('DIFFICULTY_BONUS_ADOPTED_POLICY', 1, 33),
	('DIFFICULTY_BONUS_RESEARCHED_TECH', 0, 20), -- 0.2x for researching a tech
	('DIFFICULTY_BONUS_RESEARCHED_TECH', 1, 20),
	('HISTORIC_EVENT_GOLDEN_AGE', 1, 300), -- 3x Gold for Golden Ages
	('HISTORIC_EVENT_WORLD_WONDER', 1, 300), -- 3x Gold for World Wonders
	('DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 1, 20), -- 0.2x Gold for killing a major civ unit
	('DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 0, 10), -- 0.1x other yields for killing a major civ unit
	('DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 1, 20), -- 0.2x Gold for killing a City-State unit
	('DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 0, 10), -- 0.1x other yields for killing a City-State unit
	('DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 1, 10), -- 0.1x Gold for killing a Barbarian unit
	('DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 0, 5); -- 0.05x other yields for killing a Barbarian unit

UPDATE HandicapInfo_AIDifficultyBonus
SET Amount = Amount * (SELECT MultiplierTimes100 FROM DifficultyBonusMultipliers WHERE HistoricEventTypeTemp = HistoricEventType AND IsGold = 1) / 100
WHERE YieldType = 'YIELD_GOLD'
AND EXISTS (SELECT 1 FROM DifficultyBonusMultipliers WHERE HistoricEventTypeTemp = HistoricEventType AND IsGold = 1);

UPDATE HandicapInfo_AIDifficultyBonus
SET Amount = Amount * (SELECT MultiplierTimes100 FROM DifficultyBonusMultipliers WHERE HistoricEventTypeTemp = HistoricEventType AND IsGold = 0) / 100
WHERE YieldType <> 'YIELD_GOLD'
AND EXISTS (SELECT 1 FROM DifficultyBonusMultipliers WHERE HistoricEventTypeTemp = HistoricEventType AND IsGold = 0);

DROP TABLE DifficultyBonusMultipliers;

-- Exceptions
-- Reduce Science and Culture in Ancient Era on all difficulties
CREATE TEMP TABLE AncientDifficultyBonusAmounts (
	HandicapTypeTemp text,
	HistoricEventTypeTemp text,
	YieldTypeTemp text,
	AmountTemp integer
);

INSERT INTO AncientDifficultyBonusAmounts
VALUES
	('HANDICAP_PRINCE', 'DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_SCIENCE', 20),
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_SCIENCE', 20),
	('HANDICAP_PRINCE', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 6),
	('HANDICAP_PRINCE', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE', 3),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_SCIENCE', 41),
	('HANDICAP_KING', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_SCIENCE', 41),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 12),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE', 7),
	('HANDICAP_EMPEROR', 'DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_SCIENCE', 64),
	('HANDICAP_EMPEROR', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_SCIENCE', 64),
	('HANDICAP_EMPEROR', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 18),
	('HANDICAP_EMPEROR', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE', 11),
	('HANDICAP_IMMORTAL', 'DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_SCIENCE', 81),
	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_SCIENCE', 81),
	('HANDICAP_IMMORTAL', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 23),
	('HANDICAP_IMMORTAL', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE', 14),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_CITY_FOUND', 'YIELD_SCIENCE', 101),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_SCIENCE', 101),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 29),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE', 17);

UPDATE HandicapInfo_AIDifficultyBonus
SET Amount = (
	SELECT AmountTemp FROM AncientDifficultyBonusAmounts
	WHERE HandicapTypeTemp = HandicapType AND HistoricEventTypeTemp = HistoricEventType AND YieldTypeTemp = YieldType AND EraType = 'ERA_ANCIENT'
)
WHERE EXISTS (
	SELECT 1 FROM AncientDifficultyBonusAmounts
	WHERE HandicapTypeTemp = HandicapType AND HistoricEventTypeTemp = HistoricEventType AND YieldTypeTemp = YieldType AND EraType = 'ERA_ANCIENT'
);

DROP TABLE AncientDifficultyBonusAmounts;


-- +/- 1 or 2 to the final totals for Renaissance amounts to match Proposal (6-71)
CREATE TEMP TABLE RenaissanceDifficultyBonusAmounts (
	HandicapTypeTemp text,
	HistoricEventTypeTemp text,
	YieldTypeTemp text,
	AmountTemp integer
);

INSERT INTO RenaissanceDifficultyBonusAmounts
VALUES
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_WON_WAR', 'YIELD_GOLD', 185),
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_WON_WAR', 'YIELD_FOOD', 185),
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_WON_WAR', 'YIELD_SCIENCE', 185),
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_WON_WAR', 'YIELD_CULTURE', 185),
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_GOLD', 277),
	('HANDICAP_PRINCE', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_GOLD', 277),

	('HANDICAP_KING', 'DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 'YIELD_GOLD', 38),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 'YIELD_GOLD', 38),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_GOLD', 38),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_FOOD', 38),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_RESEARCHED_TECH', 'YIELD_CULTURE', 38),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_GOLD', 61),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_FOOD', 61),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 61),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_GOLD', 282),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_FOOD', 282),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_SCIENCE', 282),
	('HANDICAP_KING', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_CULTURE', 282),
	('HANDICAP_KING', 'HISTORIC_EVENT_WON_WAR', 'YIELD_GOLD', 377),
	('HANDICAP_KING', 'HISTORIC_EVENT_WON_WAR', 'YIELD_FOOD', 377),
	('HANDICAP_KING', 'HISTORIC_EVENT_WON_WAR', 'YIELD_SCIENCE', 377),
	('HANDICAP_KING', 'HISTORIC_EVENT_WON_WAR', 'YIELD_CULTURE', 377),
	('HANDICAP_KING', 'HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_GOLD', 566),
	('HANDICAP_KING', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_GOLD', 566),

	('HANDICAP_EMPEROR', 'DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 'YIELD_CULTURE', 14),
	('HANDICAP_EMPEROR', 'DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 'YIELD_SCIENCE', 14),
	('HANDICAP_EMPEROR', 'HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_GOLD', 913),
	('HANDICAP_EMPEROR', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_GOLD', 913),

	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_WON_WAR', 'YIELD_GOLD', 785),
	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_WON_WAR', 'YIELD_FOOD', 785),
	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_WON_WAR', 'YIELD_SCIENCE', 785),
	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_WON_WAR', 'YIELD_CULTURE', 785),
	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_GOLD', 1178),
	('HANDICAP_IMMORTAL', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_GOLD', 1178),

	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_KILLED_BARBARIAN_UNIT', 'YIELD_GOLD', 49),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 'YIELD_CULTURE', 49),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_KILLED_MAJOR_UNIT', 'YIELD_SCIENCE', 49),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 'YIELD_CULTURE', 49),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_KILLED_CITY_STATE_UNIT', 'YIELD_SCIENCE', 49),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_GOLD', 167),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_FOOD', 167),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_ADOPTED_POLICY', 'YIELD_SCIENCE', 167),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_GOLD', 757),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_FOOD', 757),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_SCIENCE', 757),
	('HANDICAP_DEITY', 'DIFFICULTY_BONUS_CITY_CONQUEST', 'YIELD_CULTURE', 757),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_WON_WAR', 'YIELD_GOLD', 1009),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_WON_WAR', 'YIELD_FOOD', 1009),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_WON_WAR', 'YIELD_SCIENCE', 1009),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_WON_WAR', 'YIELD_CULTURE', 1009),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_GOLDEN_AGE', 'YIELD_GOLD', 1514),
	('HANDICAP_DEITY', 'HISTORIC_EVENT_WORLD_WONDER', 'YIELD_GOLD', 1514);

UPDATE HandicapInfo_AIDifficultyBonus
SET Amount = (
	SELECT AmountTemp FROM RenaissanceDifficultyBonusAmounts
	WHERE HandicapTypeTemp = HandicapType AND HistoricEventTypeTemp = HistoricEventType AND YieldTypeTemp = YieldType AND EraType = 'ERA_RENAISSANCE'
)
WHERE EXISTS (
	SELECT 1 FROM RenaissanceDifficultyBonusAmounts
	WHERE HandicapTypeTemp = HandicapType AND HistoricEventTypeTemp = HistoricEventType AND YieldTypeTemp = YieldType AND EraType = 'ERA_RENAISSANCE'
);

DROP TABLE RenaissanceDifficultyBonusAmounts;