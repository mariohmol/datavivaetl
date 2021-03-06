use dataviva_raw;

drop table if exists SC_2014_ESCOLA;
create table SC_2014_ESCOLA(
ANO_CENSO integer(5),
PK_COD_ENTIDADE varchar(9),
NO_ENTIDADE varchar(100),
COD_ORGAO_REGIONAL_INEP varchar(10),
DESC_SITUACAO_FUNCIONAMENTO varchar(15),
DESC_SITUACAO_CENSO varchar(1),
DT_ANO_LETIVO_INICIO varchar(20),
DT_ANO_LETIVO_TERMINO varchar(20),
FK_COD_ESTADO varchar(3),
FK_COD_MUNICIPIO varchar(9),
FK_COD_DISTRITO varchar(9),
ID_DEPENDENCIA_ADM varchar(1),
ID_LOCALIZACAO varchar(1),
DESC_CATEGORIA_ESCOLA_PRIVADA varchar(1),
ID_CONVENIADA_PP varchar(1),
ID_TIPO_CONVENIO_PODER_PUBLICO varchar(2),
ID_MANT_ESCOLA_PRIVADA_EMP varchar(1),
ID_MANT_ESCOLA_PRIVADA_ONG varchar(1),
ID_MANT_ESCOLA_PRIVADA_SIND varchar(1),
ID_MANT_ESCOLA_PRIVADA_SIST_S varchar(1),
ID_MANT_ESCOLA_PRIVADA_S_FINS varchar(1),
NUM_CNPJ_ESCOLA_PRIVADA varchar(20),
NUM_CNPJ_UNIDADE_EXECUTORA varchar(20),
ID_DOCUMENTO_REGULAMENTACAO varchar(1),
ID_LOCAL_FUNC_PREDIO_ESCOLAR varchar(1),
ID_LOCAL_FUNC_SALAS_EMPRESA varchar(1),
ID_LOCAL_FUNC_SOCIOEDUCATIVA varchar(1),
ID_LOCAL_FUNC_UNID_PRISIONAL varchar(1),
ID_LOCAL_FUNC_TEMPLO_IGREJA varchar(1),
ID_LOCAL_FUNC_CASA_PROFESSOR varchar(1),
ID_LOCAL_FUNC_GALPAO varchar(1),
ID_LOCAL_FUNC_OUTROS varchar(1),
ID_LOCAL_FUNC_SALAS_OUTRA_ESC varchar(1),
ID_ESCOLA_COMP_PREDIO varchar(1),
ID_AGUA_FILTRADA varchar(1),
ID_AGUA_REDE_PUBLICA varchar(1),
ID_AGUA_POCO_ARTESIANO varchar(1),
ID_AGUA_CACIMBA varchar(1),
ID_AGUA_FONTE_RIO varchar(1),
ID_AGUA_INEXISTENTE varchar(1),
ID_ENERGIA_REDE_PUBLICA varchar(1),
ID_ENERGIA_GERADOR varchar(1),
ID_ENERGIA_OUTROS varchar(1),
ID_ENERGIA_INEXISTENTE varchar(1),
ID_ESGOTO_REDE_PUBLICA varchar(1),
ID_ESGOTO_FOSSA varchar(1),
ID_ESGOTO_INEXISTENTE varchar(1),
ID_LIXO_COLETA_PERIODICA varchar(1),
ID_LIXO_QUEIMA varchar(1),
ID_LIXO_JOGA_OUTRA_AREA varchar(1),
ID_LIXO_RECICLA varchar(1),
ID_LIXO_ENTERRA varchar(1),
ID_LIXO_OUTROS varchar(1),
ID_SALA_DIRETORIA varchar(1),
ID_SALA_PROFESSOR varchar(1),
ID_LABORATORIO_INFORMATICA varchar(1),
ID_LABORATORIO_CIENCIAS varchar(1),
ID_SALA_ATENDIMENTO_ESPECIAL varchar(1),
ID_QUADRA_ESPORTES_COBERTA varchar(1),
ID_QUADRA_ESPORTES_DESCOBERTA varchar(1),
ID_COZINHA varchar(1),
ID_BIBLIOTECA varchar(1),
ID_SALA_LEITURA varchar(1),
ID_PARQUE_INFANTIL varchar(1),
ID_BERCARIO varchar(1),
ID_SANITARIO_FORA_PREDIO varchar(1),
ID_SANITARIO_DENTRO_PREDIO varchar(1),
ID_SANITARIO_EI varchar(1),
ID_SANITARIO_PNE varchar(1),
ID_DEPENDENCIAS_PNE varchar(1),
ID_SECRETARIA varchar(1),
ID_BANHEIRO_CHUVEIRO varchar(1),
ID_REFEITORIO varchar(1),
ID_DESPENSA varchar(1),
ID_ALMOXARIFADO varchar(1),
ID_AUDITORIO varchar(1),
ID_PATIO_COBERTO varchar(1),
ID_PATIO_DESCOBERTO varchar(1),
ID_ALOJAM_ALUNO varchar(1),
ID_ALOJAM_PROFESSOR varchar(1),
ID_AREA_VERDE varchar(1),
ID_LAVANDERIA varchar(1),
ID_DEPENDENCIAS_OUTRAS varchar(1),
NUM_SALAS_EXISTENTES varchar(10),
NUM_SALAS_UTILIZADAS varchar(10),
NUM_EQUIP_TV varchar(10),
NUM_EQUIP_VIDEOCASSETE varchar(5),
NUM_EQUIP_DVD varchar(5),
NUM_EQUIP_PARABOLICA varchar(5),
NUM_EQUIP_COPIADORA varchar(10),
NUM_EQUIP_RETRO varchar(10),
NUM_EQUIP_IMPRESSORA varchar(10),
NUM_EQUIP_SOM varchar(10),
NUM_EQUIP_MULTIMIDIA varchar(10),
NUM_EQUIP_FAX varchar(10),
NUM_EQUIP_FOTO varchar(10),
NUM_COMPUTADORES varchar(10),
NUM_COMP_ADMINISTRATIVOS varchar(10),
NUM_COMP_ALUNOS varchar(5),
ID_INTERNET varchar(1),
ID_BANDA_LARGA varchar(2),
NUM_FUNCIONARIOS varchar(10),
ID_ALIMENTACAO varchar(1),
ID_AEE varchar(2),
ID_MOD_ATIV_COMPLEMENTAR varchar(2),
ID_MOD_ENS_REGULAR varchar(1),
ID_REG_INFANTIL_CRECHE varchar(1),
ID_REG_INFANTIL_PREESCOLA varchar(1),
ID_REG_FUND_8_ANOS varchar(1),
ID_REG_FUND_9_ANOS varchar(1),
ID_REG_MEDIO_MEDIO varchar(1),
ID_REG_MEDIO_INTEGRADO varchar(1),
ID_REG_MEDIO_NORMAL varchar(1),
ID_REG_MEDIO_PROF varchar(1),
ID_MOD_ENS_ESP varchar(1),
ID_ESP_INFANTIL_CRECHE varchar(1),
ID_ESP_INFANTIL_PREESCOLA varchar(1),
ID_ESP_FUND_8_ANOS varchar(1),
ID_ESP_FUND_9_ANOS varchar(1),
ID_ESP_MEDIO_MEDIO varchar(1),
ID_ESP_MEDIO_INTEGRADO varchar(1),
ID_ESP_MEDIO_NORMAL varchar(1),
ID_ESP_MEDIO_PROFISSIONAL varchar(1),
ID_ESP_EJA_FUNDAMENTAL varchar(1),
ID_ESP_EJA_MEDIO varchar(1),
ID_MOD_EJA varchar(1),
ID_EJA_FUNDAMENTAL varchar(1),
ID_EJA_MEDIO varchar(1),
ID_EJA_PROJOVEM varchar(1),
ID_FUND_CICLOS varchar(1),
ID_LOCALIZACAO_DIFERENCIADA varchar(1),
ID_MATERIAL_ESP_NAO_UTILIZA varchar(1),
ID_MATERIAL_ESP_QUILOMBOLA varchar(1),
ID_MATERIAL_ESP_INDIGENA varchar(1),
ID_EDUCACAO_INDIGENA varchar(1),
ID_LINGUA_INDIGENA varchar(1),
FK_COD_LINGUA_INDIGENA varchar(5),
ID_LINGUA_PORTUGUESA varchar(1),
ID_ESPACO_TURMA_PBA varchar(1),
ID_ABRE_FINAL_SEMANA varchar(1),
ID_PROPOSTA_PEDAG_ALTERNANCIA varchar(5)
);

load data local infile 'Y:/Censo Escolar/2014/DADOS/ESCOLAS.csv'
into table SC_2014_ESCOLA
character set 'latin1'
fields terminated by '|'
lines terminated by '\n'
ignore 1 lines;

select * from SC_2014_ESCOLA;

