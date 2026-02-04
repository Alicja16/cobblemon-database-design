-- =========================================
-- TYPE
-- =========================================
INSERT INTO type (name, color, representing_icon) VALUES ('Fire',     'orange',  'flame');
INSERT INTO type (name, color, representing_icon) VALUES ('Water',    'blue',    'drop');
INSERT INTO type (name, color, representing_icon) VALUES ('Grass',    'green',   'leaf');
INSERT INTO type (name, color, representing_icon) VALUES ('Rock',     'tan',     'rock');
INSERT INTO type (name, color, representing_icon) VALUES ('Ground',   'brown',   'ground');
INSERT INTO type (name, color, representing_icon) VALUES ('Ice',      'cyan',    'snowflake');

INSERT INTO type (name, color, representing_icon) VALUES ('Electric', 'yellow',  'bolt');
INSERT INTO type (name, color, representing_icon) VALUES ('Bug',      'lime',    'insect');
INSERT INTO type (name, color, representing_icon) VALUES ('Flying',   'sky',     'wing');
INSERT INTO type (name, color, representing_icon) VALUES ('Dark',     'black',   'moon');
INSERT INTO type (name, color, representing_icon) VALUES ('Psychic',  'pink',    'spiral');
INSERT INTO type (name, color, representing_icon) VALUES ('Fairy',    'magenta', 'star');

INSERT INTO type (name, color, representing_icon) VALUES ('Poison',   'purple',  'skull');
INSERT INTO type (name, color, representing_icon) VALUES ('Fighting', 'red',     'fist');
INSERT INTO type (name, color, representing_icon) VALUES ('Steel',    'silver',  'hexagon');
INSERT INTO type (name, color, representing_icon) VALUES ('Dragon',   'indigo',  'dragon');
INSERT INTO type (name, color, representing_icon) VALUES ('Ghost',    'violet',  'ghost');
INSERT INTO type (name, color, representing_icon) VALUES ('Normal',   'gray',    'circle');


-- =========================================================
-- COMBAR ARRAY
-- =========================================================
INSERT INTO combat_array
SELECT t1.name, t2.name, 1, 'normal'
FROM type t1
CROSS JOIN type t2;

-- FIRE
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Fire' AND type_name2 IN ('Grass','Ice','Bug','Steel');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Fire' AND type_name2 IN ('Fire','Water','Rock','Dragon');

-- WATER
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Water' AND type_name2 IN ('Fire','Ground','Rock');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Water' AND type_name2 IN ('Water','Grass','Dragon');

-- GRASS
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Grass' AND type_name2 IN ('Water','Ground','Rock');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Grass' AND type_name2 IN
('Fire','Grass','Poison','Flying','Bug','Dragon','Steel');

-- ELECTRIC
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Electric' AND type_name2 IN ('Water','Flying');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Electric' AND type_name2 IN ('Electric','Grass','Dragon');
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Electric' AND type_name2='Ground';

-- ICE
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Ice' AND type_name2 IN ('Grass','Ground','Flying','Dragon');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Ice' AND type_name2 IN ('Fire','Water','Ice','Steel');

-- FIGHTING
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Fighting' AND type_name2 IN ('Normal','Ice','Rock','Dark','Steel');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Fighting' AND type_name2 IN ('Poison','Flying','Psychic','Bug','Fairy');
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Fighting' AND type_name2='Ghost';

-- POISON
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Poison' AND type_name2 IN ('Grass','Fairy');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Poison' AND type_name2 IN ('Poison','Ground','Rock','Ghost');
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Poison' AND type_name2='Steel';

-- GROUND
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Ground' AND type_name2 IN ('Fire','Electric','Poison','Rock','Steel');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Ground' AND type_name2 IN ('Grass','Bug');
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Ground' AND type_name2='Flying';

-- FLYING
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Flying' AND type_name2 IN ('Grass','Fighting','Bug');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Flying' AND type_name2 IN ('Electric','Rock','Steel');

-- PSYCHIC
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Psychic' AND type_name2 IN ('Fighting','Poison');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Psychic' AND type_name2 IN ('Psychic','Steel');
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Psychic' AND type_name2='Dark';

