-- © 2026 Cobblemon Database Design | v1.0

CREATE TABLE ability_method (
    id         INTEGER NOT NULL,
    name       VARCHAR2(40) NOT NULL,
    id_pokedex NUMBER(4) NOT NULL
);

ALTER TABLE ability_method ADD CONSTRAINT ability_method_pk PRIMARY KEY ( id,
                                                                          id_pokedex );

CREATE TABLE allowed_moves (
    learning_method    VARCHAR2(30) NOT NULL,
    moves_name         VARCHAR2(40) NOT NULL,
    pokemon_id_pokedex NUMBER(4) NOT NULL
);

ALTER TABLE allowed_moves ADD CONSTRAINT allowed_moves_pk PRIMARY KEY ( moves_name,
                                                                        pokemon_id_pokedex );

CREATE TABLE biom (
    name_biom VARCHAR2(20) NOT NULL,
    climate   VARCHAR2(20) NOT NULL
);

ALTER TABLE biom ADD CONSTRAINT biom_pk PRIMARY KEY ( name_biom );

CREATE TABLE catching (
    name_item           VARCHAR2(40) NOT NULL,
    catch_rate_modifier NUMBER(3, 2) NOT NULL
);

ALTER TABLE catching ADD CONSTRAINT catching_pk PRIMARY KEY ( name_item );


CREATE TABLE combat_area (
    name_item     VARCHAR2(40) NOT NULL,
    defence_boost SMALLINT,
    attack_boost  SMALLINT,
    description   CLOB
);

ALTER TABLE combat_area ADD CONSTRAINT combat_area_pk PRIMARY KEY ( name_item );

CREATE TABLE combat_array (
    type_name  VARCHAR2(20) NOT NULL,
    type_name2 VARCHAR2(20) NOT NULL,
    multiplier NUMBER(3, 2) NOT NULL,
    category   VARCHAR2(20) NOT NULL
);

ALTER TABLE combat_array ADD CONSTRAINT combat_array_pk PRIMARY KEY ( type_name,
                                                                      type_name2 );

CREATE TABLE evolution (
    name_item    VARCHAR2(40) NOT NULL,
    usable_by    VARCHAR2(20) NOT NULL,
    evolves_into VARCHAR2(20) NOT NULL
);

ALTER TABLE evolution ADD CONSTRAINT evolution_pk PRIMARY KEY ( name_item );

CREATE TABLE evolution_method (
    id                       INTEGER NOT NULL,
    to_pokemon               INTEGER NOT NULL,
    unique_feature           CLOB,
    descr_method             VARCHAR2(40) NOT NULL,
    time_of_day_name_daytime VARCHAR2(20) NOT NULL,
    weather_name_weather     VARCHAR2(20) NOT NULL,
    biom_name_biom           VARCHAR2(20) NOT NULL,
    pokemon_id_pokedex       NUMBER(4) NOT NULL
);

ALTER TABLE evolution_method ADD CONSTRAINT evolution_method_pk PRIMARY KEY ( id,
                                                                              pokemon_id_pokedex );

CREATE TABLE generation (
    "number"        NUMBER(2) NOT NULL,
    generation_name VARCHAR2(20) NOT NULL,
    region_name     VARCHAR2(20) NOT NULL
);

ALTER TABLE generation ADD CONSTRAINT generation_pk PRIMARY KEY ( "number" );

CREATE TABLE healing (
    name_item       VARCHAR2(40) NOT NULL,
    revive          CHAR(1) NOT NULL,
    healing_rate    NUMBER(5, 2),
    cleaning_effect CHAR(1) NOT NULL
);

ALTER TABLE healing ADD CONSTRAINT healing_pk PRIMARY KEY ( name_item );

CREATE TABLE item (
    name_item            VARCHAR2(40) NOT NULL,
    holdable_for_pokemon CHAR(1) NOT NULL,
    consumable           CHAR(1) NOT NULL,
    descr_category       VARCHAR2(40) NOT NULL
);

ALTER TABLE item ADD CONSTRAINT item_pk PRIMARY KEY ( name_item );

