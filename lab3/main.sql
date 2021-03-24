--1. canvasses that users own
SELECT users.id,users.username,canvasses.id,canvasses.title FROM users LEFT JOIN canvasses ON users.id=canvasses.owner_id ORDER BY users.id;
--2. notes that users own
SELECT notes.id,notes.title,notes.body,users.id,users.username FROM notes INNER JOIN users ON users.id=notes.owner_id ORDER BY notes.id;
--3. notes that are in canvasses
SELECT canvasses.id AS canv_id,canvasses.title AS canv_id,notes.id AS note_id ,notes.title AS note_title FROM canvasses INNER JOIN placements ON canvasses.id=placements.canvas_id INNER JOIN notes ON placements.notes_id=notes.id ORDER BY canvasses.id;
--4. notes that users have in their canvases
SELECT 	
	users.id AS user_id,users.username,
	canvasses.id AS canv_id,
	notes.id AS note_id,
	notes.title 
FROM users 
INNER JOIN canvasses ON canvasses.owner_id=users.id 
INNER JOIN placements ON canvasses.id=placements.canvas_id 
INNER JOIN notes ON placements.notes_id=notes.id 
ORDER BY users.id;
--5. owner users of notes that users have in their canvasses
SELECT 	
	users.id AS user_id,users.username,
	canvasses.id AS canv_id,
	notes.id AS note_id,
	notes.title AS note_title,
	owners.id AS owner_id,
	owners.username AS owner_username
FROM users 
INNER JOIN canvasses ON canvasses.owner_id=users.id 
INNER JOIN placements ON canvasses.id=placements.canvas_id 
INNER JOIN notes ON placements.notes_id=notes.id 
INNER JOIN users owners ON owners.id=notes.owner_id 
ORDER BY users.id;
--6. placements that notes have
SELECT notes.id,notes.title,placements.coordinates FROM notes INNER JOIN placements ON notes.id=placements.notes_id  ORDER BY notes.id;
--7. placemets on canvasses of owner of notes
SELECT 
	notes.id AS note_id,
	users.username,
	canvasses.id AS canv_id,
	canvasses.title as canv_title,
	placements.coordinates 
FROM notes 
INNER JOIN users ON notes.owner_id=users.id  
INNER JOIN canvasses ON users.id=canvasses.owner_id  
INNER JOIN placements ON canvasses.id=placements.canvas_id  
ORDER BY notes.id;
--8. owners of notes placements
SELECT
	users.id AS user_id, 
	users.username, 
	notes.id AS note_id,
	placements.id AS placement_id 
FROM placements 
INNER JOIN notes ON notes.id=placements.notes_id 
INNER JOIN users ON users.id=notes.owner_id 
ORDER BY users.id;
--9. all users and their notes 
SELECT users.id AS user_id,users.username,notes.id AS note_id,notes.title AS note_title FROM users LEFT JOIN notes ON users.id=notes.owner_id ORDER BY users.id;
--10. notes that owner of canvas have
SELECT
	canvasses.id AS canv_id,
	users.id AS user_id, 
	users.username, 
	notes.id AS note_id,
	notes.title AS note_title
FROM canvasses 
INNER JOIN users ON users.id=canvasses.owner_id 
INNER JOIN notes ON users.id=notes.owner_id 
ORDER BY canvasses.id;
