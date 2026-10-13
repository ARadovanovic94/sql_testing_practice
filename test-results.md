# SQL Test Results - Sakila

I executed ten SQL checks manually in MySQL Workbench using the Sakila sample database. For each check, I recorded the objective, expected result, actual result, and status.

I marked a check as PASS when its actual result matched the expected result. This is a personal SQL practice and data validation project.

The matching queries are in [queries.sql](queries.sql), labeled SQL-001 through SQL-010.

## Execution summary

| Test ID | Check | Actual result | Status |
|---|---|---|---|
| SQL-001 | `SELECT` and `WHERE` | 4 actors named PENELOPE, including ID 1 | PASS |
| SQL-002 | `AND` | 1 row: ID 120, PENELOPE MONROE | PASS |
| SQL-003 | `ORDER BY` and `LIMIT` | 5 rows sorted by surname ascending | PASS |
| SQL-004 | `COUNT(*)` with a filter | Count value = 4 | PASS |
| SQL-005 | `OR` | 7 rows: 4 PENELOPE and 3 NICK | PASS |
| SQL-006 | `LIKE 'S%'` | 9 actors whose surnames start with S | PASS |
| SQL-007 | `INNER JOIN` | 19 actor-film rows for actor ID 1 | PASS |
| SQL-008 | `GROUP BY` | PENELOPE = 4; NICK = 3 | PASS |
| SQL-009 | `IS NULL` | 0 rows | PASS |
| SQL-010 | `HAVING COUNT(*) > 1` | 0 rows | PASS |

**Total: 10 executed checks | 10 PASS | 0 FAIL**

## SQL-001 - Filter actors by first name

**Objective:** Use `SELECT` and `WHERE` to find actors named PENELOPE.

**Expected result:** Return actors whose `first_name` matches PENELOPE, including `actor_id = 1`, PENELOPE GUINESS.

**Actual result:** 4 rows:

| actor_id | first_name | last_name |
|---:|---|---|
| 1 | PENELOPE | GUINESS |
| 54 | PENELOPE | PINKETT |
| 104 | PENELOPE | CRONYN |
| 120 | PENELOPE | MONROE |

**Status:** PASS

## SQL-002 - Combine filters with AND

**Objective:** Find the actor matching both the given first name and surname.

**Expected result:** 1 row with `actor_id = 120`, `first_name = PENELOPE`, and `last_name = MONROE`.

**Actual result:** 1 row:

| actor_id | first_name | last_name |
|---:|---|---|
| 120 | PENELOPE | MONROE |

**Status:** PASS

## SQL-003 - Sort and limit results

**Objective:** Return the first five actors after sorting by `last_name` in ascending order.

**Expected result:** 5 rows sorted by surname ascending, using `ORDER BY last_name ASC LIMIT 5`.

**Actual result:** 5 rows:

| actor_id | first_name | last_name |
|---:|---|---|
| 182 | DEBBIE | AKROYD |
| 58 | CHRISTIAN | AKROYD |
| 92 | KIRSTEN | AKROYD |
| 145 | KIM | ALLEN |
| 118 | CUBA | ALLEN |

**Status:** PASS

**Note:** I repeated this query to save all five result rows. The surnames are in ascending order: three AKROYD rows followed by two ALLEN rows. I sorted only by `last_name`, so rows with equal surnames have no specified order relative to one another.

## SQL-004 - Count matching actors

**Objective:** Count actors named PENELOPE.

**Expected result:** A single aggregate result containing the count value `4`, based on the four matching actors observed in SQL-001.

**Actual result:** 1 aggregate row with the count value `4`:

| COUNT(*) |
|---:|
| 4 |

**Status:** PASS

**Note:** I ran this check with the name in lowercase and got a count of `4`. I use `PENELOPE` in uppercase in the SQL file for a consistent style. The count above comes from my lowercase search. String matching depends on collation.

## SQL-005 - Combine filters with OR

**Objective:** Find actors named PENELOPE or NICK.

**Expected result:** Return only actors whose first name matches either PENELOPE or NICK.

**Actual result:** 7 rows: 4 actors named PENELOPE and 3 named NICK:

| actor_id | first_name | last_name |
|---:|---|---|
| 1 | PENELOPE | GUINESS |
| 2 | NICK | WAHLBERG |
| 44 | NICK | STALLONE |
| 54 | PENELOPE | PINKETT |
| 104 | PENELOPE | CRONYN |
| 120 | PENELOPE | MONROE |
| 166 | NICK | DEGENERES |

