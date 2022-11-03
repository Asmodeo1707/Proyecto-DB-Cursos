CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "gender" varchar NOT NULL,
  "birthday" date NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "categories_id" uuid,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "editorial" varchar NOT NULL,
  "cost" money NOT NULL DEFAULT '450',
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL
);

CREATE TABLE "course_Video" (
  "id" uuid PRIMARY KEY,
  "courses_id" uuid,
  "title" varchar NOT NULL,
  "date_edition" varchar NOT NULL,
  "author" text DEFAULT 'anonimo',
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "name" varchar NOT NULL,
  "section" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "name" varchar NOT NULL,
  "status" bool DEFAULT false
);

ALTER TABLE "roles" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "course_Video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

insert into users (
 id,
 first_name,
 last_name,
 email,
 password,
 age,
 gender,
 birthday
) 

values (
'18f09c9d-bab5-48bd-b63c-e74a276af889',
'Juan',
'Perez Lopez',
'Juanplopez@gmail.com',
'12345',
34,
'Masculino',
'1988-10-23'
), 
(
'c278504a-1c79-4965-aec7-f4964b0f2d34',
'Ana Maria',
'Rogrigez Lopez',
'Ana_Lopez12@gmail.com',
'maria',
55,
'Femenino',
'2002-12-05'
);

insert into roles (
id,
users_id,
name,
status
) 
values (
'9e7d4b98-6b4a-42a4-a96f-db0d261260f4',
'18f09c9d-bab5-48bd-b63c-e74a276af889',
'student',
true
), 
(
'83f0b326-1a2a-4ed8-99f4-4065602b6420'
'69145904-fd6a-44e8-8d7c-ae58121dd84f',
'student',
true
);

insert into categories (
id,
users_id,
name,
section
) 
values (
'5b0fd24b-b919-4745-a96a-73be5579c5cc',
'18f09c9d-bab5-48bd-b63c-e74a276af889',
'engineer',
'Systems'
), 
(
'04b3ca6a-9aa4-45c8-9283-ad2cf0b5cda6',
'69145904-fd6a-44e8-8d7c-ae58121dd84f',
'psychology',
'business'
);

insert into courses (
id,
categories_id,
title,
description,
editorial,
cost,
level,
teacher
) 
values (
'0efe9f36-5769-49ed-8153-dffdf4c58fb1',
'5b0fd24b-b919-4745-a96a-73be5579c5cc',
'Analisis y diseño de sistemas',
'La unidad de aprendizaje contribuye al perfil de egreso de la Ingeniería en Sistemas Computacionales desarrollando
habilidades de análisis y diseño de un sistema de cómputo, con énfasis en las decisiones que en ambas etapas
deben tomarse y que inciden directamente en la construcción de un sistema de cómputo que debe cumplir con las
expectativas de los interesados. Asimismo, desarrolla habilidades transversales como capacidad de organización
y planificación, trabajo en equipo, comunicación efectiva y empatía.',
500,
'Intermedio',
'Juan Carlos Gallardo Manrique'

), (
'c29435eb-4ca8-45fa-b50a-f70b824f8008',
'04b3ca6a-9aa4-45c8-9283-ad2cf0b5cda6',
'ingenieria de metodos I',
'se basa en el registro y examen crítico sistemático de la metodología existente',
'ecoe ediciones',
600,
'principiante',
'Alfredo Perez Salazar'

), 
(
'212a7731-2bc9-4a4f-9a45-18848cc9269a',
'713cee9d-4cb7-48a2-a269-4f52b5bdb61c',
'psicologia organizacional',
'estudia el comportamiento humano en el lugar de trabajo',
'Manual Moderno',
450,
'medio',
'Felipe Munoz Alvarado'
), 
(
'77b5d8d6-6a8b-4816-a761-0a7c56a136f5',
'713cee9d-4cb7-48a2-a269-4f52b5bdb61c',
'psicoterapeuta',
'proceso que ayuda a comprender y cambiar nuestra manera de pensar, percibir y hacer las cosas',
'Piramide',
550,
'avanzado',
'Maria Fernanda Palacios Torres'
);

insert into "course_Video" (
id,
courses_id,
title,
date_edition,
author,
url
) 
values (
'7b944d08-e080-4cc9-ad41-8f2250284be0',
'0efe9f36-5769-49ed-8153-dffdf4c58fb1',
'CS50 2022 - Lecture 6 - Python',
'2022',
'David J. Malan',
'https://www.youtube.com/watch?v=5Jppcxc1Qzc&ab_channel=CS50'
), 
(
'1e2b697a-cfdc-4d4a-b602-da464bee8ec2',
'c29435eb-4ca8-45fa-b50a-f70b824f8008',
'Tus PRIMEROS PASOS con REACT - Desde CERO explicado PASO A PASO',
'2022',
'CodingTubenonimo',
'https://www.youtube.com/watch?v=cHKCQPDpCgQ&ab_channel=CodingTube'
), 
(
'a2916279-a64d-4f45-ac88-c45eb1067267',
'212a7731-2bc9-4a4f-9a45-18848cc9269a',
'Curso PRO Trow House - Clase 25 en Vivo',
'2022',
'Gov3dstudio',
'https://www.youtube.com/watch?v=RKt1qMmvIrU'
), 
(
'd1dd9cfb-9b0f-40ab-b43c-fe442c89e625',
'77b5d8d6-6a8b-4816-a761-0a7c56a136f5',
'Qué es un PSICOTERAPEUTA,👩‍⚕️ y en que consiste la PSICOTERAPIA',
'2020',
'anonimo',
'https://www.youtube.com/watch?v=2x1zMMT071Y'
);

insert into course_enrolled_percentage (
id,
id_courses,
attendance,
percentage
) values (
'dc47d58a-c6ab-4628-970e-4e705973c95f',
'80b301be-186a-4520-8b72-e5c5b80a4e82',
10,
30
) , (
'b241a213-faab-4d88-b27f-b5ff14b18a8e',
'c29435eb-4ca8-45fa-b50a-f70b824f8008',
12,
35
) , (
'976297b7-e8ea-4fee-ad9f-140663d8f9b6',
'54499241-1ab1-4b06-9903-52cf08f3e81d',
12,
35
) , (
'735fea32-b2bb-4bb7-8649-74d1ac385a09',
'77b5d8d6-6a8b-4816-a761-0a7c56a136f5',
15,
38
) ;

create view curse_in_process as select * from course_enrolled_percentage;

select * from courses ;
select * from "course_Video" ;

select * from courses left join "course_Video" on courses.id  = courses_id ;

select courses.id as courses_id_initial, courses.title, "course_Video".title  from courses left join "course_Video" on courses.id  = courses_id;