-- BUG
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Bug' AND type_name2 IN ('Grass','Psychic','Dark');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Bug' AND type_name2 IN
('Fire','Fighting','Poison','Flying','Ghost','Steel','Fairy');

-- ROCK
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Rock' AND type_name2 IN ('Fire','Ice','Flying','Bug');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Rock' AND type_name2 IN ('Fighting','Ground','Steel');

-- GHOST
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Ghost' AND type_name2 IN ('Psychic','Ghost');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Ghost' AND type_name2='Dark';
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Ghost' AND type_name2='Normal';

-- DRAGON
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Dragon' AND type_name2='Dragon';
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Dragon' AND type_name2='Steel';
UPDATE combat_array SET multiplier=0, category='no_effect'
WHERE type_name='Dragon' AND type_name2='Fairy';

-- DARK
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Dark' AND type_name2 IN ('Psychic','Ghost');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Dark' AND type_name2 IN ('Fighting','Dark','Fairy');

-- STEEL
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Steel' AND type_name2 IN ('Ice','Rock','Fairy');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Steel' AND type_name2 IN ('Fire','Water','Electric','Steel');

-- FAIRY
UPDATE combat_array SET multiplier=2, category='super_effective'
WHERE type_name='Fairy' AND type_name2 IN ('Fighting','Dragon','Dark');
UPDATE combat_array SET multiplier=0.5, category='not_very_effective'
WHERE type_name='Fairy' AND type_name2 IN ('Fire','Poison','Steel');



-- =========================================================
-- GENERATION
-- =========================================================
INSERT INTO generation ("number", generation_name, region_name) VALUES (1, 'Generation I',   'Kanto');
INSERT INTO generation ("number", generation_name, region_name) VALUES (2, 'Generation II',  'Johto');
INSERT INTO generation ("number", generation_name, region_name) VALUES (3, 'Generation III', 'Hoenn');
INSERT INTO generation ("number", generation_name, region_name) VALUES (4, 'Generation IV',  'Sinnoh');
INSERT INTO generation ("number", generation_name, region_name) VALUES (5, 'Generation V',   'Unova');
INSERT INTO generation ("number", generation_name, region_name) VALUES (6, 'Generation VI',  'Kalos');
INSERT INTO generation ("number", generation_name, region_name) VALUES (7, 'Generation VII', 'Alola');
INSERT INTO generation ("number", generation_name, region_name) VALUES (8, 'Generation VIII','Galar');
INSERT INTO generation ("number", generation_name, region_name) VALUES (9, 'Generation IX',  'Paldea');


-- =========================================================
-- WEATHER
-- =========================================================
INSERT INTO weather (name_weather, description) VALUES ('Clear',        'Default clear weather.');
INSERT INTO weather (name_weather, description) VALUES ('Rain',         'Rainy weather.');
INSERT INTO weather (name_weather, description) VALUES ('Thunderstorm', 'Thunderstorm weather.');
INSERT INTO weather (name_weather, description) VALUES ('Snow',         'Snow weather.');


-- =========================================
-- TIME_OF_DAY (MC day = 20 min)
-- =========================================
INSERT INTO time_of_day VALUES ('Night',    0.0,  7.5, 50);
INSERT INTO time_of_day VALUES ('Sunrise',  7.5,  9.0, 50);
INSERT INTO time_of_day VALUES ('Day',      9.0, 17.5, 50);
INSERT INTO time_of_day VALUES ('Sunset',  17.5, 19.0, 50);
INSERT INTO time_of_day VALUES ('Dusk',    19.0, 20.0, 50);



