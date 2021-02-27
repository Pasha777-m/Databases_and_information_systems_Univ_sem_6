CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "nick" TEXT,
  "password" TEXT,
  "salt" TEXT
);

CREATE TABLE "canvasses" (
  "id" INTEGER PRIMARY KEY,
  "title" TEXT,
  "owner_id" INTEGER
);

CREATE TABLE "notes" (
  "id" INTEGER PRIMARY KEY,
  "title" varchar,
  "canvas_id" INTEGER NOT NULL,
  "owner_id" INTEGER,
  "coordinate_x" INTEGER,
  "coordinate_y" INTEGER,
  "body" TEXT
);

ALTER TABLE "canvasses" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "notes" ADD FOREIGN KEY ("canvas_id") REFERENCES "canvasses" ("id");

ALTER TABLE "notes" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");