**Status:** PASS

**Note:** I checked the returned names and counts. Row order was outside the scope of this check.

## SQL-006 - Match a surname prefix with LIKE

**Objective:** Find actors whose surnames start with S.

**Expected result:** Return actors whose `last_name` matches `S%`. All returned surnames should start with S in the sample data.

**Actual result:** 9 rows. All nine surnames start with S:

| actor_id | first_name | last_name |
|---:|---|---|
| 180 | JEFF | SILVERSTONE |
| 195 | JAYNE | SILVERSTONE |
| 78 | GROUCHO | SINATRA |
| 31 | SISSY | SOBIESKI |
| 44 | NICK | STALLONE |
| 24 | CAMERON | STREEP |
| 116 | DAN | STREEP |
| 192 | JOHN | SUVARI |
| 9 | JOE | SWANK |

**Status:** PASS

**Note:** I checked the surname prefix. Row order was outside the scope of this check.

## SQL-007 - Join actor and film_actor

**Objective:** Join the two tables on `actor_id` and inspect film associations for actor ID 1.

**Expected result:** Every returned row contains `actor_id = 1`, PENELOPE GUINESS, and a `film_id` from the matching `film_actor` record.

**Actual result:** 19 rows:

| actor_id | first_name | last_name | film_id |
|---:|---|---|---:|
| 1 | PENELOPE | GUINESS | 1 |
| 1 | PENELOPE | GUINESS | 23 |
| 1 | PENELOPE | GUINESS | 25 |
| 1 | PENELOPE | GUINESS | 106 |
| 1 | PENELOPE | GUINESS | 140 |
| 1 | PENELOPE | GUINESS | 166 |
| 1 | PENELOPE | GUINESS | 277 |
| 1 | PENELOPE | GUINESS | 361 |
| 1 | PENELOPE | GUINESS | 438 |
| 1 | PENELOPE | GUINESS | 499 |
| 1 | PENELOPE | GUINESS | 506 |
| 1 | PENELOPE | GUINESS | 509 |
| 1 | PENELOPE | GUINESS | 605 |
| 1 | PENELOPE | GUINESS | 635 |
| 1 | PENELOPE | GUINESS | 749 |
| 1 | PENELOPE | GUINESS | 832 |
| 1 | PENELOPE | GUINESS | 939 |
| 1 | PENELOPE | GUINESS | 970 |
| 1 | PENELOPE | GUINESS | 980 |

**Status:** PASS

**Note:** I checked that every row contained actor ID 1, PENELOPE GUINESS, and a matching film ID. The 19 rows are the actual result; I did not set an expected row count for this check. Film titles and database-wide relationship integrity were outside its scope.

## SQL-008 - Group and count actors by first name

**Objective:** Group the PENELOPE and NICK records by first name and count each group.

**Expected result:** Two groups with PENELOPE = 4 and NICK = 3, based on SQL-005, totaling 7 actors.

**Actual result:** 2 groups: PENELOPE = 4 and NICK = 3, totaling 7 actors:

| first_name | actor_count |
|---|---:|
| PENELOPE | 4 |
| NICK | 3 |

**Status:** PASS

**Note:** I checked the two group counts. Group order was outside the scope of this check.

## SQL-009 - Find NULL phone values

**Objective:** Search `sakila.address` for rows where `phone IS NULL`.

**Expected result:** Return only addresses with a `NULL` phone value, if any exist. An empty result is acceptable.

**Actual result:** 0 data rows. The result showed only the column headings: `address_id`, `address`, and `phone`.

**Status:** PASS

**Note:** I found no `NULL` phone values. I checked only for `NULL`; empty strings and phone formats require separate checks.

## SQL-010 - Find repeated actor IDs

**Objective:** Group actor records by `actor_id` and return groups with more than one record.

**Expected result:** 0 rows; no `actor_id` should be repeated.

**Actual result:** 0 data rows. No repeated `actor_id` was found. The query's result columns are `actor_id` and `duplicate_count`.

**Status:** PASS

**Note:** I checked the existing records in `sakila.actor` for repeated IDs. Duplicate insertion and uniqueness outside this table were outside the scope of this check.