-- =========================================
-- BIOM 
-- =========================================
INSERT INTO biom (name_biom, climate) VALUES ('Badlands',      'hot');
INSERT INTO biom (name_biom, climate) VALUES ('Beach',         'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Cave',          'cave');
INSERT INTO biom (name_biom, climate) VALUES ('Coast',         'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Deep_Ocean',    'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Desert',        'hot');
INSERT INTO biom (name_biom, climate) VALUES ('Dripstone',     'cave');
INSERT INTO biom (name_biom, climate) VALUES ('Floral',        'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Forest',        'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Freezing',      'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Freshwater',    'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Frozen_Ocean',  'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Glacial',       'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Grassland',     'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Highlands',     'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Hills',         'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Island',        'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Jungle',        'hot');
INSERT INTO biom (name_biom, climate) VALUES ('Lukewarm_Ocean', 'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Lush',          'humid');
INSERT INTO biom (name_biom, climate) VALUES ('Magical',       'mystic');
INSERT INTO biom (name_biom, climate) VALUES ('Mountain',      'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Mushroom',      'humid');
INSERT INTO biom (name_biom, climate) VALUES ('Ocean',         'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Peak',          'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Plains',        'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Plateau',       'hot');
INSERT INTO biom (name_biom, climate) VALUES ('River',         'wet');
INSERT INTO biom (name_biom, climate) VALUES ('Salt',          'dry');
INSERT INTO biom (name_biom, climate) VALUES ('Sandy',         'hot');
INSERT INTO biom (name_biom, climate) VALUES ('Savanna',       'hot');
INSERT INTO biom (name_biom, climate) VALUES ('Sky',           'mystic');
INSERT INTO biom (name_biom, climate) VALUES ('Snowy_Forest',  'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Spooky',        'mystic');
INSERT INTO biom (name_biom, climate) VALUES ('Swamp',         'humid');
INSERT INTO biom (name_biom, climate) VALUES ('Taiga',         'cold');
INSERT INTO biom (name_biom, climate) VALUES ('Temperate',     'temperate');
INSERT INTO biom (name_biom, climate) VALUES ('Thermal',       'dry');
INSERT INTO biom (name_biom, climate) VALUES ('Trop_Island',   'hot');
INSERT INTO biom (name_biom, climate) VALUES ('Tundra',        'cold');


-- =========================================
-- ITEM (SUPERTYP)
-- =========================================
INSERT INTO item VALUES ('Potion',        'N', 'Y', 'Healing');
INSERT INTO item VALUES ('Rare Candy',    'N', 'Y', 'Special');
INSERT INTO item VALUES ('Seed',          'N', 'N', 'Special');
INSERT INTO item VALUES ('Charcoal',      'N', 'N', 'Special');
INSERT INTO item VALUES ('Shell Fragment','N', 'N', 'Special');
INSERT INTO item VALUES ('Melon Seeds',   'N', 'N', 'Special');
INSERT INTO item VALUES ('Miracle Seed',  'N', 'N', 'Special');
INSERT INTO item VALUES ('Blaze Powder',  'N', 'N', 'Special');
INSERT INTO item VALUES ('Charcoal Stick','N', 'N', 'Special');
INSERT INTO item VALUES ('Turtle Scute',  'N', 'N', 'Special');
INSERT INTO item VALUES ('Mystic Water',  'N', 'N', 'Special');


-- =========================================
-- ITEM – PODTYPY
-- =========================================
-- Healing
INSERT INTO healing VALUES ('Potion','N',20,'N');

-- Special
INSERT INTO special VALUES ('Rare Candy','Instant level up');
INSERT INTO special VALUES ('Seed','Common plant drop');
INSERT INTO special VALUES ('Charcoal','Burned remains of Fire Pokémon');
INSERT INTO special VALUES ('Shell Fragment','Hard shell fragment');
INSERT INTO special VALUES ('Melon Seeds','Seeds dropped by Grass-related Pokémon; used for planting melons.');
INSERT INTO special VALUES ('Miracle Seed','Held item that boosts Grass-type moves.');
INSERT INTO special VALUES ('Blaze Powder','Powder dropped by Fire-related Pokémon; used in crafting/brewing.');
INSERT INTO special VALUES ('Charcoal Stick','Charcoal-based item dropped by Fire Pokémon; used as a material.');
INSERT INTO special VALUES ('Turtle Scute','Hard scute dropped by turtle-like Pokémon; used for crafting.');
INSERT INTO special VALUES ('Mystic Water','Held item that boosts Water-type moves.');