CREATE TABLE item_method (
    id             INTEGER NOT NULL,
    min_level      SMALLINT,
    item_name_item VARCHAR2(40) NOT NULL,
    id_pokedex     NUMBER(4) NOT NULL
);

ALTER TABLE item_method ADD CONSTRAINT item_method_pk PRIMARY KEY ( id,
                                                                    id_pokedex );

CREATE TABLE learning_moves (
    name_item      VARCHAR2(40) NOT NULL,
    attack_name    VARCHAR2(40) NOT NULL,
    number_of_uses SMALLINT NOT NULL
);

ALTER TABLE learning_moves ADD CONSTRAINT learning_moves_pk PRIMARY KEY ( name_item );

CREATE TABLE level_method (
    id         INTEGER NOT NULL,
    min_level  SMALLINT NOT NULL,
    id_pokedex NUMBER(4) NOT NULL
);

ALTER TABLE level_method ADD CONSTRAINT level_method_pk PRIMARY KEY ( id,
                                                                      id_pokedex );

CREATE TABLE loot (
    amount             INTEGER NOT NULL,
    rarity             NUMBER(5, 2) NOT NULL,
    item_name_item     VARCHAR2(40) NOT NULL,
    pokemon_id_pokedex NUMBER(4) NOT NULL
);

ALTER TABLE loot ADD CONSTRAINT loot_pk PRIMARY KEY ( item_name_item,
                                                      pokemon_id_pokedex );

CREATE TABLE moves (
    name         VARCHAR2(40) NOT NULL,
    attack_class VARCHAR2(20) NOT NULL,
    attack_power SMALLINT NOT NULL,
    power_points SMALLINT NOT NULL,
    type_name    VARCHAR2(20) NOT NULL
);

ALTER TABLE moves ADD CONSTRAINT moves_pk PRIMARY KEY ( name );

CREATE TABLE pokemon (
    id_pokedex        NUMBER(4) NOT NULL,
    name_of_pokemon   VARCHAR2(20) NOT NULL,
    average_height    NUMBER(5, 2) NOT NULL,
    average_weight    NUMBER(6, 2) NOT NULL,
    sex               VARCHAR2(10) NOT NULL,
    type_name2        VARCHAR2(20),
    type_name         VARCHAR2(20) NOT NULL,
    generation_number NUMBER(2) NOT NULL
);

ALTER TABLE pokemon ADD CONSTRAINT pokemon_pk PRIMARY KEY ( id_pokedex );

CREATE TABLE relation_method (
    id              INTEGER NOT NULL,
    happiness_level NUMBER(3) NOT NULL,
    id_pokedex      NUMBER(4) NOT NULL
);

ALTER TABLE relation_method ADD CONSTRAINT relation_method_pk PRIMARY KEY ( id,
                                                                            id_pokedex );

CREATE TABLE spawn_information (
    id_spawn                 INTEGER NOT NULL,
    min_level                SMALLINT NOT NULL,
    max_level                SMALLINT NOT NULL,
    rarity                   VARCHAR2(20) NOT NULL,
    spawn_chance             NUMBER(5, 2) NOT NULL,
    can_see_sky              CHAR(1) NOT NULL,
    "min_spawn_height_(Y)"   SMALLINT,
    "max_spawn_height_(Y)"   SMALLINT,
    weather_name_weather     VARCHAR2(20) NOT NULL,
    biom_name_biom           VARCHAR2(20) NOT NULL,
    time_of_day_name_daytime VARCHAR2(20) NOT NULL,
    pokemon_id_pokedex       NUMBER(4) NOT NULL
);

ALTER TABLE spawn_information ADD CONSTRAINT spawn_information_pk PRIMARY KEY ( pokemon_id_pokedex,
                                                                                id_spawn );

CREATE TABLE special (
    name_item   VARCHAR2(40) NOT NULL,
    description CLOB NOT NULL
);

ALTER TABLE special ADD CONSTRAINT special_pk PRIMARY KEY ( name_item );

