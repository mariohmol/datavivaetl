-- SELECT ALUNO 2012

use dataviva_raw;

-- Filtro e seleção da tabela Aluno

create table IES_2012_ALUNO_STEP1 
select CO_IES, CO_CATEGORIA_ADMINISTRATIVA, CO_ORGANIZACAO_ACADEMICA, CO_CURSO, 
CO_ALUNO, CO_GRAU_ACADEMICO, CO_MODALIDADE_ENSINO, IN_CONCLUINTE, IN_INGRESSO_TOTAL as IN_INGRESSO, 
DT_INGRESSO_CURSO, IN_SEXO_ALUNO, NU_IDADE_ALUNO, CO_COR_RACA_ALUNO, CO_UF_NASCIMENTO,
CO_MUNICIPIO_NASCIMENTO, CO_TURNO_ALUNO
from IES_2012_ALUNO
where IN_MATRICULA=1 and CO_NIVEL_ACADEMICO=1;

-- Seleção da tabela Curso
create table IES_2012_CURSO_STEP1 
select CO_MUNICIPIO_CURSO as CO_MUNICIPIO, CO_CURSO, CO_OCDE, CO_LOCAL_OFERTA as CO_LOCAL_OFERTA_IES
from IES_2012_CURSO;

-- Criando a tabela STEP2:
create table IES_2012_ALUNO_STEP2 select * from IES_2012_ALUNO_STEP1;

alter table IES_2012_ALUNO_STEP2 add (CO_MUNICIPIO varchar(8), CO_OCDE varchar(20), CO_LOCAL_OFERTA_IES varchar(30));

update IES_2012_ALUNO_STEP2 left join IES_2012_CURSO_STEP1 
on IES_2012_ALUNO_STEP2.CO_CURSO = IES_2012_CURSO_STEP1.CO_CURSO
set IES_2012_ALUNO_STEP2.CO_MUNICIPIO = IES_2012_CURSO_STEP1.CO_MUNICIPIO;

update IES_2012_ALUNO_STEP2 left join IES_2012_CURSO_STEP1 
on IES_2012_ALUNO_STEP2.CO_CURSO = IES_2012_CURSO_STEP1.CO_CURSO
set IES_2012_ALUNO_STEP2.CO_OCDE = IES_2012_CURSO_STEP1.CO_OCDE;

update IES_2012_ALUNO_STEP2 left join IES_2012_CURSO_STEP1 
on IES_2012_ALUNO_STEP2.CO_CURSO = IES_2012_CURSO_STEP1.CO_CURSO
set IES_2012_ALUNO_STEP2.CO_LOCAL_OFERTA_IES = IES_2012_CURSO_STEP1.CO_LOCAL_OFERTA_IES;

-- -------------------------------------------------------------------------


-- Recodificações - Banco ALUNO

# Categoria Administrativa
update IES_2012_ALUNO_STEP2 set CO_CATEGORIA_ADMINISTRATIVA = 
if(CO_CATEGORIA_ADMINISTRATIVA = '       7', '       6', CO_CATEGORIA_ADMINISTRATIVA);

# Grau Acadêmico
update IES_2012_ALUNO_STEP2 set CO_GRAU_ACADEMICO = 
if(CO_GRAU_ACADEMICO = '        ', '-1', CO_GRAU_ACADEMICO);


# Ano e mes de ingresso
alter table IES_2012_ALUNO_STEP2 add (ANO_INGRESSO varchar(4), MES_INGRESSO varchar(8)) ;

update IES_2012_ALUNO_STEP2 set MES_INGRESSO = 
if(substring(DT_INGRESSO_CURSO,2,1)='/' and substring(DT_INGRESSO_CURSO,4,1)='/',substring(DT_INGRESSO_CURSO,3,1), 
if(substring(DT_INGRESSO_CURSO,2,1)='/' and substring(DT_INGRESSO_CURSO,5,1)='/',substring(DT_INGRESSO_CURSO,3,2),
if(substring(DT_INGRESSO_CURSO,3,1)='/' and substring(DT_INGRESSO_CURSO,5,1)='/',substring(DT_INGRESSO_CURSO,4,1),
if(substring(DT_INGRESSO_CURSO,3,1)='/' and substring(DT_INGRESSO_CURSO,6,1)='/',substring(DT_INGRESSO_CURSO,4,2),0))));