-- =============================================
-- POKEMON
-- =============================================
INSERT INTO pokemon VALUES (1,'Bulbasaur',0.7,6.9,'unknown','Poison','Grass',1);
INSERT INTO pokemon VALUES (2,'Ivysaur',1.0,13.0,'unknown','Poison','Grass',1);
INSERT INTO pokemon VALUES (3,'Venusaur',2.0,100.0,'unknown','Poison','Grass',1);

INSERT INTO pokemon VALUES (4,'Charmander',0.6,8.5,'unknown',NULL,'Fire',1);
INSERT INTO pokemon VALUES (5,'Charmeleon',1.1,19.0,'unknown',NULL,'Fire',1);
INSERT INTO pokemon VALUES (6,'Charizard',1.7,90.5,'unknown','Flying','Fire',1);

INSERT INTO pokemon VALUES (7,'Squirtle',0.5,9.0,'unknown',NULL,'Water',1);
INSERT INTO pokemon VALUES (8,'Wartortle',1.0,22.5,'unknown',NULL,'Water',1);
INSERT INTO pokemon VALUES (9,'Blastoise',1.6,85.5,'unknown',NULL,'Water',1);


-- =========================================
-- MOVES + ALLOWED_MOVES
-- =========================================
INSERT INTO moves VALUES ('Tackle','physical',40,35,'Normal');
INSERT INTO moves VALUES ('Vine Whip','physical',45,25,'Grass');
INSERT INTO moves VALUES ('Ember','special',40,25,'Fire');
INSERT INTO moves VALUES ('Water Gun','special',40,25,'Water');

INSERT INTO allowed_moves VALUES ('level','Tackle',1);
INSERT INTO allowed_moves VALUES ('level','Vine Whip',1);
INSERT INTO allowed_moves VALUES ('level','Ember',4);
INSERT INTO allowed_moves VALUES ('level','Water Gun',7);
INSERT INTO allowed_moves VALUES ('level', 'Water Gun', 8);
INSERT INTO allowed_moves VALUES ('level', 'Water Gun', 9);


-- =========================================
-- EVOLUTION_METHOD (LEVEL)
-- =========================================
INSERT INTO evolution_method
VALUES (1,2,NULL,'Level_method','Day','Clear','Plains',1);

INSERT INTO evolution_method
VALUES (2,3,NULL,'Level_method','Day','Clear','Forest',2);

INSERT INTO evolution_method
VALUES (3,5,NULL,'Level_method','Day','Clear','Plains',4);

INSERT INTO evolution_method
VALUES (4,6,NULL,'Level_method','Day','Clear','Plains',5);

INSERT INTO evolution_method
VALUES (5,8,NULL,'Level_method','Day','Clear','Plains',7);

INSERT INTO evolution_method
VALUES (6,9,NULL,'Level_method','Day','Clear','Plains',8);



-- =========================================
-- LEVEL_METHOD 
-- =========================================
INSERT INTO level_method VALUES (1,16,1);
INSERT INTO level_method VALUES (2,32,2);
INSERT INTO level_method VALUES (3,16,4);
INSERT INTO level_method VALUES (4,36,5);
INSERT INTO level_method VALUES (5,16,7);
INSERT INTO level_method VALUES (6,36,8);


-- =========================================
-- LOOT
-- =========================================
-- Bulbasaur
INSERT INTO loot VALUES (1,30,'Seed',1);
-- Ivysaur
INSERT INTO loot VALUES (2,20,'Seed',2);
-- Charmander
INSERT INTO loot VALUES (1,25,'Charcoal',4);
-- Charmeleon
INSERT INTO loot VALUES (2,15,'Charcoal',5);
-- Squirtle
INSERT INTO loot VALUES (1,25,'Shell Fragment',7);
-- Wartortle
INSERT INTO loot VALUES (2,15,'Shell Fragment',8);