CREATE TABLE time_of_day (
    name_daytime             VARCHAR2(20) NOT NULL,
    start_minute             NUMBER(5,2) NOT NULL,
    end_minute               NUMBER(5,2) NOT NULL,
    real_seconds_per_mc_hour NUMBER(5,2) NOT NULL
);

ALTER TABLE time_of_day ADD CONSTRAINT time_of_day_pk PRIMARY KEY ( name_daytime );

CREATE TABLE trade_method (
    id                             INTEGER NOT NULL,
    required_trade_partner_pokemon VARCHAR2(20),
    item_name_item                 VARCHAR2(40) NOT NULL,
    id_pokedex                     NUMBER(4) NOT NULL
);

ALTER TABLE trade_method ADD CONSTRAINT trade_method_pk PRIMARY KEY ( id,
                                                                      id_pokedex );

CREATE TABLE type (
    name              VARCHAR2(20) NOT NULL,
    color             VARCHAR2(20) NOT NULL,
    representing_icon VARCHAR2(40) NOT NULL
);

ALTER TABLE type ADD CONSTRAINT type_pk PRIMARY KEY ( name );

CREATE TABLE weather (
    name_weather VARCHAR2(20) NOT NULL,
    description  CLOB
);

ALTER TABLE weather ADD CONSTRAINT weather_pk PRIMARY KEY ( name_weather );


-- BOOL (Y/N)
ALTER TABLE item
  ADD CONSTRAINT item_holdable_for_pokemon_ck
  CHECK (holdable_for_pokemon IN ('Y','N'));

ALTER TABLE item
  ADD CONSTRAINT item_consumable_ck
  CHECK (consumable IN ('Y','N'));

ALTER TABLE healing
  ADD CONSTRAINT healing_revive_ck
  CHECK (revive IN ('Y','N'));

ALTER TABLE healing
  ADD CONSTRAINT healing_cleaning_effect_ck
  CHECK (cleaning_effect IN ('Y','N'));

ALTER TABLE spawn_information
  ADD CONSTRAINT si_can_see_sky_ck
  CHECK (can_see_sky IN ('Y','N'));

-- Dyskryminatory (podtypy)
ALTER TABLE item
  ADD CONSTRAINT item_descr_category_ck
  CHECK (descr_category IN ('Special','Combat_area','Healing','Catching','Learning_moves','Evolution'));

ALTER TABLE evolution_method
  ADD CONSTRAINT em_descr_method_ck
  CHECK (descr_method IN ('Ability_method','Level_method','Relation_method','Trade_method','Item_method'));

-- MOVES
ALTER TABLE moves
  ADD CONSTRAINT moves_attack_class_ck
  CHECK (attack_class IN ('physical','special','status'));

ALTER TABLE moves
  ADD CONSTRAINT moves_attack_power_ck
  CHECK (attack_power BETWEEN 0 AND 300);

ALTER TABLE moves
  ADD CONSTRAINT moves_power_points_ck
  CHECK (power_points BETWEEN 1 AND 99);

-- COMBAT_ARRAY
ALTER TABLE combat_array
  ADD CONSTRAINT ca_multiplier_ck
  CHECK (multiplier IN (0, 0.5, 1, 2));

ALTER TABLE combat_array
  ADD CONSTRAINT ca_category_ck
  CHECK (category IN ('no_effect','not_very_effective','normal','super_effective'));

-- POKEMON
ALTER TABLE pokemon
  ADD CONSTRAINT p_height_ck
  CHECK (average_height > 0);

ALTER TABLE pokemon
  ADD CONSTRAINT p_weight_ck
  CHECK (average_weight > 0);

ALTER TABLE pokemon
  ADD CONSTRAINT p_sex_ck
  CHECK (sex IN ('male','female','genderless','unknown'));

ALTER TABLE pokemon
  ADD CONSTRAINT p_type2_diff_ck
  CHECK (type_name2 IS NULL OR type_name2 <> type_name);

ALTER TABLE generation
  ADD CONSTRAINT gen_number_ck
  CHECK ("number" BETWEEN 1 AND 9);

ALTER TABLE pokemon
  ADD CONSTRAINT p_generation_number_ck
  CHECK (generation_number BETWEEN 1 AND 9);

