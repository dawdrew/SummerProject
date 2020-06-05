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
  total_o_count INTEGER NOT NULL,
  past_orders_list TEXT
);
INSERT INTO rfid_user(r_name,has_card,age,prepaid_orders_left,total_o_count)
VALUES
  ('dick butt', 1,21,0,3),
  ('taint wax', 1,16,0,3),
  ('Seth Andrews', 1,45,0,3);


CREATE TABLE train (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  train_name TEXT UNIQUE NOT NULL,
  train_name_informal TEXT,
  train_num INTEGER UNIQUE
);
INSERT INTO train(train_name,train_num)
VALUES
  ('the last train',68);

CREATE TABLE train_car (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  car_order_num INTEGER UNIQUE NOT NULL,
  train_id INTEGER NOT NULL,
  FOREIGN KEY (train_id) REFERENCES train (id)
);
INSERT INTO train_car(car_order_num,train_id)
VALUES
  (1,1),
  (2,1),
  (3,1);


CREATE TABLE car_table (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  table_num INTEGER NOT NULL,
  location_description TEXT,
  train_car_id INTEGER NOT NULL,
  FOREIGN KEY (train_car_id) REFERENCES train_car (id)
);
INSERT INTO car_table(table_num,train_car_id)
VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (6,1),
  (1,2),
  (2,2),
  (3,2),
  (1,3),
  (2,3),
  (3,3);



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
INSERT INTO drink(drink_name,beer,wine,virgin,cocktail,price,we_has)
VALUES
  ('piss',0,1,0,0,5,1),
  ('cum',0,0,1,0,5,1),
  ('blood',0,0,0,1,5,1);


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

INSERT INTO food(food_name,snack,main,pre_main,dessert,price,we_has)
VALUES
  ('shaft',0,1,0,0,5,1),
  ('balls',0,0,0,1,5,1),
  ('nipps',0,0,1,0,5,1);


DROP TABLE IF EXISTS list_drinks;
DROP TABLE IF EXISTS list_foods;

CREATE TABLE list_foods (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rfid_user_id INTEGER NOT NULL,
  rfid_user_total_o_count INTEGER NOT NULL,
  food_id INTEGER NOT NULL,
  food_count INTEGER NOT NULL,
  FOREIGN KEY (rfid_user_id) REFERENCES rfid_user (id),
  FOREIGN KEY (rfid_user_total_o_count) REFERENCES rfid_user (total_o_count),
  FOREIGN KEY (food_id) REFERENCES food (id)
);
INSERT INTO list_foods(rfid_user_id,rfid_user_total_o_count,food_id,food_count)
VALUES
  (1,1,3,3),
  (2,1,2,1),
  (1,2,1,2),
  (2,2,1,1);


CREATE TABLE list_drinks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rfid_user_id INTEGER NOT NULL,
  rfid_user_total_o_count INTEGER NOT NULL,
  drink_id INTEGER NOT NULL,
  drink_count INTEGER NOT NULL,
  FOREIGN KEY (rfid_user_id) REFERENCES rfid_user (id),
  FOREIGN KEY (rfid_user_total_o_count) REFERENCES rfid_user (total_o_count),
  FOREIGN KEY (drink_id) REFERENCES drink (id)
);
INSERT INTO list_drinks(rfid_user_id,rfid_user_total_o_count,drink_id,drink_count)
VALUES
  (1,1,1,5),
  (2,1,1,2),
  (2,1,2,2),
  (1,2,2,1);




DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  car_table_table_num INTEGER NOT NULL,
  rfid_user_id INTEGER NOT NULL,
  total_cost INTEGER NOT NULL,
  car_table_id INTEGER NOT NULL,
  rfid_user_total_o_count INTEGER NOT NULL,
  FOREIGN KEY (car_table_table_num) REFERENCES car_table (table_num),
  FOREIGN KEY (rfid_user_id) REFERENCES rfid_user (id),
  FOREIGN KEY (car_table_id) REFERENCES car_table (id),
  FOREIGN KEY (rfid_user_total_o_count) REFERENCES rfid_user (total_o_count)
);

INSERT INTO orders(user_id,rfid_user_id,total_cost,car_table_id,rfid_user_total_o_count)
VALUES
  (1,1,15,1,1),
  (2,2,10,2,1),
  (2,2,05,3,2),
  (1,1,01,4,2);