-- =========================================
-- SPAWN INFORMATION
-- =========================================
INSERT INTO spawn_information VALUES (1,1,100,'Any',0,'Y',NULL,NULL,'Clear','Forest','Day',1);
INSERT INTO spawn_information VALUES (1,1,100,'Any',0,'Y',NULL,NULL,'Clear','Plains','Day',4);
INSERT INTO spawn_information VALUES (1,1,100,'Any',0,'Y',NULL,NULL,'Clear','River','Day',7);


-- ===========================================================
-- ITEM EVOLUTION – Fire Stone + Eevee -> Flareon
-- ============================================================

-- ITEM (kategoria Evolution)
INSERT INTO item VALUES ('Fire Stone', 'Y', 'Y', 'Evolution');

-- EVOLUTION (opis działania itemu)
INSERT INTO evolution VALUES ('Fire Stone', 'Eevee', 'Flareon');

-- POKEMON (dodajemy 2 nowe rekordy)
INSERT INTO pokemon VALUES (10,'Eevee',   0.3,  6.5,'unknown',NULL,'Normal',1);
INSERT INTO pokemon VALUES (11,'Flareon', 0.9, 25.0,'unknown',NULL,'Fire',  1);

-- EVOLUTION_METHOD (Item_method)
-- id=7 (nowe), to_pokemon=11 (Flareon), pokemon_id_pokedex=10 (Eevee)
INSERT INTO evolution_method
VALUES (7,11,NULL,'Item_method','Day','Clear','Plains',10);

-- ITEM_METHOD (podtyp dla evolution_method)
INSERT INTO item_method
VALUES (7, NULL, 'Fire Stone', 10);


/* Nidoran ♀ */
INSERT INTO pokemon VALUES
(15, 'Nidoran♀', 0.40, 7.00, 'female', NULL, 'Poison', 1);

/* Nidorina */
INSERT INTO pokemon VALUES
(16, 'Nidorina', 0.80, 20.00, 'female', NULL, 'Poison', 1);

/* Nidoqueen (Poison / Ground) */
INSERT INTO pokemon VALUES
(17, 'Nidoqueen', 1.30, 60.00, 'female', 'Ground', 'Poison', 1);


/* Nidoran ♂ */
INSERT INTO pokemon VALUES
(18, 'Nidoran♂', 0.50, 9.00, 'male', NULL, 'Poison', 1);

/* Nidorino */
INSERT INTO pokemon VALUES
(19, 'Nidorino', 0.90, 19.50, 'male', NULL, 'Poison', 1);

/* Nidoking (Poison / Ground) */
INSERT INTO pokemon VALUES
(20, 'Nidoking', 1.40, 62.00, 'male', 'Ground', 'Poison', 1);



/* ============================================================
   2. EVOLUTION – LEVEL
   ============================================================ */

/* Nidoran♀ → Nidorina (level) */
INSERT INTO evolution_method
VALUES (10, 16, NULL, 'Level_method', 'Day', 'Clear', 'Plains', 15);

INSERT INTO level_method
VALUES (10, 16, 15);


/* Nidoran♂ → Nidorino (level) */
INSERT INTO evolution_method
VALUES (11, 19, NULL, 'Level_method', 'Day', 'Clear', 'Plains', 18);

INSERT INTO level_method
VALUES (11, 16, 18);



/* ============================================================
   3. ITEM – Moon Stone
   ============================================================ */

INSERT INTO item
VALUES ('Moon Stone', 'Y', 'Y', 'Evolution');



/* ============================================================
   4. EVOLUTION – ITEM
   ============================================================ */

/* Nidorina → Nidoqueen */
INSERT INTO evolution_method
VALUES (12, 17, NULL, 'Item_method', 'Day', 'Clear', 'Plains', 16);

INSERT INTO item_method
VALUES (12, NULL, 'Moon Stone', 16);


/* Nidorino → Nidoking */
INSERT INTO evolution_method
VALUES (13, 20, NULL, 'Item_method', 'Day', 'Clear', 'Plains', 19);

INSERT INTO item_method
VALUES (13, NULL, 'Moon Stone', 19);



/* ============================================================
   5. SPAWN_INFORMATION
   ============================================================ */

