use dataviva_raw;

-- Filtro e seleção da tabela Aluno

create table IES_2014_ALUNO_STEP1 
select CO_IES, CO_CATEGORIA_ADMINISTRATIVA, CO_ORGANIZACAO_ACADEMICA, CO_CURSO, 
CO_ALUNO, CO_GRAU_ACADEMICO, CO_MODALIDADE_ENSINO, IN_CONCLUINTE, IN_INGRESSO_TOTAL as IN_INGRESSO, 
DT_INGRESSO_CURSO, IN_SEXO_ALUNO, NU_IDADE_ALUNO, CO_COR_RACA_ALUNO, CO_UF_NASCIMENTO,
CO_MUNICIPIO_NASCIMENTO, CO_TURNO_ALUNO
from IES_2014_ALUNO
where IN_MATRICULA=1 and CO_NIVEL_ACADEMICO=1;

-- Seleção da tabela Curso
create table IES_2014_CURSO_STEP1 
select CO_MUNICIPIO_CURSO as CO_MUNICIPIO, CO_CURSO, CO_OCDE, CO_LOCAL_OFERTA as CO_LOCAL_OFERTA_IES
from IES_2014_CURSO;

-- Criando a tabela STEP2:
create table IES_2014_ALUNO_STEP2 select * from IES_2014_ALUNO_STEP1;

alter table IES_2014_ALUNO_STEP2 add (CO_MUNICIPIO varchar(8), CO_OCDE varchar(20), CO_LOCAL_OFERTA_IES varchar(30));

update IES_2014_ALUNO_STEP2 left join IES_2014_CURSO_STEP1 
on IES_2014_ALUNO_STEP2.CO_CURSO = IES_2014_CURSO_STEP1.CO_CURSO
set IES_2014_ALUNO_STEP2.CO_MUNICIPIO = IES_2014_CURSO_STEP1.CO_MUNICIPIO;

update IES_2014_ALUNO_STEP2 left join IES_2014_CURSO_STEP1 
on IES_2014_ALUNO_STEP2.CO_CURSO = IES_2014_CURSO_STEP1.CO_CURSO
set IES_2014_ALUNO_STEP2.CO_OCDE = IES_2014_CURSO_STEP1.CO_OCDE;

update IES_2014_ALUNO_STEP2 left join IES_2014_CURSO_STEP1 
on IES_2014_ALUNO_STEP2.CO_CURSO = IES_2014_CURSO_STEP1.CO_CURSO
set IES_2014_ALUNO_STEP2.CO_LOCAL_OFERTA_IES = IES_2014_CURSO_STEP1.CO_LOCAL_OFERTA_IES;

