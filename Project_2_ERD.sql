CREATE TABLE "Employee" (
  "employee_id" integer PRIMARY KEY,
  "Name" string,
  "orders" integer,
  "is_manager" boolean
);

CREATE TABLE "Customer" (
  "customer_id" integer PRIMARY KEY,
  "name" string,
  "orders" integer
);

CREATE TABLE "Orders" (
  "order_number" integer PRIMARY KEY,
  "customer" int,
  "total_price" double,
  "order_time" datetime,
  "contents" int
);

CREATE TABLE "Inventory" (
  "id" integer PRIMARY KEY,
  "quantity_remaining" integer,
  "quantity_target" integer
);

CREATE TABLE "Menu_Items" (
  "id" integer PRIMARY KEY,
  "price" double,
  "description" string,
  "category" string,
  "times_ordered" int
);

CREATE TABLE "Food_to_inventory" (
  "food_item_ID" int,
  "inventory_id" int
);

CREATE TABLE "order_breakout" (
  "orderID" int,
  "foodItems" int
);

ALTER TABLE "Food_to_inventory" ADD FOREIGN KEY ("food_item_ID") REFERENCES "Menu_Items" ("id");

CREATE TABLE "Food_to_inventory_Inventory" (
  "Food_to_inventory_inventory_id" int,
  "Inventory_id" integer,
  PRIMARY KEY ("Food_to_inventory_inventory_id", "Inventory_id")
);

ALTER TABLE "Food_to_inventory_Inventory" ADD FOREIGN KEY ("Food_to_inventory_inventory_id") REFERENCES "Food_to_inventory" ("inventory_id");

ALTER TABLE "Food_to_inventory_Inventory" ADD FOREIGN KEY ("Inventory_id") REFERENCES "Inventory" ("id");


CREATE TABLE "Orders_order_breakout" (
  "Orders_order_number" integer,
  "order_breakout_orderID" int,
  PRIMARY KEY ("Orders_order_number", "order_breakout_orderID")
);

ALTER TABLE "Orders_order_breakout" ADD FOREIGN KEY ("Orders_order_number") REFERENCES "Orders" ("order_number");

ALTER TABLE "Orders_order_breakout" ADD FOREIGN KEY ("order_breakout_orderID") REFERENCES "order_breakout" ("orderID");


CREATE TABLE "order_breakout_Menu_Items" (
  "order_breakout_foodItems" int,
  "Menu_Items_id" integer,
  PRIMARY KEY ("order_breakout_foodItems", "Menu_Items_id")
);

ALTER TABLE "order_breakout_Menu_Items" ADD FOREIGN KEY ("order_breakout_foodItems") REFERENCES "order_breakout" ("foodItems");

ALTER TABLE "order_breakout_Menu_Items" ADD FOREIGN KEY ("Menu_Items_id") REFERENCES "Menu_Items" ("id");


ALTER TABLE "Orders" ADD FOREIGN KEY ("order_number") REFERENCES "Customer" ("orders");

ALTER TABLE "Orders" ADD FOREIGN KEY ("order_number") REFERENCES "Employee" ("orders");
