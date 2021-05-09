CREATE TABLE IF NOT EXISTS "users" (
  "id" SERIAL PRIMARY KEY,
  "username" TEXT,
  "password" TEXT,
  "salt" TEXT
);

CREATE TABLE IF NOT EXISTS "canvasses" (
  "id" SERIAL PRIMARY KEY,
  "title" TEXT,
  "owner_id" INTEGER
);

CREATE TABLE IF NOT EXISTS "notes" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "owner_id" INTEGER,
  "body" TEXT
);

CREATE TABLE IF NOT EXISTS "placements" (
  "id" SERIAL PRIMARY KEY,
  "notes_id" INTEGER NOT NULL,
  "canvas_id" INTEGER NOT NULL,
  "coordinates" POINT
);

ALTER TABLE "canvasses" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "notes" ADD FOREIGN KEY ("owner_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "placements" ADD FOREIGN KEY ("notes_id") REFERENCES "notes" ("id") ON DELETE CASCADE;

ALTER TABLE "placements" ADD FOREIGN KEY ("canvas_id") REFERENCES "canvasses" ("id") ON DELETE CASCADE;
