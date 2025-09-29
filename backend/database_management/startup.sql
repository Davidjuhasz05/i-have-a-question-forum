DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS "user";

CREATE TABLE "user"(
                       id SERIAL PRIMARY KEY,
                       username text not null unique,
                       registration_date  TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
                       password varchar(100) not null,
                       score int not null
);

CREATE TABLE question(
                         id SERIAL PRIMARY KEY,
                         title text not null,
                         description text not null,
                         user_id integer REFERENCES "user"(id) ON DELETE SET NULL,
                         post_date TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

CREATE TABLE answer(
                       id SERIAL PRIMARY KEY,
                       title text not null,
                       message text not null,
                       user_id integer not null REFERENCES "user"(id),
                       post_date  TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
                       question_id integer REFERENCES question(id) ON DELETE CASCADE
);