-- SPAWN_INFORMATION
ALTER TABLE spawn_information
  ADD CONSTRAINT si_level_range_ck
  CHECK (min_level BETWEEN 1 AND 100 AND max_level BETWEEN 1 AND 100);

ALTER TABLE spawn_information
  ADD CONSTRAINT si_min_le_max_ck
  CHECK (min_level <= max_level);

ALTER TABLE spawn_information
  ADD CONSTRAINT si_spawn_chance_ck
  CHECK (spawn_chance BETWEEN 0 AND 100);

ALTER TABLE spawn_information
  ADD CONSTRAINT si_min_spawn_height_ck
  CHECK ("min_spawn_height_(Y)" IS NULL OR "min_spawn_height_(Y)" BETWEEN -64 AND 320);

ALTER TABLE spawn_information
  ADD CONSTRAINT si_max_spawn_height_ck
  CHECK ("max_spawn_height_(Y)" IS NULL OR "max_spawn_height_(Y)" BETWEEN -64 AND 320);

ALTER TABLE spawn_information
  ADD CONSTRAINT si_height_min_le_max_ck
  CHECK (
    "min_spawn_height_(Y)" IS NULL
    OR "max_spawn_height_(Y)" IS NULL
    OR "min_spawn_height_(Y)" <= "max_spawn_height_(Y)"
  );

-- LOOT
ALTER TABLE loot
  ADD CONSTRAINT loot_amount_ck
  CHECK (amount > 0);

ALTER TABLE loot
  ADD CONSTRAINT loot_rarity_ck
  CHECK (rarity BETWEEN 0 AND 100);

-- ITEM/PODTYPY
ALTER TABLE learning_moves
  ADD CONSTRAINT lm_number_of_uses_ck
  CHECK (number_of_uses > 0);

ALTER TABLE catching
  ADD CONSTRAINT c_catch_rate_modifier_ck
  CHECK (catch_rate_modifier >= 0);

ALTER TABLE healing
  ADD CONSTRAINT h_healing_rate_ck
  CHECK (healing_rate IS NULL OR healing_rate >= 0);

ALTER TABLE combat_area
  ADD CONSTRAINT ca_attack_boost_ck
  CHECK (attack_boost IS NULL OR attack_boost BETWEEN -100 AND 100);

ALTER TABLE combat_area
  ADD CONSTRAINT ca_defence_boost_ck
  CHECK (defence_boost IS NULL OR defence_boost BETWEEN -100 AND 100);

-- TIME_OF_DAY
ALTER TABLE time_of_day
  ADD CONSTRAINT tod_minute_range_ck
  CHECK (
    start_minute >= 0
    AND end_minute <= 20
    AND start_minute < end_minute
  );

ALTER TABLE time_of_day
  ADD CONSTRAINT tod_real_seconds_ck
  CHECK (real_seconds_per_mc_hour > 0);


-- EVOLUTION METHODS
ALTER TABLE level_method
  ADD CONSTRAINT lv_min_level_ck
  CHECK (min_level BETWEEN 1 AND 100);

ALTER TABLE item_method
  ADD CONSTRAINT im_min_level_ck
  CHECK (min_level IS NULL OR min_level BETWEEN 1 AND 100);

ALTER TABLE relation_method
  ADD CONSTRAINT rm_happiness_ck
  CHECK (happiness_level BETWEEN 0 AND 100);



ALTER TABLE ability_method
    ADD CONSTRAINT am_evolution_method_fk
        FOREIGN KEY ( id,
                      id_pokedex )
            REFERENCES evolution_method ( id,
                                          pokemon_id_pokedex );

ALTER TABLE allowed_moves
    ADD CONSTRAINT am_moves_fk FOREIGN KEY ( moves_name )
        REFERENCES moves ( name );

ALTER TABLE allowed_moves
    ADD CONSTRAINT am_pokemon_fk FOREIGN KEY ( pokemon_id_pokedex )
        REFERENCES pokemon ( id_pokedex );

