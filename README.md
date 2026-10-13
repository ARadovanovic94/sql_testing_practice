# SQL Testing Practice - Sakila

I completed ten SQL checks on the Sakila sample database using MySQL Workbench. For each check, I compared the actual result with the expected result and recorded a PASS or FAIL status.

This is a personal SQL practice and basic data validation project.

## Results

| Executed checks | PASS | FAIL |
|---:|---:|---:|
| 10 | 10 | 0 |

All ten checks passed against the expected results. I documented the returned rows, counts, and empty results in [test-results.md](test-results.md).

## Tools and scope

- Database: MySQL with the Sakila sample database.
- Client: MySQL Workbench.
- Tables used: `actor`, `film_actor`, and `address`.
- Method: manual execution and inspection of query results.

I practiced selecting columns, filtering with `WHERE`, combining conditions with `AND` and `OR`, sorting and limiting results, counting and grouping records, matching a surname prefix, joining two tables, checking for `NULL`, and finding repeated IDs with `HAVING`.

I used SQL to inspect records, compare counts, examine actor-film relationships, and check for specific data issues. I worked directly with sample data in the database. This project covers SQL practice and data validation; application UI, API, and complete user workflows are outside its scope.

## Repository structure

```text
sql_testing_practice/
├── README.md
├── queries.sql
└── test-results.md
```

- [SQL queries](queries.sql): ten queries, labeled SQL-001 through SQL-010, with short comments.
- [Test results](test-results.md): objectives, expected results, actual results, and statuses for each check.

## Run the queries

1. Have a MySQL server with the Sakila sample database installed. If needed, follow the [official Sakila installation guide](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).
2. Open MySQL Workbench and connect to that server.
3. Open `queries.sql` in an SQL editor tab.
4. Select and execute one complete SQL statement at a time, from SQL-001 through SQL-010.
5. Compare each result with the matching entry in `test-results.md`. For SQL-004, compare the count value rather than the number of result rows.
6. Record the results of any new execution separately.

Each query uses the `sakila` schema explicitly. All statements are read-only `SELECT` queries. I checked the results manually. The Sakila schema and data files are not bundled here.
