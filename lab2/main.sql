CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" TEXT,
  "password" TEXT,
  "salt" TEXT
);

CREATE TABLE "canvasses" (
  "id" SERIAL PRIMARY KEY,
  "title" TEXT,
  "owner_id" INTEGER
);

CREATE TABLE "notes" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "owner_id" INTEGER,
  "body" TEXT
);

CREATE TABLE "placement" (
  "id" SERIAL PRIMARY KEY,
  "notes_id" INTEGER NOT NULL,
  "canvas_id" INTEGER NOT NULL,
  "coordinates" POINT,
);

ALTER TABLE "canvasses" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "notes" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id");

ALTER TABLE "placement" ADD FOREIGN KEY ("notes_id") REFERENCES "notes" ("id");

ALTER TABLE "placement" ADD FOREIGN KEY ("canvas_id") REFERENCES "canvasses" ("id");