ALTER TABLE catching
    ADD CONSTRAINT c_item_fk FOREIGN KEY ( name_item )
        REFERENCES item ( name_item );

ALTER TABLE combat_area
    ADD CONSTRAINT ca_item_fk FOREIGN KEY ( name_item )
        REFERENCES item ( name_item );

ALTER TABLE combat_array
    ADD CONSTRAINT combat_array_type_fk FOREIGN KEY ( type_name )
        REFERENCES type ( name );

ALTER TABLE combat_array
    ADD CONSTRAINT combat_array_type_fkv2 FOREIGN KEY ( type_name2 )
        REFERENCES type ( name );

ALTER TABLE evolution
    ADD CONSTRAINT e_item_fk FOREIGN KEY ( name_item )
        REFERENCES item ( name_item );

ALTER TABLE evolution_method
    ADD CONSTRAINT em_biom_fk FOREIGN KEY ( biom_name_biom )
        REFERENCES biom ( name_biom );

ALTER TABLE evolution_method
    ADD CONSTRAINT em_pokemon_fk FOREIGN KEY ( pokemon_id_pokedex )
        REFERENCES pokemon ( id_pokedex );

ALTER TABLE evolution_method
    ADD CONSTRAINT em_time_of_day_fk FOREIGN KEY ( time_of_day_name_daytime )
        REFERENCES time_of_day ( name_daytime );

ALTER TABLE evolution_method
    ADD CONSTRAINT em_weather_fk FOREIGN KEY ( weather_name_weather )
        REFERENCES weather ( name_weather );

ALTER TABLE healing
    ADD CONSTRAINT h_item_fk FOREIGN KEY ( name_item )
        REFERENCES item ( name_item );

ALTER TABLE item_method
    ADD CONSTRAINT im_evolution_method_fk
        FOREIGN KEY ( id,
                      id_pokedex )
            REFERENCES evolution_method ( id,
                                          pokemon_id_pokedex );

ALTER TABLE item_method
    ADD CONSTRAINT im_item_fk FOREIGN KEY ( item_name_item )
        REFERENCES item ( name_item );

ALTER TABLE loot
    ADD CONSTRAINT l_item_fk FOREIGN KEY ( item_name_item )
        REFERENCES item ( name_item );

ALTER TABLE learning_moves
    ADD CONSTRAINT l_moves_item_fk FOREIGN KEY ( name_item )
        REFERENCES item ( name_item );

ALTER TABLE loot
    ADD CONSTRAINT l_pokemon_fk FOREIGN KEY ( pokemon_id_pokedex )
        REFERENCES pokemon ( id_pokedex );

ALTER TABLE level_method
    ADD CONSTRAINT lm_evolution_method_fk
        FOREIGN KEY ( id,
                      id_pokedex )
            REFERENCES evolution_method ( id,
                                          pokemon_id_pokedex );

ALTER TABLE moves
    ADD CONSTRAINT m_type_fk FOREIGN KEY ( type_name )
        REFERENCES type ( name );

ALTER TABLE pokemon
    ADD CONSTRAINT pokemon_generation_fk FOREIGN KEY ( generation_number )
        REFERENCES generation ( "number" );

ALTER TABLE pokemon
    ADD CONSTRAINT pokemon_type_fk FOREIGN KEY ( type_name )
        REFERENCES type ( name );

ALTER TABLE pokemon
    ADD CONSTRAINT pokemon_type_fkv2 FOREIGN KEY ( type_name2 )
        REFERENCES type ( name );

ALTER TABLE relation_method
    ADD CONSTRAINT rm_evolution_method_fk
        FOREIGN KEY ( id,
                      id_pokedex )
            REFERENCES evolution_method ( id,
                                          pokemon_id_pokedex );

ALTER TABLE special
    ADD CONSTRAINT s_item_fk FOREIGN KEY ( name_item )
        REFERENCES item ( name_item );

ALTER TABLE spawn_information
    ADD CONSTRAINT si_biom_fk FOREIGN KEY ( biom_name_biom )
        REFERENCES biom ( name_biom );