/* Nidoran♀ – Plains */
INSERT INTO spawn_information
VALUES (
  3,              -- id_spawn
  5,              -- min_level
  15,             -- max_level
  'Common',       -- rarity
  40.0,           -- spawn_chance
  'Y',            -- can_see_sky
  NULL, NULL,     -- spawn height
  'Clear',
  'Plains',
  'Day',
  15
);

/* Nidoran♂ – Plains */
INSERT INTO spawn_information
VALUES (4,5,15,'Common',40.0,'Y',NULL, NULL,'Clear','Plains','Day',18);


-- Linia ewolucyjna Nidoranów
SELECT
  p1.name_of_pokemon AS from_pokemon,
  p2.name_of_pokemon AS to_pokemon,
  em.descr_method    AS evolution_method,
  lm.min_level,
  im.item_name_item
FROM evolution_method em
JOIN pokemon p1
  ON p1.id_pokedex = em.pokemon_id_pokedex
JOIN pokemon p2
  ON p2.id_pokedex = em.to_pokemon
LEFT JOIN level_method lm
  ON lm.id = em.id
LEFT JOIN item_method im
  ON im.id = em.id
WHERE p1.name_of_pokemon LIKE 'Nidoran%'
   OR p1.name_of_pokemon IN ('Nidorina','Nidorino')
ORDER BY p1.id_pokedex;


-- =========================================
-- ZAPYTANIA
-- =========================================
-- 1) List of Pokémon spawn occurrences in a specific biome and under a specific weather condition
SELECT
  p.id_pokedex,
  p.name_of_pokemon,
  s.biom_name_biom,
  s.weather_name_weather,
  s.time_of_day_name_daytime
FROM spawn_information s
JOIN pokemon p
  ON p.id_pokedex = s.pokemon_id_pokedex
WHERE s.biom_name_biom = 'Forest'
  AND s.weather_name_weather = 'Clear'
ORDER BY p.id_pokedex;


-- 2) List of attack types that are super-effective against the Pokémon “Charizard”
SELECT DISTINCT
  ca.type_name AS attacking_type,
  ca.multiplier,
  ca.category
FROM pokemon p
JOIN combat_array ca
  ON ca.type_name2 = p.type_name
  OR (p.type_name2 IS NOT NULL AND ca.type_name2 = p.type_name2)
WHERE p.name_of_pokemon = 'Charizard'
  AND ca.category = 'super_effective'
ORDER BY ca.type_name;


-- 3) Complete evolutionary line for a given species
-- Version 3-A: for a specific Pokémon (e.g., Bulbasaur) — evolves via
SELECT
  p1.name_of_pokemon AS from_pokemon,
  p2.name_of_pokemon AS to_pokemon,
  lm.min_level
FROM evolution_method em
JOIN level_method lm
  ON lm.id = em.id
 AND lm.id_pokedex = em.pokemon_id_pokedex
JOIN pokemon p1
  ON p1.id_pokedex = em.pokemon_id_pokedex
JOIN pokemon p2
  ON p2.id_pokedex = em.to_pokemon
WHERE p1.name_of_pokemon = 'Bulbasaur'
ORDER BY lm.min_level;


-- Version 3-B: complete evolutionary line of a “starter” (Bulbasaur → Ivysaur → Venusaur)
SELECT
  p1.name_of_pokemon AS stage1,
  p2.name_of_pokemon AS stage2,
  lm1.min_level      AS level_to_stage2,
  p3.name_of_pokemon AS stage3,
  lm2.min_level      AS level_to_stage3
FROM pokemon p1
JOIN evolution_method em1
  ON em1.pokemon_id_pokedex = p1.id_pokedex
JOIN level_method lm1
  ON lm1.id = em1.id AND lm1.id_pokedex = em1.pokemon_id_pokedex
JOIN pokemon p2
  ON p2.id_pokedex = em1.to_pokemon
LEFT JOIN evolution_method em2
  ON em2.pokemon_id_pokedex = p2.id_pokedex
LEFT JOIN level_method lm2
  ON lm2.id = em2.id AND lm2.id_pokedex = em2.pokemon_id_pokedex
