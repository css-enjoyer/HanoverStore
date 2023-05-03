CREATE TABLE product 
    (PROD_ID INT NOT NULL PRIMARY KEY 
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    PROD_NAME VARCHAR(100) NOT NULL,
    PROD_PRICE VARCHAR(100) NOT NULL,
    PROD_IMAGE VARCHAR(255) NOT NULL,
    PROD_RATING INT NOT NULL);

INSERT INTO 
    product (PROD_NAME, PROD_PRICE, PROD_IMAGE, PROD_RATING)
VALUES
    ("Travis Scott x Jordan 1s", "94,689.00", "Images/Featured-TSJordan1s.png", 8), 
    ("Nike x Yeezy Zen Grey", "185,699.00", "Images/Featured-NikeXYeezyZenGrey.png", 4),
    ("Adidas X Gucci Gazelle", "53,364.00", "Images/AdidasXGucciGazelleRed.png", 5),
    ("Rick Owens Vintage Sneaks", "81,055.00", "Images/RickOwensVintageSneaks.png", 8),
    ("Js1 RH Dior", "353,587.50", "Images/Jordan1RetroHighDior.png", 9),
    ("Adidas Y3 Runners", "40,259.00", "Images/AdidasY3Runner4D.png", 5),
    ("Nike SBD CLs", "31,125.50", "Images/NikeSBDunkLowCoffeeLovers.png", 5),
    ("Air Max 1 Atmost E", "33,499.00", "Images/NikeAirMax1AtmosElephant.png", 7),
    ("Kobe 6 Protro", "43,099.00", "Images/Kobe6ProtroEYBL.png", 5),
    ("J1 RH Trophy Room", "89,099.00", "Images/Jordan1RetroHighTrophyRoom.png", 6),
    ("AC/DC Chuck Taylors", "4,520.00", "Images/Offer-ChuckTaylorXACDC.jpg", 9);