ALTER TABLE spawn_information
    ADD CONSTRAINT si_pokemon_fk FOREIGN KEY ( pokemon_id_pokedex )
        REFERENCES pokemon ( id_pokedex );

ALTER TABLE spawn_information
    ADD CONSTRAINT si_time_of_day_fk FOREIGN KEY ( time_of_day_name_daytime )
        REFERENCES time_of_day ( name_daytime );

ALTER TABLE spawn_information
    ADD CONSTRAINT si_weather_fk FOREIGN KEY ( weather_name_weather )
        REFERENCES weather ( name_weather );

ALTER TABLE trade_method
    ADD CONSTRAINT tm_evolution_method_fk
        FOREIGN KEY ( id,
                      id_pokedex )
            REFERENCES evolution_method ( id,
                                          pokemon_id_pokedex );

ALTER TABLE trade_method
    ADD CONSTRAINT tm_item_fk FOREIGN KEY ( item_name_item )
        REFERENCES item ( name_item );



/* ============================================================
   TRIGGERS (ARC)

   - zostały automatycznie wygenerowane przez narzędzie modelujące
     w celu wymuszenia tzw. ARC constraint (dziedziczenie supertyp–podtyp).

   - pilnują, żeby rekord w tabeli podtypu mógł istnieć tylko wtedy,
     gdy w tabeli supertypu ma właściwą wartość "dyskryminatora"
     (descr_method dla evolution_method, descr_category dla item).

   - BEFORE INSERT/UPDATE: pobierają wartość dyskryminatora z tabeli nadrzędnej,
     a jeśli nie pasuje do podtypu → raise_application_error.
   ============================================================ */