LEFT JOIN pokemon p3
  ON p3.id_pokedex = em2.to_pokemon
WHERE p1.name_of_pokemon = 'Bulbasaur';


-- 4) Pokémon that require a specific item to evolve
SELECT
  p1.name_of_pokemon AS from_pokemon,
  p2.name_of_pokemon AS to_pokemon,
  im.item_name_item  AS required_item
FROM evolution_method em
JOIN item_method im
  ON im.id = em.id
 AND im.id_pokedex = em.pokemon_id_pokedex
JOIN pokemon p1
  ON p1.id_pokedex = em.pokemon_id_pokedex
JOIN pokemon p2
  ON p2.id_pokedex = em.to_pokemon
WHERE em.descr_method = 'Item_method'
  AND im.item_name_item = 'Fire Stone'
ORDER BY p1.id_pokedex;


-- 5) Possible loot drops from a selected species, including drop rates and quantities
SELECT
  p.name_of_pokemon,
  l.item_name_item,
  l.amount,
  l.rarity
FROM loot l
JOIN pokemon p
  ON p.id_pokedex = l.pokemon_id_pokedex
WHERE p.name_of_pokemon = 'Bulbasaur'
ORDER BY l.rarity DESC, l.item_name_item;


-- 6) List of all moves
SELECT *
FROM moves
ORDER BY type_name, name;


-- 7) Moves available for a specific Pokémon
SELECT
    p.name_of_pokemon AS pokemon,
    m.name            AS move_name,
    m.type_name,
    m.attack_power,
    m.attack_class,
    m.power_points,
    am.learning_method
FROM allowed_moves am
JOIN moves m
    ON am.moves_name = m.name
JOIN pokemon p
    ON am.pokemon_id_pokedex = p.id_pokedex
WHERE p.name_of_pokemon = 'Bulbasaur';


-- 8) List of Pokémon that can use a given move
SELECT
    m.name AS move_name,
    p.name_of_pokemon AS pokemon
FROM allowed_moves am
JOIN pokemon p
    ON am.pokemon_id_pokedex = p.id_pokedex
JOIN moves m
    ON am.moves_name = m.name
WHERE m.name = 'Water Gun';


-- 9) Number of moves each Pokémon can learn
SELECT
    p.name_of_pokemon AS pokemon,
    COUNT(am.moves_name) AS number_of_moves
FROM pokemon p
LEFT JOIN allowed_moves am
    ON p.id_pokedex = am.pokemon_id_pokedex
GROUP BY p.name_of_pokemon
ORDER BY number_of_moves DESC;



-- 10) Full info: Pokémon, move, type, generation
SELECT
    p.name_of_pokemon AS pokemon,
    g.generation_name AS gen_name,
    CASE
        WHEN p.type_name2 IS NULL
            THEN p.type_name
        ELSE p.type_name || ' / ' || p.type_name2
    END AS pokemon_type,
    LISTAGG(m.name, ', ')
        WITHIN GROUP (ORDER BY m.name) AS allowed_moves
FROM pokemon p
JOIN generation g
    ON p.generation_number = g."number"
LEFT JOIN allowed_moves am
    ON am.pokemon_id_pokedex = p.id_pokedex
LEFT JOIN moves m
    ON am.moves_name = m.name
GROUP BY
    p.name_of_pokemon,
    g.generation_name,
    p.type_name,
    p.type_name2
ORDER BY
    p.name_of_pokemon;


-- 11) All possible evolutions from the database
SELECT
  p1.name_of_pokemon AS from_pokemon,
  p2.name_of_pokemon AS to_pokemon,
  em.descr_method    AS evolution_type,
  lm.min_level,
  im.item_name_item
FROM evolution_method em
JOIN pokemon p1
  ON p1.id_pokedex = em.pokemon_id_pokedex
JOIN pokemon p2
  ON p2.id_pokedex = em.to_pokemon
LEFT JOIN level_method lm
  ON lm.id = em.id
LEFT JOIN item_method im
  ON im.id = em.id
ORDER BY em.descr_method, p1.name_of_pokemon;
