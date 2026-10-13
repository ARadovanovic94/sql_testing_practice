-- SQL Testing Practice - Sakila
-- MySQL Workbench queries for ten SQL practice and data validation checks.
-- All statements are read-only. Results are documented in test-results.md.

-- SQL-001 - Filter actors by first name
-- SELECT chooses columns; WHERE keeps rows that match the condition.
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'PENELOPE';

-- SQL-002 - Combine filters with AND
-- Both the first-name and last-name conditions must be satisfied.
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'PENELOPE'
  AND last_name = 'MONROE';

-- SQL-003 - Sort and limit results
-- Sort by surname in ascending order and return the first five rows.
-- Rows with equal surnames have no specified order relative to each other.
SELECT actor_id, first_name, last_name
FROM sakila.actor
ORDER BY last_name ASC
LIMIT 5;

-- SQL-004 - Count matching actors
-- COUNT(*) returns one count value, not a list of matching actors.
-- I searched using lowercase letters and got 4; the name is uppercase here for consistency.
-- String matching depends on collation.
SELECT COUNT(*)
FROM sakila.actor
WHERE first_name = 'PENELOPE';

-- SQL-005 - Combine filters with OR
-- A row is included when either first-name condition is satisfied.
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'PENELOPE'
   OR first_name = 'NICK';

-- SQL-006 - Match a surname prefix with LIKE
-- S% matches S followed by zero or more characters.
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE last_name LIKE 'S%';

-- SQL-007 - Join actor and film_actor
-- Match the tables on actor_id and show film IDs associated with actor 1.
SELECT
    actor.actor_id,
    actor.first_name,
    actor.last_name,
    film_actor.film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
    ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 1;

-- SQL-008 - Group and count actors by first name
-- Filter to the two names, then count records in each group.
SELECT first_name, COUNT(*) AS actor_count
FROM sakila.actor
WHERE first_name = 'PENELOPE'
   OR first_name = 'NICK'
GROUP BY first_name;

-- SQL-009 - Find NULL phone values
-- IS NULL checks missing/unknown values, not empty strings.
SELECT address_id, address, phone
FROM sakila.address
WHERE phone IS NULL;

-- SQL-010 - Find repeated actor IDs
-- GROUP BY forms groups; HAVING keeps only groups containing multiple rows.
SELECT actor_id, COUNT(*) AS duplicate_count
FROM sakila.actor
GROUP BY actor_id
HAVING COUNT(*) > 1;