-- [ARC] Evolution_method -> (Item_method)
CREATE OR REPLACE TRIGGER arc_fkarc_1_item_method BEFORE
    INSERT OR UPDATE OF id, id_pokedex ON item_method
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_method
    INTO d
    FROM
        evolution_method a
    WHERE
            a.id = :new.id
        AND a.pokemon_id_pokedex = :new.id_pokedex;

    IF ( d IS NULL
         OR d <> 'Item_method' ) THEN
        raise_application_error(-20223, 'FK Im_Evolution_Method_FK in Table Item_method violates Arc constraint on Table Evolution_Method - discriminator column descr_method doesn''t have value ''Item_method'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Evolution_method -> (Ability_method)
CREATE OR REPLACE TRIGGER arc_fkarc_1_ability_method BEFORE
    INSERT OR UPDATE OF id, id_pokedex ON ability_method
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_method
    INTO d
    FROM
        evolution_method a
    WHERE
            a.id = :new.id
        AND a.pokemon_id_pokedex = :new.id_pokedex;

    IF ( d IS NULL
         OR d <> 'Ability_method' ) THEN
        raise_application_error(-20223, 'FK Am_Evolution_Method_FK in Table Ability_method violates Arc constraint on Table Evolution_Method - discriminator column descr_method doesn''t have value ''Ability_method'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Evolution_method -> (Trade_method)
CREATE OR REPLACE TRIGGER arc_fkarc_1_trade_method BEFORE
    INSERT OR UPDATE OF id, id_pokedex ON trade_method
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_method
    INTO d
    FROM
        evolution_method a
    WHERE
            a.id = :new.id
        AND a.pokemon_id_pokedex = :new.id_pokedex;

    IF ( d IS NULL
         OR d <> 'Trade_method' ) THEN
        raise_application_error(-20223, 'FK Tm_Evolution_Method_FK in Table Trade_method violates Arc constraint on Table Evolution_Method - discriminator column descr_method doesn''t have value ''Trade_method'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Evolution_method -> (Level_method)
CREATE OR REPLACE TRIGGER arc_fkarc_1_level_method BEFORE
    INSERT OR UPDATE OF id, id_pokedex ON level_method
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_method
    INTO d
    FROM
        evolution_method a
    WHERE
            a.id = :new.id
        AND a.pokemon_id_pokedex = :new.id_pokedex;

    IF ( d IS NULL
         OR d <> 'Level_method' ) THEN
        raise_application_error(-20223, 'FK Lm_Evolution_Method_FK in Table Level_method violates Arc constraint on Table Evolution_Method - discriminator column descr_method doesn''t have value ''Level_method'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Evolution_method -> (Relation_method)
CREATE OR REPLACE TRIGGER arc_fkarc_1_relation_method BEFORE
    INSERT OR UPDATE OF id, id_pokedex ON relation_method
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_method
    INTO d
    FROM
        evolution_method a
    WHERE
            a.id = :new.id
        AND a.pokemon_id_pokedex = :new.id_pokedex;

    IF ( d IS NULL
         OR d <> 'Relation_method' ) THEN
        raise_application_error(-20223, 'FK Rm_Evolution_Method_FK in Table Relation_method violates Arc constraint on Table Evolution_Method - discriminator column descr_method doesn''t have value ''Relation_method'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Item -> (Combat_area)
CREATE OR REPLACE TRIGGER arc_fkarc_2_combat_area BEFORE
    INSERT OR UPDATE OF name_item ON combat_area
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_category
    INTO d
    FROM
        item a
    WHERE
        a.name_item = :new.name_item;

    IF ( d IS NULL
         OR d <> 'Combat_area' ) THEN
        raise_application_error(-20223, 'FK Ca_Item_FK in Table Combat_area violates Arc constraint on Table Item - discriminator column descr_category doesn''t have value ''Combat_area'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Item -> (Evolution)
CREATE OR REPLACE TRIGGER arc_fkarc_2_evolution BEFORE
    INSERT OR UPDATE OF name_item ON evolution
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_category
    INTO d
    FROM
        item a
    WHERE
        a.name_item = :new.name_item;

    IF ( d IS NULL
         OR d <> 'Evolution' ) THEN
        raise_application_error(-20223, 'FK E_Item_FK in Table Evolution violates Arc constraint on Table Item - discriminator column descr_category doesn''t have value ''Evolution'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Item -> (Healing)
CREATE OR REPLACE TRIGGER arc_fkarc_2_healing BEFORE
    INSERT OR UPDATE OF name_item ON healing
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_category
    INTO d
    FROM
        item a
    WHERE
        a.name_item = :new.name_item;

    IF ( d IS NULL
         OR d <> 'Healing' ) THEN
        raise_application_error(-20223, 'FK H_Item_FK in Table Healing violates Arc constraint on Table Item - discriminator column descr_category doesn''t have value ''Healing'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Item -> (Special)
CREATE OR REPLACE TRIGGER arc_fkarc_2_special BEFORE
    INSERT OR UPDATE OF name_item ON special
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_category
    INTO d
    FROM
        item a
    WHERE
        a.name_item = :new.name_item;

    IF ( d IS NULL
         OR d <> 'Special' ) THEN
        raise_application_error(-20223, 'FK S_Item_FK in Table Special violates Arc constraint on Table Item - discriminator column descr_category doesn''t have value ''Special'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Item -> (Catching)
CREATE OR REPLACE TRIGGER arc_fkarc_2_catching BEFORE
    INSERT OR UPDATE OF name_item ON catching
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_category
    INTO d
    FROM
        item a
    WHERE
        a.name_item = :new.name_item;

    IF ( d IS NULL
         OR d <> 'Catching' ) THEN
        raise_application_error(-20223, 'FK C_Item_FK in Table Catching violates Arc constraint on Table Item - discriminator column descr_category doesn''t have value ''Catching'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

-- [ARC] Item -> (Learning_moves)
CREATE OR REPLACE TRIGGER arc_fkarc_2_learning_moves BEFORE
    INSERT OR UPDATE OF name_item ON learning_moves
    FOR EACH ROW
DECLARE
    d VARCHAR2(40);
BEGIN
    SELECT
        a.descr_category
    INTO d
    FROM
        item a
    WHERE
        a.name_item = :new.name_item;

    IF ( d IS NULL
         OR d <> 'Learning_moves' ) THEN
        raise_application_error(-20223, 'FK L_moves_Item_FK in Table Learning_moves violates Arc constraint on Table Item - discriminator column descr_category doesn''t have value ''Learning_moves'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/
