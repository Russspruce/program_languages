CREATE TABLE languages (id serial primary key, name varchar, description varchar, date varchar, most_recent_release_date varchar, website varchar);

COPY languages FROM '/Users/Guest/Desktop/pl.csv' DELIMITERS ',' CSV;
