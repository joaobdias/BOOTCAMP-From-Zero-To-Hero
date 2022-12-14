create database bd_zero_to_hero;
use bd_zero_to_hero;

# ---------- CRIANDO TABELAS ----------
CREATE TABLE tb_users (
	id int not null primary key, 
    user_name varchar (255),
    user_email varchar (127)
);

CREATE TABLE tb_posts (
	id int not null primary key,
    user_id int not null, 
	comment_id int not null
);

CREATE TABLE tb_comments (
	id int not null primary key, 
    user_id int not null,
    comment varchar (255)
);

# ---------- RELACIONANDO TABELAS ----------
ALTER TABLE tb_posts
add constraint fk_user_id foreign key (user_id)
references tb_users (id);

ALTER TABLE tb_posts
add constraint fk_comment_id foreign key (comment_id)
references tb_comments (id);

# ---------- INSERINDO NAS TABELAS ----------
INSERT INTO tb_users (id, user_name, user_email) VALUES (1, 'João', 'joao@gmail.com');
INSERT INTO tb_users (id, user_name, user_email) VALUES (2, 'Maria', 'maria@gmail.com');
INSERT INTO tb_users (id, user_name, user_email) VALUES (3, 'José', 'jose@gmail.com');

INSERT INTO tb_comments (id, user_id, comment) VALUES (1, 3, 'Parabéns Maria!');
INSERT INTO tb_comments (id, user_id, comment) VALUES (2, 2, 'Obrigado Jorge!');
INSERT INTO tb_comments (id, user_id, comment) VALUES (3, 1, 'Vocês são incríveis!');

INSERT INTO tb_posts (id, user_id, comment_id) VALUES (1, 2, 1);
INSERT INTO tb_posts (id, user_id, comment_id) VALUES (2, 1, 3);
INSERT INTO tb_posts (id, user_id, comment_id) VALUES (3, 3, 2);

# ---------- REQUISIÇÕES NAS TABELAS ----------
SELECT * FROM tb_posts;
SELECT * FROM tb_users;
SELECT * FROM tb_comments;

SELECT * FROM tb_comments WHERE user_id = 1;
SELECT user_name FROM tb_users WHERE id = 2
SELECT comment FROM tb_comments WHERE user_id = 3;