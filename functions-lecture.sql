CREATE OR REPLACE FUNCTION adder(num1 INTEGER, num2 INTEGER) RETURNS INTEGER
-- procedural language postgres sql = plpgsql
LANGUAGE plpgsql AS $$
	BEGIN
		RETURN num1 + num2;
	END
$$;

SELECT adder(10, 11);
SELECT adder(100, 5);

--SELECT Functions
CREATE OR REPLACE FUNCTION square_num(num INTEGER) RETURNS INTEGER
LANGUAGE plpgsql AS $$
	BEGIN
		RETURN num^2;
	END
$$;

SELECT square_num(2);
SELECT square_num(5);

CREATE OR REPLACE FUNCTION addLateFee(
	customer_id INTEGER,
	staff_id INTEGER,
	rental_id INTEGER,
	fee NUMERIC(4,2)
	) RETURNS INTEGER AS $$
	BEGIN
		INSERT INTO payment(
		customer_id,
		staff_id,
		rental_id,
		amount,
		payment_date
		) VALUES (
			customer_id,
			staff_id,
			rental_id,
			fee,
			NOW()
		);
		RETURN customer_id;
	END
$$ LANGUAGE plpgsql;

SELECT * FROM rental
WHERE return_date IS NULL;

SELECT addLateFee(22, 1, 12222, 3);

SELECT * FROM payment WHERE customer_id = 22;

SELECT addLateFee(155, 1, 11496, 3.99);

SELECT * FROM payment WHERE customer_id = 155;

CREATE OR REPLACE PROCEDURE updateReturnDate(
	_rental_id INTEGER, 
	_customer_id INTEGER
) LANGUAGE plpgsql AS $$
	BEGIN
		UPDATE rental
		SET return_date = NOW()
		WHERE rental_id = _rental_id AND customer_id = _customer_id;
		COMMIT;
	END
$$;

SELECT * FROM rental WHERE rental_id = 12222;

--CALL Procedure
CALL updateReturnDate(12222, 22);

SELECT * FROM rental WHERE rental_id = 11496;

CALL updateReturnDate(11496, 155);

SELECT * FROM customer;

CREATE OR REPLACE PROCEDURE updateCustomerEmail(
	_customer_id INTEGER,
	_email VARCHAR
) LANGUAGE plpgsql AS $$
	BEGIN
		UPDATE customer
		SET email = _email
		WHERE customer_id = _customer_id;
		COMMIT;
	END
$$;

CALL updateCustomerEmail(1, 'marysmith@gmail.com');

--create procedure to make a new store
SELECT * FROM store;
SELECT * FROM staff;
SELECT * FROM address;

INSERT INTO staff (staff_id, first_name, last_name, address_id, store_id, active, username)
values(3, 'Dylan', 'Currie', 5, 2, TRUE, 'Dylan');

CREATE OR REPLACE PROCEDURE createNewStore(_store_id INTEGER, _manager_staff_id INTEGER, _address_id INTEGER)
LANGUAGE plpgsql AS $$
	BEGIN
		INSERT INTO store (store_id, manager_staff_id, address_id)
		VALUES (_store_id, _manager_staff_id, _address_id);
	END
$$;

CALL createNewStore(3, 3, 6);

CREATE OR REPLACE PROCEDURE addActor(_first_name VARCHAR, _last_name VARCHAR)
LANGUAGE plpgsql AS $$
	BEGIN
		INSERT INTO actor(first_name, last_name)
		VALUES(_first_name, _last_name);
	END
$$;

CALL addActor('Sean', 'Currie');

SELECT * FROM actor WHERE last_name = 'Currie';

CALL addActor('Tom', 'Hardy');

SELECT * FROM actor WHERE last_name = 'Hardy';