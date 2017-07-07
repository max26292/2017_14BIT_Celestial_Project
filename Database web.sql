USE WEB_PM
CREATE TABLE web_user (
  id int NOT NULL  identity(1,1) ,
  name varchar(50)  NOT NULL,
  email varchar(50)  NOT NULL,
  phone varchar(15)  NOT NULL,
  address varchar(128)  NOT NULL,
  password varchar(40) NOT NULL,
  created int NOT NULL,
  PRIMARY KEY (id)
)  ;
GO

CREATE TABLE catalog(
  id int NOT NULL identity(1,1),
  name varchar(128)   NOT NULL,
  sort_order tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
);

CREATE TABLE product (
  id int NOT NULL identity(1,1),
  catalog_id int NOT NULL,
  name varchar(100)  NOT NULL,
  price decimal(15,4) NOT NULL DEFAULT '0.0000',
  content text  NOT NULL,
  discount int NOT NULL,
  image_link varchar(50)  NOT NULL,
  image_list text  NOT NULL,
  created int NOT NULL DEFAULT '0',
  viewed int NOT NULL DEFAULT '0',
  rating int default '0',
  PRIMARY KEY (id),
)  ;

CREATE TABLE transactions (
  id bigint NOT NULL identity(1,1),
  status tinyint NOT NULL DEFAULT '0',
  user_id int NOT NULL DEFAULT '0',
  user_name varchar(50)  NOT NULL,
  user_email varchar(50)  NOT NULL,
  user_phone varchar(20)  NOT NULL,
  amount decimal(15,4) NOT NULL DEFAULT '0.0000',
  payment varchar(32)  NOT NULL,
  payment_info text  NOT NULL,
  message varchar(255)  NOT NULL,
  security varchar(16)  NOT NULL,
  created int NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
)  ;

CREATE TABLE orders (
  transaction_id int NOT NULL,
  id int NOT NULL identity(1,1),
  product_id int NOT NULL,
  qty int NOT NULL DEFAULT '0',
  amount decimal(15,4) NOT NULL DEFAULT '0.0000',
  data text  NOT NULL,
  status tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
)  ;