DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS rfid_user;
DROP TABLE IF EXISTS train;
DROP TABLE IF EXISTS train_car;
DROP TABLE IF EXISTS car_table;


CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  name TEXT NOT NULL,
  street_address TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  zip_code INTEGER NOT NULL,
  card_number TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);


CREATE TABLE rfid_user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  r_name TEXT NOT NULL,
  has_card BOOLEAN NOT NULL,
  age INTEGER NOT NULL,
  prepaid_orders_left INTEGER NOT NULL,
  total_orders_count INTEGER NOT NULL,
  past_orders_list TEXT
);

CREATE TABLE train (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  train_name TEXT UNIQUE NOT NULL,
  train_name_informal TEXT,
  train_num INTEGER UNIQUE
);

CREATE TABLE train_car (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  car_order_num INTEGER UNIQUE NOT NULL,
  train_id INTEGER NOT NULL,
  FOREIGN KEY (train_id) REFERENCES train (id)
);

CREATE TABLE car_table (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  table_num INTEGER UNIQUE NOT NULL,
  location_description TEXT,
  train_id INTEGER NOT NULL,
  train_car_id INTEGER NOT NULL,
  FOREIGN KEY (train_id) REFERENCES train (id),
  FOREIGN KEY (train_car_id) REFERENCES train_car (id)
);

DROP TABLE IF EXISTS drink;
DROP TABLE IF EXISTS food;

CREATE TABLE drink (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  drink_name TEXT NOT NULL,
  beer BOOLEAN NOT NULL,
  wine BOOLEAN NOT NULL,
  virgin BOOLEAN NOT NULL,
  cocktail BOOLEAN NOT NULL,
  price INTEGER NOT NULL,
  drink_volume INTEGER,
  we_has BOOLEAN NOT NULL
);

CREATE TABLE food (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  food_name TEXT UNIQUE NOT NULL,
  snack BOOLEAN NOT NULL,
  main BOOLEAN NOT NULL,
  pre_main BOOLEAN NOT NULL,
  dessert BOOLEAN NOT NULL,
  price INTEGER NOT NULL,
  size INTEGER,
  we_has BOOLEAN NOT NULL
);


DROP TABLE IF EXISTS list_order;

CREATE TABLE list_order (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL,
  rfid_user_id INTEGER NOT NULL,
  total_cost INTEGER NOT NULL,
  car_table_id INTEGER NOT NULL,
  list_drinks TEXT NOT NULL,
  list_food TEXT NOT NULL,
  time_to_make DATETIME,
  FOREIGN KEY (user_id) REFERENCES user (id),
  FOREIGN KEY (rfid_user_id) REFERENCES rfid_user (id),
  FOREIGN KEY (car_table_id) REFERENCES car_table (id)
);