update IES_2012_ALUNO_STEP2 set ANO_INGRESSO = 
if(substring(DT_INGRESSO_CURSO,2,1)='/' and substring(DT_INGRESSO_CURSO,4,1)='/',substring(DT_INGRESSO_CURSO,5,4), 
if(substring(DT_INGRESSO_CURSO,2,1)='/' and substring(DT_INGRESSO_CURSO,5,1)='/',substring(DT_INGRESSO_CURSO,6,4),
if(substring(DT_INGRESSO_CURSO,3,1)='/' and substring(DT_INGRESSO_CURSO,5,1)='/',substring(DT_INGRESSO_CURSO,6,4),
if(substring(DT_INGRESSO_CURSO,3,1)='/' and substring(DT_INGRESSO_CURSO,6,1)='/',substring(DT_INGRESSO_CURSO,7,4),0))));

-- Cor do Aluno
update IES_2012_ALUNO_STEP2 set CO_COR_RACA_ALUNO= if(CO_COR_RACA_ALUNO = '       0' or CO_COR_RACA_ALUNO = '       6', '-1', CO_COR_RACA_ALUNO);

-- UF nascimento
update IES_2012_ALUNO_STEP2 set CO_UF_NASCIMENTO = if(CO_UF_NASCIMENTO = '        ', '-1', CO_UF_NASCIMENTO);

-- Município nascimento
update IES_2012_ALUNO_STEP2 
set CO_MUNICIPIO_NASCIMENTO = if(CO_MUNICIPIO_NASCIMENTO = '        ', '-1', CO_MUNICIPIO_NASCIMENTO);

-- Turno do Aluno
update IES_2012_ALUNO_STEP2 set CO_TURNO_ALUNO = if(CO_TURNO_ALUNO = '        ', '-1', CO_TURNO_ALUNO);

-- Codigo do Municipio IES
update IES_2012_ALUNO_STEP2 set CO_MUNICIPIO = if(CO_MUNICIPIO = '        ', '-1', CO_MUNICIPIO);

-- Codigo OCDE
update IES_2012_ALUNO_STEP2 set CO_OCDE = if(CO_OCDE = '            ', '-1', CO_OCDE);

-- Codigo local de oferta
update IES_2012_ALUNO_STEP2 set CO_LOCAL_OFERTA_IES = if(CO_LOCAL_OFERTA_IES = '        ', '-1', CO_LOCAL_OFERTA_IES);

-- Organizacao Academica
update IES_2012_ALUNO_STEP2 set CO_ORGANIZACAO_ACADEMICA = if(CO_ORGANIZACAO_ACADEMICA = '       5', '       4', CO_ORGANIZACAO_ACADEMICA);

-- RETIRANDO OS ESPACOS

alter table IES_2012_ALUNO_STEP2 change CO_IES CO_IES int(8);
select distinct CO_IES from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_CATEGORIA_ADMINISTRATIVA CO_CATEGORIA_ADMINISTRATIVA int(8);
select distinct CO_CATEGORIA_ADMINISTRATIVA from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_ORGANIZACAO_ACADEMICA CO_ORGANIZACAO_ACADEMICA int(8);
select distinct CO_ORGANIZACAO_ACADEMICA from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_GRAU_ACADEMICO CO_GRAU_ACADEMICO int(8);
select distinct CO_GRAU_ACADEMICO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_MODALIDADE_ENSINO CO_MODALIDADE_ENSINO int(8);
select distinct CO_MODALIDADE_ENSINO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change IN_CONCLUINTE IN_CONCLUINTE int(8);
select distinct IN_CONCLUINTE from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change IN_INGRESSO IN_INGRESSO int(8);
select distinct IN_INGRESSO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change IN_SEXO_ALUNO IN_SEXO_ALUNO int(8);
select distinct IN_SEXO_ALUNO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change NU_IDADE_ALUNO NU_IDADE_ALUNO int(8);
select distinct NU_IDADE_ALUNO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_COR_RACA_ALUNO CO_COR_RACA_ALUNO int(8);
select distinct CO_COR_RACA_ALUNO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_UF_NASCIMENTO CO_UF_NASCIMENTO int(8);
select distinct CO_UF_NASCIMENTO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_MUNICIPIO_NASCIMENTO CO_MUNICIPIO_NASCIMENTO int(8);
select distinct CO_MUNICIPIO_NASCIMENTO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_TURNO_ALUNO CO_TURNO_ALUNO int(8);
select distinct CO_TURNO_ALUNO from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_MUNICIPIO CO_MUNICIPIO_IES int(8);
select distinct CO_MUNICIPIO_IES from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change CO_LOCAL_OFERTA_IES CO_LOCAL_OFERTA_IES int(8);
select distinct CO_LOCAL_OFERTA_IES from IES_2012_ALUNO_STEP2;

