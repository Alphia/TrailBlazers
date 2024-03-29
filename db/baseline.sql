CREATE TABLE item
(
       item_id SERIAL PRIMARY KEY,
       description character varying(255) NOT NULL,
       name character varying(255) NOT NULL,
       price numeric(19,2) NOT NULL,
       type character varying(255) NOT NULL,
       quantity bigint NOT NULL
 );

CREATE TABLE item_type
(
       item_type_id SERIAL PRIMARY KEY,
       name character varying(64) NOT NULL
);


CREATE TABLE account
(
      account_id SERIAL PRIMARY KEY,
      account_name character varying(255) NOT NULL,
      email_address character varying(255) NOT NULL UNIQUE,
      password character varying(255) NOT NULL,
      phone_number character varying(32) NOT NULL,
      country character varying(20) NOT NULL,
      enabled boolean NOT NULL
);

CREATE TABLE account_role
(
        role_id SERIAL PRIMARY KEY,
        account_name character varying(255) NOT NULL,
        role character varying(255) NOT NULL
);

CREATE TABLE reserve_order
(
        order_id SERIAL PRIMARY KEY,
        account_id bigint NOT NULL,
        item_id bigint NOT NULL,
	status character varying(255) NOT NULL,
	note character varying(255) NOT NULL,
        reservation_timestamp timestamp without time zone NOT NULL
);

CREATE TABLE survey_entry
(
        survey_entry_id SERIAL PRIMARY KEY,
        account_id bigint NOT NULL,
        rating int NOT NULL,
        comment character varying(255)
);

insert into account (email_address, account_name, password, phone_number,country, enabled)
       values ('admin@freewheelers.com', 'AdminCat','admin', '','UK', true);
insert into account (email_address, account_name, password, phone_number,country, enabled)
       values ('user@freewheelers.com', 'UserCat','user', '','US', true);

insert into account_role (account_name, role) values ('AdminCat', 'ROLE_ADMIN');
insert into account_role (account_name, role) values ('UserCat', 'ROLE_USER');

insert into item_type (name) values ('Frames');
insert into item_type (name) values ('Accessories');
