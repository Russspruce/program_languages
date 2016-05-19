CREATE TABLE languages (id serial primary key, name varchar, description varchar, date varchar, most_recent_release_date varchar, webpage varchar);

COPY languages FROM '/Users/Guest/Desktop/fixdb.csv' DELIMITERS ',' CSV;
