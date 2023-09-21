--Homework using DVD rental

--Create a Function
--Making a Function that will add a film
SELECT * FROM film;
CREATE OR REPLACE FUNCTION addFilm(_title VARCHAR, _language_id INTEGER, _rental_duration INTEGER, _rental_rate NUMERIC(4, 2), _replacement_cost NUMERIC(4, 2)) RETURNS VARCHAR
LANGUAGE plpgsql AS $$
	BEGIN
		INSERT INTO film (title, language_id, rental_duration, rental_rate, replacement_cost)
		VALUES (_title, _language_id, _rental_duration, _rental_rate, _replacement_cost);
		RETURN _title;
	END
$$;

SELECT addFilm('The Last Samurai', 1, 7, 3.99, 20.99);

SELECT * FROM film WHERE title = 'The Last Samurai';

--Create a Procedure
--Making a Procedure that will update the missing data and rating (it populated to G) in for a recently added film
CREATE OR REPLACE PROCEDURE updateNewFilm(_film_id INTEGER, _description VARCHAR, _release_year INTEGER, _length INTEGER, _rating MPAA_RATING)
LANGUAGE plpgsql AS $$
	BEGIN
		UPDATE film
		SET description = _description, release_year = _release_year, length = _length, rating = _rating
		WHERE film_id = _film_id;
		COMMIT;
	END
$$;

CALL updateNewFilm(1004, 
'Set in Japan during the 1870s, The Last Samurai tells the story of Capt. Nathan Algren (Tom Cruise), an American military officer hired by the Emperor of Japan to train the country''s first army in the art of modern warfare.',
2003, 154, 'R');