alter table IES_2012_ALUNO_STEP2 change MES_INGRESSO MES_INGRESSO int(8);
select distinct MES_INGRESSO from IES_2012_ALUNO_STEP2;

-- Criando a tabela final:
drop table if exists IES_2012_ALUNO_STEP3;
create table IES_2012_ALUNO_STEP3 select * from IES_2012_ALUNO_STEP2;


-- VERIFICAÇÕES

select CO_IES, count(*) from IES_2012_ALUNO_STEP3 group by CO_IES;
select CO_CATEGORIA_ADMINISTRATIVA, count(*) from IES_2012_ALUNO_STEP3 group by CO_CATEGORIA_ADMINISTRATIVA;
select CO_ORGANIZACAO_ACADEMICA, count(*) from IES_2012_ALUNO_STEP3 group by CO_ORGANIZACAO_ACADEMICA;
select CO_CURSO, count(*) from IES_2012_ALUNO_STEP3 group by CO_CURSO;
select CO_ALUNO, count(*) from IES_2012_ALUNO_STEP3 group by CO_ALUNO;
select CO_GRAU_ACADEMICO, count(*) from IES_2012_ALUNO_STEP3 group by CO_GRAU_ACADEMICO;
select CO_MODALIDADE_ENSINO, count(*) from IES_2012_ALUNO_STEP3 group by CO_MODALIDADE_ENSINO;
select IN_CONCLUINTE, count(*) from IES_2012_ALUNO_STEP3 group by IN_CONCLUINTE;
select IN_INGRESSO, count(*) from IES_2012_ALUNO_STEP3 group by IN_INGRESSO;
select IN_SEXO_ALUNO, count(*) from IES_2012_ALUNO_STEP3 group by IN_SEXO_ALUNO;
select NU_IDADE_ALUNO, count(*) from IES_2012_ALUNO_STEP3 group by NU_IDADE_ALUNO;
select CO_COR_RACA_ALUNO, count(*) from IES_2012_ALUNO_STEP3 group by CO_COR_RACA_ALUNO;
select CO_UF_NASCIMENTO, count(*) from IES_2012_ALUNO_STEP3 group by CO_UF_NASCIMENTO;
select CO_MUNICIPIO_NASCIMENTO, count(*) from IES_2012_ALUNO_STEP3 group by CO_MUNICIPIO_NASCIMENTO;
select CO_TURNO_ALUNO, count(*) from IES_2012_ALUNO_STEP3 group by CO_TURNO_ALUNO;
select CO_MUNICIPIO, count(*) from IES_2012_ALUNO_STEP3 group by CO_MUNICIPIO;
select CO_OCDE, count(*) from IES_2012_ALUNO_STEP3 group by CO_OCDE;
select CO_LOCAL_OFERTA_IES, count(*) from IES_2012_ALUNO_STEP3 group by CO_LOCAL_OFERTA_IES;
select ANO_INGRESSO, count(*) from IES_2012_ALUNO_STEP3 group by ANO_INGRESSO;
select MES_INGRESSO, count(*) from IES_2012_ALUNO_STEP3 group by MES_INGRESSO;
