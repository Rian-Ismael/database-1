-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-18 00:18:47.311

-- tables
-- Table: Association
CREATE TABLE Association (
    id_association int  NOT NULL,
    nShirt int  NOT NULL,
    contract varchar(112)  NOT NULL,
    Team_id_Team int  NOT NULL,
    Jogo_id_Game int  NOT NULL,
    CONSTRAINT Association_pk PRIMARY KEY (id_association)
);

-- Table: Game
CREATE TABLE Game (
    id_game int  NOT NULL,
    result int  NOT NULL,
    CONSTRAINT Game_pk PRIMARY KEY (id_game)
);

-- Table: Gamer
CREATE TABLE Gamer (
    id_Gamer int  NOT NULL,
    Name varchar(12)  NOT NULL,
    nationality char(12)  NOT NULL,
    CONSTRAINT Gamer_pk PRIMARY KEY (id_Gamer)
);

-- Table: Match
CREATE TABLE Match (
    id_match int  NOT NULL,
    goals int  NOT NULL,
    Equipe_id_Team int  NOT NULL,
    Game_id_game int  NOT NULL,
    CONSTRAINT Match_pk PRIMARY KEY (id_match)
);

-- Table: Participation
CREATE TABLE Participation (
    id_participation int  NOT NULL,
    position int  NOT NULL,
    Gamer_id_Gamer int  NOT NULL,
    Game_id_game int  NOT NULL,
    CONSTRAINT Participation_pk PRIMARY KEY (id_participation)
);

-- Table: Team
CREATE TABLE Team (
    id_Team int  NOT NULL,
    Name char(12)  NOT NULL,
    Foundation char(12)  NOT NULL,
    CONSTRAINT Team_pk PRIMARY KEY (id_Team)
);

-- Table: client
CREATE TABLE client (
    id int  NOT NULL,
    full_name varchar(255)  NOT NULL,
    email varchar(255)  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id)
);

-- Table: product
CREATE TABLE product (
    id int  NOT NULL,
    product_category_id int  NOT NULL,
    sku char(10)  NOT NULL,
    name varchar(255)  NOT NULL,
    price decimal(12,2)  NOT NULL,
    description varchar(1000)  NOT NULL,
    image bytea  NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (id)
);

-- Table: product_category
CREATE TABLE product_category (
    id int  NOT NULL,
    name varchar(255)  NOT NULL,
    parent_category_id int  NULL,
    CONSTRAINT product_category_pk PRIMARY KEY (id)
);

-- Table: purchase
CREATE TABLE purchase (
    id int  NOT NULL,
    purchase_no char(12)  NOT NULL,
    client_id int  NOT NULL,
    CONSTRAINT purchase_pk PRIMARY KEY (id)
);

-- Table: purchase_item
CREATE TABLE purchase_item (
    id int  NOT NULL,
    purchase_id int  NOT NULL,
    product_id int  NOT NULL,
    amount int  NOT NULL,
    CONSTRAINT purchase_item_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Association_Jogo (table: Association)
ALTER TABLE Association ADD CONSTRAINT Association_Jogo
    FOREIGN KEY (Jogo_id_Game)
    REFERENCES Gamer (id_Gamer)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Association_Team (table: Association)
ALTER TABLE Association ADD CONSTRAINT Association_Team
    FOREIGN KEY (Team_id_Team)
    REFERENCES Team (id_Team)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Match_Equipe (table: Match)
ALTER TABLE Match ADD CONSTRAINT Match_Equipe
    FOREIGN KEY (Equipe_id_Team)
    REFERENCES Team (id_Team)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Match_Game (table: Match)
ALTER TABLE Match ADD CONSTRAINT Match_Game
    FOREIGN KEY (Game_id_game)
    REFERENCES Game (id_game)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Participation_Game (table: Participation)
ALTER TABLE Participation ADD CONSTRAINT Participation_Game
    FOREIGN KEY (Game_id_game)
    REFERENCES Game (id_game)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Participation_Gamer (table: Participation)
ALTER TABLE Participation ADD CONSTRAINT Participation_Gamer
    FOREIGN KEY (Gamer_id_Gamer)
    REFERENCES Gamer (id_Gamer)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: client_purchase (table: purchase)
ALTER TABLE purchase ADD CONSTRAINT client_purchase
    FOREIGN KEY (client_id)
    REFERENCES client (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: product_category_product (table: product)
ALTER TABLE product ADD CONSTRAINT product_category_product
    FOREIGN KEY (product_category_id)
    REFERENCES product_category (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: product_category_product_category (table: product_category)
ALTER TABLE product_category ADD CONSTRAINT product_category_product_category
    FOREIGN KEY (parent_category_id)
    REFERENCES product_category (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: product_purchase_item (table: purchase_item)
ALTER TABLE purchase_item ADD CONSTRAINT product_purchase_item
    FOREIGN KEY (product_id)
    REFERENCES product (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: purchase_purchase_item (table: purchase_item)
ALTER TABLE purchase_item ADD CONSTRAINT purchase_purchase_item
    FOREIGN KEY (purchase_id)
    REFERENCES purchase (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

