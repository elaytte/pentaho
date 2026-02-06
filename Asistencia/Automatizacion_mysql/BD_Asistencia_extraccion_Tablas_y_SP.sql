
/*
SELECT TABLE_NAME,
count(*) TABLES
,concat(round(sum(table_rows)/1000000,2),'K') rows
,concat(round(sum(data_length)/(1024*1024*1024),2),'G') DATA
,concat(round(sum(index_length)/(1024*1024*1024),2),'G') idx
,concat(round(sum(data_length+index_length)/(1024*1024*1024),2),'G') total_size
,round(sum(index_length)/sum(data_length),2) idxfrac
FROM
information_schema.TABLES
where TABLE_SCHEMA = 'asistencia_extraccion'
group by TABLE_NAME
order by data_length



/*
--DROP TABLE IF EXISTS proceso,
view_matricula_inicial_sep,
view_matricula_altas_sep,
view_matricula_bajas_sep,
view_matricula_final_sep,
view_matricula_inicial_multideficit,
view_matricula_altas_multideficit,
view_matricula_bajas_multideficit,
view_matricula_final_multideficit,
view_matricula_inicial_pie,
view_matricula_altas_pie,
view_matricula_bajas_pie,
view_matricula_final_pie,
view_matricula_inicial,
view_matricula_altas,
view_matricula_bajas,
view_matricula_final,
sige_alumno_excedente,
sige_asistencia,
sige_asistencia_declarada,
sige_curso_autorizado_nivel,
sige_curso_homologacion_subv,
sige_dias_trabajar,
sige_dias_trabajar_oficial,
sige_ee_convenio,
sige_ensenanza_grado_pie,
sige_establecimiento,
sige_matricula,
sige_estructura_curso,
sige_pie_alumnos,
sige_pie_alumnos_uns,
sige_pie_valores,
sige_prd_convenio_ee_seep,
sige_rbd_run_multideficit,
sige_region_deprov_comuna,
sige_run_duplicada,
sige_run_duplicada_asistencia,
sige_temp_asistencia_declarada,
sige_temp_curso_exedente,
sige_temp_matriculas_x_dia,
sige_ficha_alumno,
sige_asistencia_duplicada,
sige_asistencia_declarada_sep,
sige_asistencia_declarada_sep_preferente,
sige_asistencia_declarada_sep_poseidon,
sige_asistencia_declarada_pie,
sige_declaracion_asis,
sige_declaracion_certi,
sige_asistencia_declarada_multideficit,
tmp_ordena_lista,
sige_asistencia_declarada_multideficit_poseidon,
sige_asistencia_declarada_normal_pie_poseidon,
sige_asistencia_declarada_normal_sin_pie_poseidon,
sige_asistencia_declarada_pie_poseidon

go



//-----------------------------------------
optimize table proceso  
go
optimize table sige_alumno_excedente  
go
optimize table sige_asistencia  
go
optimize table sige_asistencia_declarada  
go
optimize table sige_asistencia_declarada_multideficit  
go
optimize table sige_asistencia_declarada_multideficit_poseidon  
go
optimize table sige_asistencia_declarada_normal_pie_poseidon  
go
optimize table sige_asistencia_declarada_normal_sin_pie_poseidon  
go
optimize table sige_asistencia_declarada_pie  
go
optimize table sige_asistencia_declarada_pie_poseidon  
go
optimize table sige_asistencia_declarada_sep  
go
optimize table sige_asistencia_declarada_sep_preferente
go
optimize table sige_asistencia_duplicada  
go
optimize table sige_curso_autorizado_nivel  
go
optimize table sige_curso_homologacion_subv  
go
optimize table sige_declaracion_asis  
go
optimize table sige_declaracion_certi  
go
optimize table sige_dias_trabajar  
go
optimize table sige_dias_trabajar_oficial  
go
optimize table sige_ee_convenio  
go
optimize table sige_ensenanza_grado_pie  
go
optimize table sige_establecimiento  
go
optimize table sige_estructura_curso  
go
optimize table sige_ficha_alumno  
go
optimize table sige_matricula  
go
optimize table sige_pie_alumnos  
go
optimize table sige_pie_alumnos_uns  
go
optimize table sige_pie_valores  
go
optimize table sige_prd_convenio_ee_seep  
go
optimize table sige_rbd_run_multideficit  
go
optimize table sige_region_deprov_comuna  
go
optimize table sige_run_duplicada  
go
optimize table sige_run_duplicada_asistencia  
go
optimize table sige_temp_asistencia_declarada  
go
optimize table sige_temp_curso_exedente  
go
optimize table sige_temp_matriculas_x_dia  
go
optimize table tmp_ordena_lista  
go
optimize table view_matricula_inicial_sep
go
optimize table view_matricula_altas_sep
go 
optimize table view_matricula_bajas_sep 
go 
optimize table view_matricula_final_sep 
go 
optimize table view_matricula_inicial_multideficit 
go 
optimize table view_matricula_altas_multideficit 
go 
optimize table view_matricula_bajas_multideficit 
go 
optimize table view_matricula_final_multideficit
 go 
optimize table view_matricula_inicial_pie 
go 
optimize table view_matricula_altas_pie 
go 
optimize table view_matricula_bajas_pie 
go 
optimize table view_matricula_final_pie 
go 
optimize table view_matricula_inicial 
go 
optimize table view_matricula_altas 
go 
optimize table view_matricula_bajas 
go 
optimize table view_matricula_final
go
optimize table sige_asistencia_declarada_normal_pie_poseidon
go





/****************************************************************************/

create table view_matricula_inicial_sep(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_altas_sep(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_bajas_sep(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_final_sep(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go


create table view_matricula_inicial_multideficit(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    nivel               	integer not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,nivel)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_altas_multideficit(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    nivel               	integer not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,nivel)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_bajas_multideficit(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    nivel               	integer not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,nivel)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_final_multideficit(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    nivel               	integer not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,nivel)
)
engine = myisam
collate utf8_spanish_ci
go


--drop table view_matricula_inicial_pie 
go
create table view_matricula_inicial_pie(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer ,
    cod_gra               	integer ,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra)
)
engine = myisam
collate utf8_spanish_ci
go



--drop table view_matricula_altas_pie 
go

create table view_matricula_altas_pie(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer ,
    cod_gra               	integer ,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra)
)
engine = myisam
collate utf8_spanish_ci
go


--drop table view_matricula_bajas_pie 
go

create table view_matricula_bajas_pie(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer ,
    cod_gra               	integer ,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra)
)
engine = myisam
collate utf8_spanish_ci
go

--drop table view_matricula_final_pie 
go

create table view_matricula_final_pie(
    ano_escolar             integer not null,
    mes_pago                integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens              	integer ,
    cod_gra               	integer ,
    matricula              	integer not null,
    primary key (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra)
)
engine = myisam
collate utf8_spanish_ci
go


create table view_matricula_inicial(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_altas(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go


create table view_matricula_bajas(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go

create table view_matricula_final(
    ano_escolar             integer not null,
    mes_escolar             integer not null,
    rbd                     integer not null,
    cod_ens               	integer not null,
    cod_gra               	integer not null,
    let_cur                	varchar(2) not null,
    matricula              	integer not null,
    primary key (ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam
collate utf8_spanish_ci
go




create table sige_matricula( 
	ano_escolar               	integer not null,
	sal_run                   	varchar(20) not null,
	rbd                       	integer not null,
	cod_ens                   	integer not null,
	cod_gra                   	integer not null,
	let_cur                   	character(2) not null,
	estado_colision           	character(1) not null,
	confirma_asistencia       	smallint default 0,
	alumno_exedente           	smallint default 0,
	tipo_alumno               	smallint default 0,
	estado_matricula          	smallint not null default 0,
	fecha_incorporacion       	date not null,
	fecha_retiro              	date default '1900-01-01',
	sal_repite_grado          	smallint default 0,
	sal_cod_pie               	smallint default 0,
	sal_diferencial           	smallint default 0,
	cod_sec                   	smallint default 0,
	cod_esp                   	integer default 0,
	orden_matricula           	smallint default 0,
	promedio_final            	decimal(5,1) default 0.0,
	porcen_asistencia         	smallint default 100,
	obs_promocion             	varchar(100) default '',
	reprueba_asistencia       	smallint not null default 0,
	situacion_final           	smallint not null default 0,
	fecha_ultima_actualizacion	date default '1900-01-01',
	fecha_ingreso_sistema     	date default '1900-01-01',
	fecha_retiro_sistema      	date default '1900-01-01',
	pie_fuente_finan          	smallint not null default 0,
	pie_nres                  	integer not null default 0,
	pie_fecha_res             	date not null default '1900-01-01',
	user_interno              	varchar(30) not null default '',
	ip_interno                	varchar(15) not null default '0.0.0.0',
	hora_actualizacion        	time ,
	ind_vulnerable            	smallint default 0,
	primary key             (ano_escolar,sal_run,rbd,cod_ens,cod_gra,let_cur),
    key idx_grupo_1         (ano_escolar,rbd,cod_ens),
    key idx_asis_declarada  (ano_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go








create table sige_estructura_curso  ( 
	ano_escolar               	integer not null,
	rbd                       	integer not null,
	cod_ens                   	integer not null,
	cod_gra                   	integer not null,
	let_cur                   	character(2) not null,
	estado_curso              	integer not null,
	fecha_creacion            	date not null,
	fecha_eliminacion         	date not null default '1900-01-01',
	curso_combinado           	smallint not null,
	tipo_jornada              	smallint not null default 0,
	doc_run_jefe              	varchar(10) default '',
	fecha_ultima_actualizacion	date ,
	decreto_codigo            	integer default 0,
	plan_rbd                  	integer default 0,
	plan_propio               	smallint default 0,
	cod_plan_estudio          	varchar(100) default '01780',
	cod_sec                   	smallint default 0,
	cod_esp                   	integer default 0,
	cod_des_cur               	smallint default 0,
	id_plan_estudio           	varchar(27) not null default '0',
	plan_ano_escolar          	smallint not null default 1900,
	aplica_jecd               	smallint not null default 0,
	habilitado_subv           	smallint not null default 0,
	observacion_acta          	varchar(500) default '',
	estado_acta               	smallint not null default -100,
	tipo_aula                 	smallint default 1,
	estado_habilitacion       	smallint default 1,
	infraest_especialidad     	smallint not null default 0,
	primary key                 (ano_escolar,rbd,cod_ens,cod_gra,let_cur)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go




create table sige_establecimiento  ( 
	rbd                  	integer not null,
	dv_rbd               	integer not null,
	nombre_esta          	varchar(150) not null,
	cp_region            	smallint not null,
	cp_deprov            	smallint not null,
	cp_provincia         	smallint not null,
	cp_comuna            	smallint not null,
	rut_sostenedor       	varchar(20) not null,
	cod_region           	smallint not null,
	cod_provincia        	smallint not null,
	cod_comuna           	smallint not null,
	tipo_dependencia     	smallint not null,
	ano                  	smallint not null,
	mes                  	smallint not null,
	estado_estab         	smallint not null,
	fono_estab           	varchar(500) default ' ',
	cod_area_estab       	varchar(3) default '00',
	mail_estab           	varchar(100) default '',
	n_res_recofi         	varchar(100) default ' ',
	fecha_res_recofi     	date default '1900-01-01',
	dire_run             	varchar(10) default '',
	dire_dv              	character(1) default '',
	dire_paterno         	varchar(100) default ' ',
	dire_materno         	varchar(100) default ' ',
	dire_nombres         	varchar(100) default ' ',
	estado_actualizacion 	smallint default 0,
	n_res_nombre         	varchar(100) default ' ',
	fecha_res_nombre     	date default '1900-01-01',
	direccion_estab      	varchar(500) default ' ',
	celular_estab        	varchar(10) default ' ',
	fecha_actualizacion  	date ,
	estado_recofi        	smallint default 0,
	asistencia_sep       	smallint default 0,
	ind_convenio         	smallint not null default 0,
	ano_convenio         	smallint not null default 0,
	rural_estab          	integer default 0,
	tiene_clave_sub      	smallint default 0,
	clave_estab          	varchar(100) ,
	regimen_sep          	smallint default 0,
	clasificacion        	smallint default 0,
	asistencia_normal    	smallint default 0,
	dire_clave           	varchar(100) default '',
	dire_clave_valida    	smallint default 0,
	sw_propio            	varchar(250) default '',
	direccion_estab_num  	varchar(10) default 's/n',
	lugar_referencia     	varchar(200) default ' ',
	postal_code          	varchar(15) default ' ',
	cod_area_director    	varchar(3) default '0',
	telefono_director    	varchar(15) default '0',
	celular_director     	varchar(15) default ' ',
	mail_director        	varchar(200) default '@',
	tipo_esta            	smallint default 1,
	user_interno         	varchar(30) default 'adm',
	ip_interno           	varchar(15) default '0.0.0.0',
	hora_actualizacion   	time ,
	tipo_financiamento   	smallint default 0,
	porc_zona            	integer default 0,
	piso_rural           	smallint default 0,
	inc_ruralidad        	smallint default 0,
	ing_proyectados      	integer default 0,
	ing_persibidos       	integer default 0,
	dicl_interop         	smallint not null default 0,
	tipo_alumnado        	smallint default 0,
	capacidad_hombres    	integer default 0,
	capacidad_mujeres    	integer default 0,
	fecha_ingreso_sistema	date ,
	hora_ingreso_sistema 	time ,
	fecha_ini_recofi     	date default '1900-01-01',
	fecha_fin_recofi     	date default '1900-01-01',
	tipo_documento_recofi	varchar(27) default '',
	url_doc_recofi       	varchar(150) default '',
	per_id               	varchar(27) default '',
	trel_tipo            	smallint default 0,
	fecha_recibe_subv    	date default '1900-01-01',
	primary key(rbd)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_curso_autorizado_nivel  ( 
	ano_escolar        	integer not null,
	rbd                	integer not null,
	cod_ens            	smallint not null,
	cod_gra            	smallint not null,
	ccjecd             	smallint not null,
	csjecd             	smallint not null,
	dependencia        	smallint not null,
	fecha_jecd         	date not null,
	resol_jecd         	varchar(20) not null,
	user_interno       	varchar(30) not null,
	ip_interno         	varchar(15) not null,
	fecha_actualizacion	date ,
	hora_actualizacion 	time ,
	primary key(ano_escolar,rbd,cod_ens,cod_gra)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_dias_trabajar_oficial  ( 
	region             	smallint,
	deprov             	smallint,
	mes_escolar        	smallint,
	ano_escolar        	smallint,
	rbd                	integer not null,
	cod_ens            	smallint,
	cod_gra            	smallint,
	let_cur            	varchar(2),
	dia1               	smallint,
	dia2               	smallint,
	dia3               	smallint,
	dia4               	smallint,
	dia5               	smallint,
	dia6               	smallint,
	dia7               	smallint,
	dia8               	smallint,
	dia9               	smallint,
	dia10              	smallint,
	dia11              	smallint,
	dia12              	smallint,
	dia13              	smallint,
	dia14              	smallint,
	dia15              	smallint,
	dia16              	smallint,
	dia17              	smallint,
	dia18              	smallint,
	dia19              	smallint,
	dia20              	smallint,
	dia21              	smallint,
	dia22              	smallint,
	dia23              	smallint,
	dia24              	smallint,
	dia25              	smallint,
	dia26              	smallint,
	dia27              	smallint,
	dia28              	smallint,
	dia29              	smallint,
	dia30              	smallint,
	dia31              	smallint,
	fecha_actualizacion	date ,
	hora_actualizacion 	time ,
	dias_trabajados    	smallint default 0,
	n_resolucion       	varchar(20) ,
	fecha_resolucion   	date ,
	user_interno       	varchar(30) ,
	ip_interno         	varchar(15) ,
	primary key         (ano_escolar,mes_escolar,region,deprov,rbd,cod_ens,cod_gra,let_cur)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_dias_trabajar  ( 
	mes_escolar       	smallint not null,
	ano_escolar       	smallint not null,
	rbd               	integer not null,
	cod_ens           	smallint not null,
	cod_gra           	smallint not null,
	let_cur           	varchar(2) not null,
	dia1              	smallint,
	dia2              	smallint,
	dia3              	smallint,
	dia4              	smallint,
	dia5              	smallint,
	dia6              	smallint,
	dia7              	smallint,
	dia8              	smallint,
	dia9              	smallint,
	dia10             	smallint,
	dia11             	smallint,
	dia12             	smallint,
	dia13             	smallint,
	dia14             	smallint,
	dia15             	smallint,
	dia16             	smallint,
	dia17             	smallint,
	dia18             	smallint,
	dia19             	smallint,
	dia20             	smallint,
	dia21             	smallint,
	dia22             	smallint,
	dia23             	smallint,
	dia24             	smallint,
	dia25             	smallint,
	dia26             	smallint,
	dia27             	smallint,
	dia28             	smallint,
	dia29             	smallint,
	dia30             	smallint,
	dia31             	smallint,
	fecha_mod         	date ,
	hra_mod           	time ,
	dias_trabajados   	smallint default 0,
	estado_declaracion	smallint,
	aut_deprov        	smallint default 0 
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go



create table sige_asistencia  ( 
	mes_escolar        	smallint not null,
	rbd                	integer not null,
	cod_ens            	smallint not null,
	cod_gra            	smallint not null,
	let_cur            	varchar(2) not null,
	ano_escolar        	integer not null,
	sal_run            	varchar(20) not null,
	dia1               	smallint,
	dia2               	smallint,
	dia3               	smallint,
	dia4               	smallint,
	dia5               	smallint,
	dia6               	smallint,
	dia7               	smallint,
	dia8               	smallint,
	dia9               	smallint,
	dia10              	smallint,
	dia11              	smallint,
	dia12              	smallint,
	dia13              	smallint,
	dia14              	smallint,
	dia15              	smallint,
	dia16              	smallint,
	dia17              	smallint,
	dia18              	smallint,
	dia19              	smallint,
	dia20              	smallint,
	dia21              	smallint,
	dia22              	smallint,
	dia23              	smallint,
	dia24              	smallint,
	dia25              	smallint,
	dia26              	smallint,
	dia27              	smallint,
	dia28              	smallint,
	dia29              	smallint,
	dia30              	smallint,
	dia31              	smallint,
	dias_trabajados    	smallint,
	asis_promedio      	decimal(10,4),
	estado_declaracion 	smallint default 0,
	dias_asistidos     	smallint,
	user_interno       	varchar(30) not null default '',
	ip_interno         	varchar(15) not null default '0.0.0.0',
	fecha_actualizacion	date ,
	hora_actualizacion 	time ,
	cur_aut_estado     	smallint ,
	primary key(ano_escolar,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go




create table sige_pie_alumnos  ( 
	ano_escolar        	integer not null,
	rbd                	integer not null,
	cod_ens            	integer not null,
	cod_gra            	integer not null,
	let_cur            	varchar(2) not null,
	jecd               	smallint not null,
	sal_run            	varchar(20) not null,
	tipo_pie           	smallint not null,
	cod_pie            	smallint not null,
	estado             	smallint not null,
	ano_anterior       	smallint not null,
	fecha_actualizacion	date not null,
	hora_actualizacion 	time not null,
	convenio           	smallint default 0,
	primary key         (ano_escolar,rbd,cod_ens,cod_gra,let_cur,jecd,sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_region_deprov_comuna  ( 
	cod_region  	integer,
	nom_region  	character(50),
	cod_deprov  	integer,
	nom_deprov  	character(50),
	cod_comuna  	integer,
	nom_comuna  	character(50),
	ordenamiento	smallint default 0 
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_rbd_run_multideficit  ( 
	ano_escolar   	integer not null,
	rbd           	integer not null,
	sal_run       	varchar(20) not null,
	fecha_inicio  	date ,
	fecha_termino 	date ,
	fecha_creacion	date ,
	primary key(ano_escolar,rbd,sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go


create table sige_pie_alumnos_uns  ( 
	ano_escolar        	integer not null,
	mes_pago           	integer not null,
	rbd                	integer not null,
	cod_ens            	integer not null,
	cod_gra            	integer not null,
	let_cur            	varchar(2) not null,
	jecd               	smallint not null,
	sal_run            	varchar(20) not null,
	tipo_pie           	smallint not null,
	cod_pie            	smallint not null,
	estado             	smallint not null,
	ano_anterior       	smallint not null,
	fecha_actualizacion	date not null,
	hora_actualizacion 	time not null,
	convenio           	smallint default 0,
	fecha_ingreso_uns  	date ,
	time_ingreso_uns   	time ,
	primary key(ano_escolar,mes_pago,rbd,cod_ens,cod_gra,let_cur,jecd,sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go

create index  idx_pie_uns 
on sige_pie_alumnos_uns(ano_escolar,mes_pago,rbd,sal_run)
go




create table sige_prd_convenio_ee_seep  ( 
	rbd           	integer not null,
	nombre        	varchar(100),
	anio_proc     	integer not null default 0,
	anio_matricula	integer not null default 0,
	concentracion 	decimal(10,4) default 0.0,
	promedio_ap   	decimal(10,4) default 0.0,
	promedio_total	decimal(10,4) default 0.0,
    primary key(anio_proc,rbd)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_pie_valores  ( 
	ano_escolar	integer not null,
	tipo_pie   	smallint not null,
	cod_pie    	smallint not null,
	glosa_pie  	varchar(100) not null,
	estado     	smallint not null,
	primary key (tipo_pie,cod_pie,ano_escolar)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go





create table sige_ficha_alumno  ( 
	sal_run               	varchar(20) not null,
	sal_dgv               	character(1) ,
	sal_app               	varchar(50) ,
	sal_apm               	varchar(50) ,
	sal_nom               	varchar(100),
	sal_fec_nac           	date ,
	sal_fec_matr          	date ,
	ind_valregcivil       	integer ,
	tipo_alumno           	smallint default 0,
	primary key             (sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go


SELECT sal_run, sal_dgv, sal_app, sal_apm, sal_nom, sal_fec_nac, sal_fec_matr, ind_valregcivil, tipo_alumno 
	FROM sige_ficha_alumno
GO





create table sige_curso_homologacion_subv  ( 
	ano_escolar 	integer not null,
	cod_ens     	integer not null,
	cod_gra     	integer not null,
	aplica_jecd 	smallint not null default 0,
	tipo_aula   	smallint not null default 1,
	cod_ens_subv	integer not null,
	cod_gra_subv	integer not null,
	primary key     (ano_escolar,cod_ens,cod_gra,aplica_jecd,tipo_aula,cod_ens_subv,cod_gra_subv)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go




create table sige_ensenanza_grado_pie  ( 
	cod_ensenanza	smallint not null,
	ano_escolar  	smallint ,
	cod_grado    	smallint not null,
	glosa_grado  	varchar(100) not null,
	jecd         	smallint not null default 0,
	tipo_deficit 	smallint not null default 0,
	discapacidad 	smallint not null default 0,
	estado_grado 	smallint not null default 1,
	cod_ens_subv 	smallint not null default 0,
	matricula_max	smallint not null default 0,
	nivel        	smallint default 0,
	primary key     (cod_ensenanza,ano_escolar,cod_grado,jecd,tipo_deficit,discapacidad)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go

create index  index01 
on sige_ensenanza_grado_pie(ano_escolar,cod_ensenanza,cod_grado)
go




create table sige_asistencia_declarada  ( 
	mes_pago          	smallint not null,
	mes_escolar       	smallint not null,
	rbd               	integer not null,
	cod_ens           	smallint not null,
	cod_gra           	smallint not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	integer not null,
	sal_run           	varchar(20) not null,
	dias_trabajados   	smallint,
	asis_promedio     	decimal(10,4),
	estado_declaracion	smallint default 0,
	dias_asistidos    	smallint,
	estado_pago       	smallint default 0,
	fecha_matricula   	date default '1900-01-01',
	estado_colision   	smallint default 0,
	regimen_sep       	smallint default 0,
	tipo_alumno       	smallint default 0,
	orden_matricula   	smallint default 0,
	tipo_aula         	smallint default 1,
	jecd              	smallint default -100,
	cod_ens_subv      	integer default 0,
	cod_gra_subv      	integer default 0,
	monto_subv_normal 	decimal(20,5) default 0,
	habilitado_subv   	smallint default 0,
	fecha_ingreso     	timestamp default current_timestamp,
	primary key         (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run),
    key idx_sep         (ano_escolar, mes_pago, mes_escolar, regimen_sep, tipo_alumno, estado_pago, habilitado_subv, estado_declaracion, cod_ens, cod_gra),
    key idx_hospitalarios (ano_escolar, mes_pago, mes_escolar,tipo_aula,habilitado_subv,estado_pago, estado_declaracion),
    KEY idx_pie_uns_asis (ano_escolar,mes_pago,rbd,sal_run)
)
engine=myisam 
default charset=utf8 
collate=utf8_spanish_ci
go






create table sige_ee_convenio  ( 
	conv_id                	varchar(27) not null,
	conv_tipo_id           	varchar(27) not null,
	rbd                    	integer not null,
	conv_valor             	varchar(50),
	conv_valor_desc        	varchar(150),
	conv_folio             	varchar(50),
	conv_fecha_folio       	date,
	conv_fecha_ini_conven  	date,
	conv_fecha_fin_conven  	date,
	conv_folio_fecha_fin   	date,
	conv_folio_fin         	varchar(50),
	conv_descripcion       	varchar(500),
	conv_estado            	smallint,
	conv_fecha_creacion    	date,
	conv_hora_creacion     	time,
	conv_fecha_modicacion  	date,
	conv_hora_modicacion   	time,
	conv_tipo_documento_sgd	varchar(27),
	conv_doc_sgd           	varchar(100),
	conv_estado_sicps      	varchar(1) not null default 0,
	conv_user_interno      	varchar(30),
	conv_ip_interno        	varchar(15),
	conv_folio_fecha_ini   	date not null default '1900-01-01',
	primary key             (rbd,conv_tipo_id,conv_id)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table sige_alumno_excedente  ( 
	id_ae       	varchar(27) not null,
	ano_escolar 	integer not null,
	sal_run     	varchar(10) not null,
	rbd         	integer not null,
	cod_ens     	integer not null,
	cod_gra     	smallint not null,
	let_cur     	varchar(2) not null,
	fecha_inicio	date not null,
	fecha_fin   	date default '1900-01-01',
	primary key     (id_ae),
    key idx_sige_alumno_excedente   (ano_escolar,sal_run,rbd,cod_ens,cod_gra,let_cur)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table sige_temp_matriculas_x_dia  ( 
	mes_pago   	smallint not null,
	mes_escolar	smallint not null,
	rbd        	integer not null,
	cod_ens    	smallint not null,
	cod_gra    	smallint not null,
	let_cur    	varchar(2) not null,
	dia1       	integer,
	dia2       	integer,
	dia3       	integer,
	dia4       	integer,
	dia5       	integer,
	dia6       	integer,
	dia7       	integer,
	dia8       	integer,
	dia9       	integer,
	dia10      	integer,
	dia11      	integer,
	dia12      	integer,
	dia13      	integer,
	dia14      	integer,
	dia15      	integer,
	dia16      	integer,
	dia17      	integer,
	dia18      	integer,
	dia19      	integer,
	dia20      	integer,
	dia21      	integer,
	dia22      	integer,
	dia23      	integer,
	dia24      	integer,
	dia25      	integer,
	dia26      	integer,
	dia27      	integer,
	dia28      	integer,
	dia29      	integer,
	dia30      	integer,
	dia31      	integer 
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go

/*/

create table sige_temp_asistencia_declarada( 
	mes_pago          	smallint not null,
	mes_escolar       	smallint not null,
	rbd               	integer not null,
	cod_ens           	smallint not null,
	cod_gra           	smallint not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	integer not null,
	sal_run           	varchar(20) not null,
	dia1              	smallint,
	dia2              	smallint,
	dia3              	smallint,
	dia4              	smallint,
	dia5              	smallint,
	dia6              	smallint,
	dia7              	smallint,
	dia8              	smallint,
	dia9              	smallint,
	dia10             	smallint,
	dia11             	smallint,
	dia12             	smallint,
	dia13             	smallint,
	dia14             	smallint,
	dia15             	smallint,
	dia16             	smallint,
	dia17             	smallint,
	dia18             	smallint,
	dia19             	smallint,
	dia20             	smallint,
	dia21             	smallint,
	dia22             	smallint,
	dia23             	smallint,
	dia24             	smallint,
	dia25             	smallint,
	dia26             	smallint,
	dia27             	smallint,
	dia28             	smallint,
	dia29             	smallint,
	dia30             	smallint,
	dia31             	smallint,
	dias_trabajados   	smallint,
	asis_promedio     	decimal(10,4),
	estado_declaracion	smallint default 0,
	dias_asistidos    	smallint,
	estado_pago       	smallint default 0,
	fecha_matricula   	date default '1900-01-01',
	estado_colision   	smallint default 0,
	regimen_sep       	smallint default 0,
	tipo_alumno       	smallint default 0,
	orden_matricula   	smallint default 0,
	tipo_aula         	smallint default 1,
	jecd              	smallint default -100,
	cod_ens_subv      	integer default 0,
	cod_gra_subv      	integer default 0,
	monto_subv_normal 	decimal(20,5) default 0,
	primary key(mes_pago,cod_gra,let_cur,mes_escolar,rbd,cod_ens,ano_escolar,sal_run)
)
engine = myisam
collate utf8_spanish_ci
go
/*/



/*
create table sige_temp_curso_exedente  ( 
	mes_pago   	smallint not null,
	mes_escolar	smallint not null,
	rbd        	integer not null,
	cod_ens    	smallint not null,
	cod_gra    	smallint not null,
	let_cur    	varchar(2) not null,
	ano_escolar	integer not null,
	estado_pago	smallint default 0,
	primary key (mes_pago,cod_gra,let_cur,mes_escolar,rbd,cod_ens,ano_escolar)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go
*/



create table proceso(
    ano_escolar   int default 0,
    mes_pago      int default 0,
    mes_escolar   int default 0,
    descripcion   varchar(100),
    fecha         timestamp default current_timestamp          
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table sige_run_duplicada  ( 
	ano_escolar	integer not null,
	mes_pago   	integer not null,
	sal_run    	varchar(20) not null,
    key idx_sige_run_duplicada (ano_escolar,mes_pago,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go



create table sige_run_duplicada_asistencia  ( 
	mes_pago          	smallint not null,
	mes_escolar       	smallint not null,
	rbd               	integer not null,
	cod_ens           	smallint not null,
	cod_gra           	smallint not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	integer not null,
	sal_run           	varchar(20) not null,
	dia1              	smallint,
	dia2              	smallint,
	dia3              	smallint,
	dia4              	smallint,
	dia5              	smallint,
	dia6              	smallint,
	dia7              	smallint,
	dia8              	smallint,
	dia9              	smallint,
	dia10             	smallint,
	dia11             	smallint,
	dia12             	smallint,
	dia13             	smallint,
	dia14             	smallint,
	dia15             	smallint,
	dia16             	smallint,
	dia17             	smallint,
	dia18             	smallint,
	dia19             	smallint,
	dia20             	smallint,
	dia21             	smallint,
	dia22             	smallint,
	dia23             	smallint,
	dia24             	smallint,
	dia25             	smallint,
	dia26             	smallint,
	dia27             	smallint,
	dia28             	smallint,
	dia29             	smallint,
	dia30             	smallint,
	dia31             	smallint,
	dias_trabajados   	smallint,
	asis_promedio     	decimal(10,4),
	estado_declaracion	smallint,
	dias_asistidos    	smallint,
	fecha_matricula   	date,
	regimen_sep       	smallint,
	tipo_alumno       	smallint,
	orden_matricula   	smallint,
	tipo_aula         	smallint,
	jecd              	smallint,
	cod_ens_subv      	integer,
	cod_gra_subv      	integer,
	monto_subv_normal 	decimal(20,5),
    key idx_sige_run_duplicada_asistencia (mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run,ano_escolar),
    key idx1_sige_run_duplicada (sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go


create table sige_asistencia_duplicada  ( 
	id                     	varchar(36) not null,
	ano_escolar            	smallint not null,
	mes_pago               	smallint not null,
	mes_escolar            	smallint not null,
	rbd                    	integer not null,
	cod_ens                	smallint not null,
	cod_gra                	smallint not null,
	let_cur                	varchar(2) not null,
	sal_run                	varchar(20) not null,
	dias_trabajados        	varchar(250) not null default '',
	dias_trabajados_palabra	varchar(4000) not null default '',
	asis_promedio          	decimal(10,4),
	estado_declaracion     	smallint default 0,
	dias_asistidos         	smallint,
	estado                 	smallint default 1,
	primary key(id)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table tmp_ordena_lista  ( 
    ano_escolar       	integer not null,
    mes_pago          	smallint not null,
    mes_escolar       	smallint not null,
	rbd               	integer not null,
	cod_ens           	smallint not null,
	cod_gra           	smallint not null,
	let_cur           	varchar(2) not null,
	sal_run           	varchar(20) not null,
	orden_matricula   	smallint default 0,
    orden_final        	smallint default 0,
    primary key         (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run),
    key idx_tmp         (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go







create table sige_asistencia_declarada_sep  ( 
	mes_pago          	smallint(6) not null,
	mes_escolar       	smallint(6) not null,
	rbd               	int(11) not null,
	cod_ens           	smallint(6) not null,
	cod_gra           	smallint(6) not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	int(11) not null,
	sal_run           	varchar(20) not null,
	dias_trabajados   	smallint(6) null,
	asis_promedio     	decimal(10,4) null,
	estado_declaracion	smallint(6) null default '0',
	dias_asistidos    	smallint(6) null,
	estado_pago       	smallint(6) null default '0',
	fecha_matricula   	date null default '1900-01-01',
	estado_colision   	smallint(6) null default '0',
	regimen_sep       	smallint(6) null default '0',
	tipo_alumno       	smallint(6) null default '0',
	orden_matricula   	smallint(6) null default '0',
	tipo_aula         	smallint(6) null default '1',
	jecd              	smallint(6) null default '-100',
	cod_ens_subv      	int(11) null default '0',
	cod_gra_subv      	int(11) null default '0',
	monto_subv_normal 	decimal(20,5) null default '0.00000',
	primary key         (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go



create table sige_asistencia_declarada_sep_preferente  ( 
	mes_pago          	smallint(6) not null,
	mes_escolar       	smallint(6) not null,
	rbd               	int(11) not null,
	cod_ens           	smallint(6) not null,
	cod_gra           	smallint(6) not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	int(11) not null,
	sal_run           	varchar(20) not null,
	dias_trabajados   	smallint(6) null,
	asis_promedio     	decimal(10,4) null,
	estado_declaracion	smallint(6) null default '0',
	dias_asistidos    	smallint(6) null,
	estado_pago       	smallint(6) null default '0',
	fecha_matricula   	date null default '1900-01-01',
	estado_colision   	smallint(6) null default '0',
	regimen_sep       	smallint(6) null default '0',
	tipo_alumno       	smallint(6) null default '0',
	orden_matricula   	smallint(6) null default '0',
	tipo_aula         	smallint(6) null default '1',
	jecd              	smallint(6) null default '-100',
	cod_ens_subv      	int(11) null default '0',
	cod_gra_subv      	int(11) null default '0',
	monto_subv_normal 	decimal(20,5) null default '0.00000',
	primary key(ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table sige_asistencia_declarada_sep_poseidon  ( 
	rbd              	int(11) not null,
	anio_asist       	smallint(6) not null,
	mes_asist        	smallint(6) not null,
	anio_pago        	smallint(6) not null,
	mes_pago         	smallint(6) not null,
	cod_ense         	smallint(6) not null,
	nivel            	smallint(6) not null,
	asistencia_mes   	decimal(10,4) null,
	matricula_inicial	int(11) not null,
	altas            	int(11) not null,
	bajas            	int(11) not null,
	matricula_final  	int(11) not null,
	primary key         (rbd,anio_asist,mes_asist,anio_pago,mes_pago,cod_ense,nivel)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go

create table sige_asistencia_declarada_sep_preferente  ( 
	mes_pago          	smallint(6) not null,
	mes_escolar       	smallint(6) not null,
	rbd               	int(11) not null,
	cod_ens           	smallint(6) not null,
	cod_gra           	smallint(6) not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	int(11) not null,
	sal_run           	varchar(20) not null,
	dias_trabajados   	smallint(6) null,
	asis_promedio     	decimal(10,4) null,
	estado_declaracion	smallint(6) null default '0',
	dias_asistidos    	smallint(6) null,
	estado_pago       	smallint(6) null default '0',
	fecha_matricula   	date null default '1900-01-01',
	estado_colision   	smallint(6) null default '0',
	regimen_sep       	smallint(6) null default '0',
	tipo_alumno       	smallint(6) null default '0',
	orden_matricula   	smallint(6) null default '0',
	tipo_aula         	smallint(6) null default '1',
	jecd              	smallint(6) null default '-100',
	cod_ens_subv      	int(11) null default '0',
	cod_gra_subv      	int(11) null default '0',
	monto_subv_normal 	decimal(20,5) null default '0.00000',
	primary key         (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go





create table sige_asistencia_declarada_pie  ( 
	mes_pago          	smallint(6) not null,
	mes_escolar       	smallint(6) not null,
	rbd               	int(11) not null,
	cod_ens           	smallint(6) not null,
	cod_gra           	smallint(6) not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	int(11) not null,
	sal_run           	varchar(20) not null,
	
	dias_trabajados   	smallint(6) null,
	asis_promedio     	decimal(10,4) null,
	estado_declaracion	smallint(6) null default '0',
	dias_asistidos    	smallint(6) null,
	estado_pago       	smallint(6) null default '0',
	fecha_matricula   	date null default '1900-01-01',
	estado_colision   	smallint(6) null default '0',
	regimen_sep       	smallint(6) null default '0',
	tipo_alumno       	smallint(6) null default '0',
	orden_matricula   	smallint(6) null default '0',
	tipo_aula         	smallint(6) null default '1',
	jecd              	smallint(6) null default '-100',
	cod_ens_subv      	int(11) null default '0',
	cod_gra_subv      	int(11) null default '0',
	monto_subv_normal 	decimal(20,5) null default '0.00000',
	primary key         (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table sige_declaracion_asis  ( 
	ano_escolar         	integer not null,
	rbd                 	integer not null,
	cod_ens             	integer not null,
	cod_gra             	integer not null,
	let_cur             	character(2) not null,
	fecha_declaracion   	date ,
	hora_declaracion    	time ,
	estado_declaracion  	smallint ,
	fecha_mod           	date ,
	hora_mod            	time  ,
	mes_declaracion     	smallint ,
	n_alumnos           	smallint,
	dias_trabajados     	smallint,
	asis_promedio       	decimal(10,4),
	id_declaracion_certi	varchar(27) ,
	habilitado_subv     	smallint ,
	primary key             (ano_escolar,rbd,cod_ens,cod_gra,let_cur,fecha_declaracion,hora_declaracion,estado_declaracion,id_declaracion_certi)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go


create table sige_declaracion_certi  ( 
	id                  	varchar(27) not null,
	ano_escolar         	integer not null,
	fecha_declaracion   	date ,
	hora_declaracion    	time ,
	estado_declaracion  	smallint ,
	rbd                 	integer ,
	mes_declaracion     	smallint ,
	id_declaracion_certi	varchar(27),
	primary key(id)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go




create table sige_asistencia_declarada_multideficit  ( 
	mes_pago          	smallint(6) not null,
	mes_escolar       	smallint(6) not null,
	rbd               	int(11) not null,
	cod_ens           	smallint(6) not null,
	cod_gra           	smallint(6) not null,
	let_cur           	varchar(2) not null,
	ano_escolar       	int(11) not null,
	sal_run           	varchar(20) not null,
	
	dias_trabajados   	smallint(6) null,
	asis_promedio     	decimal(10,4) null,
	estado_declaracion	smallint(6) null default '0',
	dias_asistidos    	smallint(6) null,
	estado_pago       	smallint(6) null default '0',
	fecha_matricula   	date null default '1900-01-01',
	estado_colision   	smallint(6) null default '0',
	regimen_sep       	smallint(6) null default '0',
	tipo_alumno       	smallint(6) null default '0',
	orden_matricula   	smallint(6) null default '0',
	tipo_aula         	smallint(6) null default '1',
	jecd              	smallint(6) null default '-100',
	cod_ens_subv      	int(11) null default '0',
	cod_gra_subv      	int(11) null default '0',
	monto_subv_normal 	decimal(20,5) null default '0.00000',

	primary key(ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur,sal_run)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go


create table sige_informe_preferentes(
    cp_region       smallint not null,
    cp_deprov       smallint not null,
    cp_comuna       smallint not null,
    nom_comuna      varchar(50),
    ano_escolar     integer  not null,
    mes_pago        smallint not null,
    mes_escolar     smallint not null,
    rbd             integer not null,
    nombre_esta     varchar(150) ,
    tipo_dependencia    smallint not null,
    cod_ens_subv    smallint    ,
    cod_gra_subv    smallint,
    jecd            smallint,
    asis_promedio_prio      decimal(10,4) default 0.0,
    asis_promedio_pref      decimal(10,4) default 0.0,
    num_alumnos_prio        integer default 0,
    num_alumnos_pref        integer default 0 ,
    primary key             (ano_escolar,mes_pago,mes_escolar,rbd,cod_ens_subv,cod_gra_subv,jecd)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go



create table sige_asistencia_declarada_normal_pie_poseidon  ( 
	rbd              	int(11) not null,
	anio_asist       	smallint(6) not null,
	mes_asist        	smallint(6) not null,
	anio_pago        	smallint(6) not null,
	mes_pago         	smallint(6) not null,
	cod_ense         	smallint(6) not null,
	nivel            	smallint(6) not null,
	asistencia_mes   	decimal(10,4) null,
	matricula_inicial	int(11) not null,
	altas            	int(11) not null,
	bajas            	int(11) not null,
	matricula_final  	int(11) not null,
    key idx_1 (rbd, anio_asist, mes_asist, anio_pago, mes_pago, cod_ense, nivel),
    key idx_2 (anio_pago, rbd, cod_ense, nivel)
    
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go


create table sige_asistencia_declarada_normal_sin_pie_poseidon  ( 
	rbd              	int(11) not null,
	anio_asist       	smallint(6) not null,
	mes_asist        	smallint(6) not null,
	anio_pago        	smallint(6) not null,
	mes_pago         	smallint(6) not null,
	cod_ense         	smallint(6) not null,
	nivel            	smallint(6) not null,
	asistencia_mes   	decimal(10,4) null,
	matricula_inicial	int(11) not null,
	altas            	int(11) not null,
	bajas            	int(11) not null,
	matricula_final  	int(11) not null,
	primary key(rbd,anio_pago,anio_asist,mes_pago,mes_asist,cod_ense,nivel),
    key idx_1  (rbd, anio_asist, mes_asist, anio_pago, mes_pago, cod_ense, nivel),
    key idx_2  (anio_pago, rbd, cod_ense, nivel)
)
engine = myisam 
default charset=utf8 
collate = utf8_spanish_ci
go

create table sige_asistencia_declarada_multideficit_poseidon  ( 
	rbd              	integer not null,
	anio_asist       	smallint not null,
	mes_asist        	smallint not null,
	anio_pago        	smallint not null,
	mes_pago         	smallint not null,
	cod_ense         	smallint not null,
	nivel            	smallint not null,
	asistencia_mes   	decimal(10,4),
	matricula_inicial	integer not null,
	altas            	integer not null,
	bajas            	integer not null,
	matricula_final  	integer not null,
    primary key(anio_asist,mes_pago,mes_asist,rbd,cod_ense,nivel)
	)
GO





/*

******************************************************************************************************************
/*      asistencia declarada duplicada 1
/******************************************************************************************************************

--call sp_carga_asistencia_declarada_duplicada(2014,11,10)

drop procedure sp_carga_asistencia_declarada_duplicada
go

create procedure sp_carga_asistencia_declarada_duplicada (in pano_escolar int, in pmes_pago int,in pmes_actual int)
not deterministic
contains sql
begin

    declare done int default false;

    declare crs_intmespago 	smallint;
    declare crs_mes_escolar	smallint;
    declare crs_rbd	integer;
    declare crs_cod_ens	smallint;
    declare crs_cod_gra	smallint;
    declare crs_let_cur	varchar(2);
    declare crs_ano_escolar	integer;
    declare crs_sal_run	varchar(20);
    declare crs_dia1	smallint;
    declare crs_dia2	smallint;
    declare crs_dia3	smallint;
    declare crs_dia4	smallint;
    declare crs_dia5	smallint;
    declare crs_dia6	smallint;
    declare crs_dia7	smallint;
    declare crs_dia8	smallint;
    declare crs_dia9	smallint;
    declare crs_dia10	smallint;
    declare crs_dia11	smallint;
    declare crs_dia12	smallint;
    declare crs_dia13	smallint;
    declare crs_dia14	smallint;
    declare crs_dia15	smallint;
    declare crs_dia16	smallint;
    declare crs_dia17	smallint;
    declare crs_dia18	smallint;
    declare crs_dia19	smallint;
    declare crs_dia20	smallint;
    declare crs_dia21	smallint;
    declare crs_dia22	smallint;
    declare crs_dia23	smallint;
    declare crs_dia24	smallint;
    declare crs_dia25	smallint;
    declare crs_dia26	smallint;
    declare crs_dia27	smallint;
    declare crs_dia28	smallint;
    declare crs_dia29 	smallint;
    declare crs_dia30	smallint;
    declare crs_dia31	smallint;
    declare crs_dias_trabajados	smallint;
    declare crs_asis_promedio	decimal(10,4);
    declare crs_estado_declaracion	smallint;
    declare crs_dias_asistidos	smallint;
    declare crs_fecha_incorporacion	date;
    declare crs_estado_colision	smallint;
    declare crs_estado_pago	smallint;
    declare crs_contador	integer default 0;
    declare crs_regimen_sep integer;
    declare crs_tipo_alumno integer;
    declare crs_orden_matricula integer;
    declare crs_curso_actual	varchar(30) default '';
    declare crs_curso_aux		varchar(30) default '';
    declare crs_exe smallint;
    declare crs_tipo_aula smallint;
    declare vintalumno_retirado smallint;
    declare vintasistencia_duplicada smallint;
    declare vdiastrabajados_duplicado varchar(250) default '';
    declare crs_aplica_jecd smallint default 0;
    declare crs_cod_ens_subv smallint default 0;
    declare crs_cod_gra_subv smallint default 0;
    declare count_cursor integer default 0 ;
    declare ptotal_asis integer default 0 ;
    declare vfacuse decimal(7,5) default 0 ;
    declare vvaloruse decimal(10,4) default 0 ;
    declare vmonto_subv_normal decimal(10,4) default 0 ;
    declare vdiastrabajados_duplicado_palabra varchar(4000) default '';
    declare vexistenrundup integer default 0 ;


    


    select count(*) into @existe
    from sige_run_duplicada where ano_escolar = pano_escolar and mes_pago = pmes_pago;


    if(@existe = 0) then
            insert into sige_run_duplicada
            select  pano_escolar    ano_escolar,
                    pmes_pago       mes_pago,
                    sal_run 
            from sige_matricula sm, sige_establecimiento se
            where sm.ano_escolar = pano_escolar
            and sm.rbd = se.rbd
            and se.tipo_dependencia in (1,2,3,5)
            group by sal_run
            having count(*) > 1;

    end if;

   

    insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
    select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('matricula duplicada [',pano_escolar,',',pmes_pago,']:',cast(count(*) as char)) as descripcion
    from    sige_run_duplicada
    where   ano_escolar = pano_escolar and
                mes_pago    = pmes_pago;



     delete from sige_run_duplicada_asistencia
     where ano_escolar      = pano_escolar
           and mes_pago     = pmes_pago
           and mes_escolar  = pmes_actual;
        
        insert into sige_run_duplicada_asistencia   
        select sa.mes_pago,sa.mes_escolar,sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur , sa.ano_escolar, sa.sal_run , s.dia1, s.dia2 ,  s.dia3, s.dia4,s.dia5 , s.dia6 , s.dia7 ,s.dia8 ,  s.dia9 , s.dia10, s.dia11 , s.dia12, s.dia13 , s.dia14 ,s.dia15,s.dia16 ,  s.dia17 ,  s.dia18 ,  s.dia19, s.dia20 ,  s.dia21,  s.dia22 ,  s.dia23, s.dia24 ,  s.dia25 , s.dia26 ,  s.dia27  , s.dia28 , s.dia29  ,  s.dia30 , s.dia31 ,  sa.dias_trabajados , sa.asis_promedio ,  sa.estado_declaracion  ,  sa.dias_asistidos, sa.fecha_matricula, sa.regimen_sep,sa.tipo_alumno,sa.orden_matricula,sa.tipo_aula,sa.jecd,sa.cod_ens_subv,sa.cod_gra_subv, sa.monto_subv_normal
        from sige_asistencia_declarada sa, sige_asistencia s, sige_run_duplicada sd
        where   sa.ano_escolar          = pano_escolar
                and sa.mes_escolar      = pmes_actual
                and sa.mes_pago         = pmes_pago
                    
                 and sa.ano_escolar      = s.ano_escolar
                and sa.mes_escolar      = s.mes_escolar
                and sa.rbd              = s.rbd
                and sa.cod_ens          = s.cod_ens
                and sa.cod_gra          = s.cod_gra
                and sa.let_cur          = s.let_cur
                and sa.sal_run          = s.sal_run


                and sa.mes_pago         = sd.mes_pago
                and sa.sal_run          = sd.sal_run 
                and sa.estado_declaracion in (3,2)
                and sa.habilitado_subv  = 1
                and sd.ano_escolar = sa.ano_escolar
               
        order by sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur, sa.orden_matricula;
    

  
    insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
    select   pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('matricula duplicada asistencia [',pano_escolar,',',pmes_pago,']:',cast(count(*) as char)) as descripcion
        from sige_run_duplicada_asistencia
        where ano_escolar       = pano_escolar
              and mes_pago      = pmes_pago
              and mes_escolar   = pmes_actual;
    

        update sige_run_duplicada_asistencia a,
        (
            select sal_run
            from sige_run_duplicada_asistencia
            where   ano_escolar     = pano_escolar 
                    and mes_pago    = pmes_pago 
                    and mes_escolar = pmes_actual 
            group by sal_run
            having  sum(if(dia1=1,1,if(dia1=2,1,0))) > 1 or
                    sum(if(dia2=1,1,if(dia2=2,1,0))) > 1 or
                    sum(if(dia3=1,1,if(dia3=2,1,0))) > 1 or
                    sum(if(dia4=1,1,if(dia4=2,1,0))) > 1 or
                    sum(if(dia5=1,1,if(dia5=2,1,0))) > 1 or
                    sum(if(dia6=1,1,if(dia6=2,1,0))) > 1 or
                    sum(if(dia7=1,1,if(dia7=2,1,0))) > 1 or
                    sum(if(dia8=1,1,if(dia8=2,1,0))) > 1 or
                    sum(if(dia9=1,1,if(dia9=2,1,0))) > 1 or
                    sum(if(dia10=1,1,if(dia10=2,1,0))) > 1 or
                    sum(if(dia11=1,1,if(dia11=2,1,0))) > 1 or
                    sum(if(dia12=1,1,if(dia12=2,1,0))) > 1 or
                    sum(if(dia13=1,1,if(dia13=2,1,0))) > 1 or
                    sum(if(dia14=1,1,if(dia14=2,1,0))) > 1 or
                    sum(if(dia15=1,1,if(dia15=2,1,0))) > 1 or
                    sum(if(dia16=1,1,if(dia16=2,1,0))) > 1 or
                    sum(if(dia17=1,1,if(dia17=2,1,0))) > 1 or
                    sum(if(dia18=1,1,if(dia18=2,1,0))) > 1 or
                    sum(if(dia19=1,1,if(dia19=2,1,0))) > 1 or
                    sum(if(dia20=1,1,if(dia20=2,1,0))) > 1 or
                    sum(if(dia21=1,1,if(dia21=2,1,0))) > 1 or
                    sum(if(dia22=1,1,if(dia22=2,1,0))) > 1 or
                    sum(if(dia23=1,1,if(dia23=2,1,0))) > 1 or
                    sum(if(dia24=1,1,if(dia24=2,1,0))) > 1 or
                    sum(if(dia25=1,1,if(dia25=2,1,0))) > 1 or
                    sum(if(dia26=1,1,if(dia26=2,1,0))) > 1 or
                    sum(if(dia27=1,1,if(dia27=2,1,0))) > 1 or
                    sum(if(dia28=1,1,if(dia28=2,1,0))) > 1 or
                    sum(if(dia29=1,1,if(dia29=2,1,0))) > 1 or
                    sum(if(dia30=1,1,if(dia30=2,1,0))) > 1 or
                    sum(if(dia31=1,1,if(dia31=2,1,0))) > 1
        ) b
        set a.estado_declaracion = 99
        where a.sal_run = b.sal_run and
              a.ano_escolar = pano_escolar and
              a.mes_pago    = pmes_pago  and 
              a.mes_escolar = pmes_actual;




 




end
go

/******************************************************************************************************************
/*      asistencia declarada duplicada 2
/******************************************************************************************************************

call sp_carga_asistencia_declarada_duplicada2(2015,4,3)
go
--drop procedure sp_carga_asistencia_declarada_duplicada2



create procedure sp_carga_asistencia_declarada_duplicada2(in pano_escolar int, in pmes_pago int,in pmes_actual int)
not deterministic
contains sql
begin

    declare done int default false;

    declare crs_intmespago 	smallint;
    declare crs_mes_escolar	smallint;
    declare crs_rbd	integer;
    declare crs_cod_ens	smallint;
    declare crs_cod_gra	smallint;
    declare crs_let_cur	varchar(2) charset utf8 collate utf8_spanish_ci ;
    declare crs_ano_escolar	integer;
    declare crs_sal_run	varchar(20) charset utf8 collate utf8_spanish_ci ;
    declare crs_dia1	smallint;
    declare crs_dia2	smallint;
    declare crs_dia3	smallint;
    declare crs_dia4	smallint;
    declare crs_dia5	smallint;
    declare crs_dia6	smallint;
    declare crs_dia7	smallint;
    declare crs_dia8	smallint;
    declare crs_dia9	smallint;
    declare crs_dia10	smallint;
    declare crs_dia11	smallint;
    declare crs_dia12	smallint;
    declare crs_dia13	smallint;
    declare crs_dia14	smallint;
    declare crs_dia15	smallint;
    declare crs_dia16	smallint;
    declare crs_dia17	smallint;
    declare crs_dia18	smallint;
    declare crs_dia19	smallint;
    declare crs_dia20	smallint;
    declare crs_dia21	smallint;
    declare crs_dia22	smallint;
    declare crs_dia23	smallint;
    declare crs_dia24	smallint;
    declare crs_dia25	smallint;
    declare crs_dia26	smallint;
    declare crs_dia27	smallint;
    declare crs_dia28	smallint;
    declare crs_dia29 	smallint;
    declare crs_dia30	smallint;
    declare crs_dia31	smallint;
    declare crs_dias_trabajados	smallint;
    declare crs_asis_promedio	decimal(10,4);
    declare crs_estado_declaracion	smallint;
    declare crs_dias_asistidos	smallint;
    declare crs_fecha_incorporacion	date;
    declare crs_estado_colision	smallint;
    declare crs_estado_pago	smallint;
    declare crs_contador	integer default 0;
    declare crs_regimen_sep integer;
    declare crs_tipo_alumno integer;
    declare crs_orden_matricula integer;
    declare crs_curso_actual	varchar(30) default '';
    declare crs_curso_aux		varchar(30) default '';
    declare crs_exe smallint;
    declare crs_tipo_aula smallint;
    declare vintalumno_retirado smallint;
    declare vintasistencia_duplicada smallint;
    declare vdiastrabajados_duplicado varchar(250) default '';
    declare crs_aplica_jecd smallint default 0;
    declare crs_cod_ens_subv smallint default 0;
    declare crs_cod_gra_subv smallint default 0;
    declare count_cursor integer default 0 ;
    declare ptotal_asis integer default 0 ;
    declare vfacuse decimal(7,5) default 0 ;
    declare vvaloruse decimal(10,4) default 0 ;
    declare vmonto_subv_normal decimal(10,4) default 0 ;
    declare vdiastrabajados_duplicado_palabra varchar(4000) default '';
    declare vexistenrundup integer default 0 ;



    

    
    declare duplicados cursor for
                  select sa.mes_escolar,sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur , sa.ano_escolar, sa.sal_run , sa.dia1, sa.dia2 ,  sa.dia3, sa.dia4,sa.dia5 , sa.dia6 , sa.dia7 ,sa.dia8 ,  sa.dia9 , sa.dia10, sa.dia11,sa.dia12, sa.dia13 , sa.dia14 ,sa.dia15,sa.dia16 ,  sa.dia17 ,  sa.dia18 ,  sa.dia19, sa.dia20 ,  sa.dia21,  sa.dia22 ,  sa.dia23, sa.dia24 ,  sa.dia25 , sa.dia26 ,  sa.dia27  , sa.dia28 , sa.dia29,sa.dia30 , sa.dia31 ,  sa.dias_trabajados , sa.asis_promedio ,  sa.estado_declaracion  ,  sa.dias_asistidos, sa.fecha_matricula, sa.regimen_sep,sa.tipo_alumno,sa.orden_matricula,sa.tipo_aula,sa.jecd,sa.cod_ens_subv,sa.cod_gra_subv, sa.monto_subv_normal
            from sige_run_duplicada_asistencia sa
            where sa.ano_escolar            = pano_escolar 
			      and sa.mes_escolar        = pmes_actual
                  and sa.mes_pago           = pmes_pago
                  and sa.estado_declaracion = 99
                  --and sa.rbd                = 1
            order by sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur, sa.orden_matricula;

declare continue handler for not found set done = true; 




      open duplicados;
        read_loop_1:loop
                fetch duplicados into  crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run , crs_dia1, crs_dia2 ,  crs_dia3, crs_dia4,crs_dia5 , crs_dia6 , crs_dia7 ,crs_dia8 ,  crs_dia9 , crs_dia10,crs_dia11 , crs_dia12, crs_dia13 , crs_dia14 ,crs_dia15,crs_dia16 ,  crs_dia17 ,  crs_dia18 ,  crs_dia19, crs_dia20 ,  crs_dia21,  crs_dia22 ,  crs_dia23, crs_dia24 ,  crs_dia25 , crs_dia26 ,  crs_dia27, crs_dia28 , crs_dia29  ,  crs_dia30 , crs_dia31 ,  crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,crs_fecha_incorporacion, crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,vmonto_subv_normal; 
                if done then
                    leave read_loop_1;
                end if;

                set vintalumno_retirado = if(crs_dia1=1,1,0)+ if(crs_dia2=1,1,0)+ if(crs_dia3=1,1,0)+ if(crs_dia4=1,1,0)+ if(crs_dia5=1,1,0)+ if(crs_dia6=1,1,0)+ if(crs_dia7=1,1,0)+ if(crs_dia8=1,1,0)+ if(crs_dia9=1,1,0)+ if(crs_dia10=1,1,0)+ if(crs_dia11=1,1,0)+ if(crs_dia12=1,1,0)+ if(crs_dia13=1,1,0)+ if(crs_dia14=1,1,0)+ if(crs_dia15=1,1,0)+ if(crs_dia16=1,1,0)+ if(crs_dia17=1,1,0)+ if(crs_dia18=1,1,0)+ if(crs_dia19=1,1,0)+ if(crs_dia20=1,1,0)+ if(crs_dia21=1,1,0)+ if(crs_dia22=1,1,0)+ if(crs_dia23=1,1,0)+ if(crs_dia24=1,1,0)+ if(crs_dia25=1,1,0)+ if(crs_dia26=1,1,0)+ if(crs_dia27=1,1,0)+ if(crs_dia28=1,1,0)+ if(crs_dia29=1,1,0)+ if(crs_dia30=1,1,0)+ if(crs_dia31=1,1,0);  


                set vintasistencia_duplicada = 0;


                if vintalumno_retirado > 0 then 
                    select if((if(crs_dia1=1,if(sum(d.dia1)>0,1,0),0)+ if(crs_dia2=1,if(sum(d.dia2)>0,1,0),0)+ if(crs_dia3=1,if(sum(d.dia3)>0,1,0),0)+ if(crs_dia4=1,if(sum(d.dia4)>0,1,0),0)+ if(crs_dia5=1,if(sum(d.dia5)>0,1,0),0)+ if(crs_dia6=1,if(sum(d.dia6)>0,1,0),0)+ if(crs_dia7=1,if(sum(d.dia7)>0,1,0),0)+ if(crs_dia8=1,if(sum(d.dia8)>0,1,0),0)+ if(crs_dia9=1,if(sum(d.dia9)>0,1,0),0)+ if(crs_dia10=1,if(sum(d.dia10)>0,1,0),0)+ if(crs_dia11=1,if(sum(d.dia11)>0,1,0),0)+ if(crs_dia12=1,if(sum(d.dia12)>0,1,0),0)+ if(crs_dia13=1,if(sum(d.dia13)>0,1,0),0)+ if(crs_dia14=1,if(sum(d.dia14)>0,1,0),0)+ if(crs_dia15=1,if(sum(d.dia15)>0,1,0),0)+ if(crs_dia16=1,if(sum(d.dia16)>0,1,0),0)+ if(crs_dia17=1,if(sum(d.dia17)>0,1,0),0)+ if(crs_dia18=1,if(sum(d.dia18)>0,1,0),0)+ if(crs_dia19=1,if(sum(d.dia19)>0,1,0),0)+ if(crs_dia20=1,if(sum(d.dia20)>0,1,0),0)+ if(crs_dia21=1,if(sum(d.dia21)>0,1,0),0)+ if(crs_dia22=1,if(sum(dia22)>0,1,0),0)+ if(crs_dia23=1,if(sum(d.dia23)>0,1,0),0)+ if(crs_dia24=1,if(sum(d.dia24)>0,1,0),0)+ if(crs_dia25=1,if(sum(d.dia25)>0,1,0),0)+ if(crs_dia26=1,if(sum(d.dia26)>0,1,0),0)+ if(crs_dia27=1,if(sum(d.dia27)>0,1,0),0)+ if(crs_dia28=1,if(sum(d.dia28)>0,1,0),0)+ if(crs_dia29=1,if(sum(d.dia29)>0,1,0),0)+ if(crs_dia30=1,if(sum(d.dia30)>0,1,0),0)+ if(crs_dia31=1,if(sum(d.dia31)>0,1,0),0))>0,1,0) colision
                    into vintasistencia_duplicada
                    from
                       (select if(a.dia1=1,1,0) dia1,  if(a.dia2=1,1,0) dia2, if(a.dia3=1,1,0) dia3, if(a.dia4=1,1,0) dia4, if(a.dia5=1,1,0) dia5, if(a.dia6=1,1,0) dia6, if(a.dia7=1,1,0) dia7, if(a.dia8=1,1,0) dia8, if(a.dia9=1,1,0) dia9, if(a.dia10=1,1,0) dia10, if(a.dia11=1,1,0) dia11, if(a.dia12=1,1,0) dia12, if(a.dia13=1,1,0) dia13, if(a.dia14=1,1,0) dia14, if(a.dia15=1,1,0) dia15, if(a.dia16=1,1,0) dia16, if(a.dia17=1,1,0) dia17, if(a.dia18=1,1,0) dia18, if(a.dia19=1,1,0) dia19, if(a.dia20=1,1,0) dia20, if(a.dia21=1,1,0) dia21, if(a.dia22=1,1,0) dia22, if(a.dia23=1,1,0) dia23, if(a.dia24=1,1,0) dia24, if(a.dia25=1,1,0) dia25, if(a.dia26=1,1,0) dia26, if(a.dia27=1,1,0) dia27, if(a.dia28=1,1,0) dia28, if(a.dia29=1,1,0) dia29, if(a.dia30=1,1,0) dia30,if(a.dia31=1,1,0) dia31
                        from sige_run_duplicada_asistencia a
                        where a.ano_escolar  = pano_escolar and
                            a.mes_escolar  = pmes_actual and
                            a.mes_pago     = pmes_pago and
                            a.sal_run      = crs_sal_run and
                            a.estado_declaracion = 99 and
                            a.rbd <> crs_rbd
                        ) d;


                end if;  


                       

                if vintasistencia_duplicada > 0 then

                set lc_time_names = 'es_uy';

                 --    insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)
                 --    values (2014,4,3,concat('inserto datos en sige_asistencia_duplicada del rbd-run:',crs_rbd,'-',crs_sal_run));

                     select   concat(if(crs_dia1=1,if(sum(d.dia1)>0,'dia1,',''),'')
                            , if(crs_dia2=1,if(sum(d.dia2)>0,'dia2,',''),'')
                            , if(crs_dia3=1,if(sum(d.dia3)>0,'dia3,',''),'')
                            , if(crs_dia4=1,if(sum(d.dia4)>0,'dia4,',''),'')
                            , if(crs_dia5=1,if(sum(d.dia5)>0,'dia5,',''),'')
                            , if(crs_dia6=1,if(sum(d.dia6)>0,'dia6,',''),'')
                            , if(crs_dia7=1,if(sum(d.dia7)>0,'dia7,',''),'')
                            , if(crs_dia8=1,if(sum(d.dia8)>0,'dia8,',''),'')
                            , if(crs_dia9=1,if(sum(d.dia9)>0,'dia9,',''),'')
                            , if(crs_dia10=1,if(sum(d.dia10)>0,'dia10,',''),'')
                            , if(crs_dia11=1,if(sum(d.dia11)>0,'dia11,',''),'')
                            , if(crs_dia12=1,if(sum(d.dia12)>0,'dia12,',''),'')
                            , if(crs_dia13=1,if(sum(d.dia13)>0,'dia13,',''),'')
                            , if(crs_dia14=1,if(sum(d.dia14)>0,'dia14,',''),'')
                            , if(crs_dia15=1,if(sum(d.dia15)>0,'dia15,',''),'')
                            , if(crs_dia16=1,if(sum(d.dia16)>0,'dia16,',''),'')
                            , if(crs_dia17=1,if(sum(d.dia17)>0,'dia17,',''),'')
                            , if(crs_dia18=1,if(sum(d.dia18)>0,'dia18,',''),'')
                            , if(crs_dia19=1,if(sum(d.dia19)>0,'dia19,',''),'')
                            , if(crs_dia20=1,if(sum(d.dia20)>0,'dia20,',''),'')
                            , if(crs_dia21=1,if(sum(d.dia21)>0,'dia21,',''),'')
                            , if(crs_dia22=1,if(sum(dia22)>0,'dia22,',''),'')
                            , if(crs_dia23=1,if(sum(d.dia23)>0,'dia23,',''),'')
                            , if(crs_dia24=1,if(sum(d.dia24)>0,'dia24,',''),'')
                            , if(crs_dia25=1,if(sum(d.dia25)>0,'dia25,',''),'')
                            , if(crs_dia26=1,if(sum(d.dia26)>0,'dia26,',''),'')
                            , if(crs_dia27=1,if(sum(d.dia27)>0,'dia27,',''),'')
                            , if(crs_dia28=1,if(sum(d.dia28)>0,'dia28,',''),'')
                            , if(crs_dia29=1,if(sum(d.dia29)>0,'dia29,',''),'')
                            , if(crs_dia30=1,if(sum(d.dia30)>0,'dia30,',''),'')
                            , if(crs_dia31=1,if(sum(d.dia31)>0,'dia31',''),'')) dias,
                       concat(if(crs_dia1=1,if(sum(d.dia1)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-01')),' 1,'),''),'')
                            , if(crs_dia2=1,if(sum(d.dia2)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-02')),' 2,'),''),'')
                            , if(crs_dia3=1,if(sum(d.dia3)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-03')),' 3,'),''),'')
                            , if(crs_dia4=1,if(sum(d.dia4)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-04')),' 4,'),''),'')
                            , if(crs_dia5=1,if(sum(d.dia5)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-05')),' 5,'),''),'')
                            , if(crs_dia6=1,if(sum(d.dia6)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-06')),' 6,'),''),'')
                            , if(crs_dia7=1,if(sum(d.dia7)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-07')),' 7,'),''),'')
                            , if(crs_dia8=1,if(sum(d.dia8)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-08')),' 8,'),''),'')
                            , if(crs_dia9=1,if(sum(d.dia9)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-09')),' 9,'),''),'')
                            , if(crs_dia10=1,if(sum(d.dia10)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-10')),' 10,'),''),'')
                            , if(crs_dia11=1,if(sum(d.dia11)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-11')),' 11,'),''),'')
                            , if(crs_dia12=1,if(sum(d.dia12)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-12')),' 12,'),''),'')
                            , if(crs_dia13=1,if(sum(d.dia13)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-13')),' 13,'),''),'')
                            , if(crs_dia14=1,if(sum(d.dia14)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-14')),' 14,'),''),'')
                            , if(crs_dia15=1,if(sum(d.dia15)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-15')),' 15,'),''),'')
                            , if(crs_dia16=1,if(sum(d.dia16)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-16')),' 16,'),''),'')
                            , if(crs_dia17=1,if(sum(d.dia17)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-17')),' 17,'),''),'')
                            , if(crs_dia18=1,if(sum(d.dia18)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-18')),' 18,'),''),'')
                            , if(crs_dia19=1,if(sum(d.dia19)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-19')),' 19,'),''),'')
                            , if(crs_dia20=1,if(sum(d.dia20)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-20')),' 20,'),''),'')
                            , if(crs_dia21=1,if(sum(d.dia21)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-21')),' 21,'),''),'')
                            , if(crs_dia22=1,if(sum(d.dia22)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-22')),' 22,'),''),'')
                            , if(crs_dia23=1,if(sum(d.dia23)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-23')),' 23,'),''),'')
                            , if(crs_dia24=1,if(sum(d.dia24)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-24')),' 24,'),''),'')
                            , if(crs_dia25=1,if(sum(d.dia25)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-25')),' 25,'),''),'')
                            , if(crs_dia26=1,if(sum(d.dia26)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-26')),' 26,'),''),'')
                            , if(crs_dia27=1,if(sum(d.dia27)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-27')),' 27,'),''),'')
                            , if(crs_dia28=1,if(sum(d.dia28)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-28')),' 28,'),''),'')
                            , if(crs_dia29=1,if(sum(d.dia29)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-29')),' 29,'),''),'')
                            , if(crs_dia30=1,if(sum(d.dia30)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-30')),' 30,'),''),'')
                            , if(crs_dia31=1,if(sum(d.dia31)>0,concat(dayname(concat(cast(pano_escolar as char(4)),'-',cast(pmes_actual as char(2)),'-31')),' 31,'),''),'')) dias_palabra
                    into vdiastrabajados_duplicado,vdiastrabajados_duplicado_palabra
                    from
                       (select if(a.dia1=1,1,0) dia1,  if(a.dia2=1,1,0) dia2, if(a.dia3=1,1,0) dia3, if(a.dia4=1,1,0) dia4, if(a.dia5=1,1,0) dia5, if(a.dia6=1,1,0) dia6, if(a.dia7=1,1,0) dia7, if(a.dia8=1,1,0) dia8, if(a.dia9=1,1,0) dia9, if(a.dia10=1,1,0) dia10, if(a.dia11=1,1,0) dia11, if(a.dia12=1,1,0) dia12, if(a.dia13=1,1,0) dia13, if(a.dia14=1,1,0) dia14, if(a.dia15=1,1,0) dia15, if(a.dia16=1,1,0) dia16, if(a.dia17=1,1,0) dia17, if(a.dia18=1,1,0) dia18, if(a.dia19=1,1,0) dia19, if(a.dia20=1,1,0) dia20, if(a.dia21=1,1,0) dia21, if(a.dia22=1,1,0) dia22, if(a.dia23=1,1,0) dia23, if(a.dia24=1,1,0) dia24, if(a.dia25=1,1,0) dia25, if(a.dia26=1,1,0) dia26, if(a.dia27=1,1,0) dia27, if(a.dia28=1,1,0) dia28, if(a.dia29=1,1,0) dia29, if(a.dia30=1,1,0) dia30,if(a.dia31=1,1,0) dia31
                        from sige_run_duplicada_asistencia a
                        where a.ano_escolar  = pano_escolar and
                            a.mes_escolar  = pmes_actual and
                            a.mes_pago     = pmes_pago and
                            a.sal_run      = crs_sal_run and
                            a.estado_declaracion = 99 and
                            a.rbd <> crs_rbd
                        ) d;



                    insert into sige_asistencia_duplicada(id, ano_escolar,mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur, sal_run, dias_trabajados, asis_promedio, estado_declaracion, dias_asistidos, estado,dias_trabajados_palabra )
                    select uuid(),crs_ano_escolar,pmes_pago,crs_mes_escolar,crs_rbd,crs_cod_ens,crs_cod_gra, crs_let_cur,crs_sal_run,vdiastrabajados_duplicado,crs_asis_promedio,crs_estado_declaracion,crs_dias_asistidos,1,vdiastrabajados_duplicado_palabra;
                    

                    update sige_asistencia_declarada 
					set estado_pago = 3, 
                        estado_colision = vintasistencia_duplicada
					where ano_escolar = crs_ano_escolar
					and mes_pago = pmes_pago
					and mes_escolar = pmes_actual
					and rbd = crs_rbd
					and cod_ens = crs_cod_ens
					and cod_gra =crs_cod_gra
					and let_cur = crs_let_cur
					and sal_run = crs_sal_run
                    and estado_pago <> 4;

                else
                    set vintasistencia_duplicada = 0;
                end if;

       

        end loop;
      close duplicados;



end
go







/******************************************************************************************************************
/*      ordena lista curso para cursos con màs de 45 alumnos
/******************************************************************************************************************

call sp_ordena_lista_curso_asistencia_declarada(2014,8,3,999999)
go
--drop procedure sp_ordena_lista_curso_asistencia_declarada
--go

create procedure `sp_ordena_lista_curso_asistencia_declarada` (in pano_escolar int, in pmes_pago int,in pmes_actual int,in prbd int)
not deterministic
contains sql
begin



	declare v_ano_escolar,v_mes_pago,v_mes_escolar,v_rbd,v_cod_ens,v_cod_gra int;
	declare v_let_cur varchar(2) charset utf8 collate utf8_spanish_ci ;
	declare done int default false;


    
    
    declare cursos45  cursor for
			select ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur
			    from sige_asistencia_declarada 
			    where ano_escolar 	= pano_escolar
			    and mes_pago 		= pmes_pago
			    and mes_escolar 	= pmes_actual
                and (rbd = prbd or prbd = 0)                
			    group by ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur
			    having count(*)>45 or
                       (count(*) <= 45 and max(orden_matricula)>45);
		declare continue handler for not found set done = true;


        delete from  tmp_ordena_lista;
       
      
		open cursos45;
		read_loop_1: loop
				fetch cursos45 into v_ano_escolar,v_mes_pago,v_mes_escolar,v_rbd,v_cod_ens,v_cod_gra,v_let_cur; 
					if done then
						leave read_loop_1;
					end if;


					
                    insert into tmp_ordena_lista
					select sad.ano_escolar,sad.mes_pago,sad.mes_escolar,sad.rbd,sad.cod_ens,sad.cod_gra,sad.let_cur,sad.sal_run ,sad.orden_matricula, @row_number := @row_number + 1 orden_final
                        from sige_asistencia_declarada sad ,  (select @row_number:=0) r
                        where sad.ano_escolar = v_ano_escolar
                        and sad.mes_pago = v_mes_pago
                        and sad.mes_escolar = v_mes_escolar
                        and sad.rbd = v_rbd
                        and sad.cod_ens = v_cod_ens
                        and sad.cod_gra = v_cod_gra
                        and sad.let_cur = v_let_cur
                        order by sad.ano_escolar,sad.mes_pago,sad.mes_escolar,sad.rbd,sad.cod_ens,sad.cod_gra,sad.let_cur, sad.orden_matricula asc;

                     end loop read_loop_1;
        close cursos45;

        optimize table tmp_ordena_lista;

        update  sige_asistencia_declarada s, tmp_ordena_lista t
        set     s.orden_matricula = t.orden_final,
                s.estado_pago = if(t.orden_final > 45,2,1)
        where   s.ano_escolar = t.ano_escolar and
                s.mes_pago    = t.mes_pago and
                s.mes_escolar = t.mes_escolar and
                s.rbd         = t.rbd and
                s.cod_ens     = t.cod_ens and
                s.cod_gra     = t.cod_gra and
                s.let_cur     = t.let_cur and
                s.sal_run     = t.sal_run and
                s.estado_pago <> 4;


        insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
        select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('n? de registros procesados:',cast(count(*) as char)) as descripcion
        from tmp_ordena_lista;

end





/******************************************************************************************************************
/*      excedente día. cursos con asistencia > 45, set estado_pago = 1 (curso completo, no considera run con estado_pago = 4)
/******************************************************************************************************************

--call sp_proceso_asistencia_excedente_dia(2014,5,4,0)

-- drop procedure sp_proceso_asistencia_excedente_dia

create procedure sp_proceso_asistencia_excedente_dia (in pano_escolar int, in pmes_pago int,in pmes_actual int,in prbd int)
not deterministic
contains sql
begin

	drop table if exists temp1;
        create temporary table temp1 engine=memory as(
            select  distinct ano_escolar, mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur 
            from sige_asistencia_declarada
            where ano_escolar = pano_escolar 
            and   mes_pago    = pmes_pago
            and   mes_escolar = pmes_actual
            and   estado_pago = 2
            and   habilitado_subv = 1
            and   estado_declaracion in (3,2)
            and (rbd = prbd or prbd = 0)
            
        );
        
        create index  idx_tmp on temp1(ano_escolar, mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur);

        insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
        select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('n? de cursos con estado_pago(2):',cast(count(*) as char)) as descripcion
        from temp1;

        drop table if exists temp2;
        create temporary table temp2 engine=memory as(
            select s.ano_escolar, s.mes_pago, s.mes_escolar,s.rbd,s.cod_ens,s.cod_gra,s.let_cur
            from  temp1 b ,   sige_asistencia_declarada s ,sige_asistencia a 
            where       b.ano_escolar       = s.ano_escolar
                        and   b.mes_pago    = s.mes_pago
                        and   b.mes_escolar = s.mes_escolar
                        and   b.rbd         = s.rbd
                        and   b.cod_ens     = s.cod_ens
                        and   b.cod_gra     = s.cod_gra
                        and   b.let_cur     = s.let_cur

                        and   s.ano_escolar = a.ano_escolar
                        and   s.mes_escolar = a.mes_escolar
                        and   s.rbd         = a.rbd
                        and   s.cod_ens     = a.cod_ens
                        and   s.cod_gra     = a.cod_gra
                        and   s.let_cur     = a.let_cur
                        and   s.sal_run     = a.sal_run

                        
                        and   s.estado_pago <> 4
                        and   s.habilitado_subv = 1
                        and   s.estado_declaracion in (3,2)
            group by s.mes_pago,s.mes_escolar,s.rbd,s.cod_ens,s.cod_gra,s.let_cur
            having  sign(1+sign(((sum(if(a.dia1=1,1,if(a.dia1=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia2=1,1,if(a.dia2=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia3=1,1,if(a.dia3=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia4=1,1,if(a.dia4=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia5=1,1,if(a.dia5=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia6=1,1,if(a.dia6=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia7=1,1,if(a.dia7=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia8=1,1,if(a.dia8=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia9=1,1,if(a.dia9=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia10=1,1,if(a.dia10=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia11=1,1,if(a.dia11=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia12=1,1,if(a.dia12=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia13=1,1,if(a.dia13=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia14=1,1,if(a.dia14=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia15=1,1,if(a.dia15=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia16=1,1,if(a.dia16=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia17=1,1,if(a.dia17=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia18=1,1,if(a.dia18=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia19=1,1,if(a.dia19=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia20=1,1,if(a.dia20=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia21=1,1,if(a.dia21=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia22=1,1,if(a.dia22=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia23=1,1,if(a.dia23=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia24=1,1,if(a.dia24=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia25=1,1,if(a.dia25=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia26=1,1,if(a.dia26=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia27=1,1,if(a.dia27=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia28=1,1,if(a.dia28=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia29=1,1,if(a.dia29=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia30=1,1,if(a.dia30=2,1,0))))-46)))+
                    sign(1+sign(((sum(if(a.dia31=1,1,if(a.dia31=2,1,0))))-46))) = 0

        );

         create index  idx_t on temp2(ano_escolar,mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur);


        insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
        select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('nº de cursos sin excedente:',cast(count(*) as char)) as descripcion
        from temp2;


        update sige_asistencia_declarada a, temp2 b
        set estado_pago = 1
        where   a.estado_pago = 2 and
                a.ano_escolar = b.ano_escolar and
                a.mes_pago = b.mes_pago and
                a.mes_escolar = b.mes_escolar and
                a.rbd = b.rbd and
                a.cod_ens = b.cod_ens and
                a.cod_gra = b.cod_gra and
                a.let_cur = b.let_cur;

    

end

go




/******************************************************************************************************************
/*      asistencia declarada pie 299
/******************************************************************************************************************

--call sp_carga_asistencia_declarada_pie_299(2015,7,4,0)
--drop procedure sp_carga_asistencia_declarada_pie_299
go

create procedure sp_carga_asistencia_declarada_pie_299(in intanio int, in intmespago int,in intmesescolar int, in intrbd integer)
not deterministic
contains sql
begin

    declare done int default false;

    declare crs_intmespago 	smallint;
    declare crs_mes_escolar	smallint;
    declare crs_rbd	integer;
    declare crs_cod_ens	smallint;
    declare crs_cod_gra	smallint;
    declare crs_let_cur	varchar(2);
    declare crs_ano_escolar	integer;
    declare crs_sal_run	varchar(20);
    declare crs_dia1	smallint;
    declare crs_dia2	smallint;
    declare crs_dia3	smallint;
    declare crs_dia4	smallint;
    declare crs_dia5	smallint;
    declare crs_dia6	smallint;
    declare crs_dia7	smallint;
    declare crs_dia8	smallint;
    declare crs_dia9	smallint;
    declare crs_dia10	smallint;
    declare crs_dia11	smallint;
    declare crs_dia12	smallint;
    declare crs_dia13	smallint;
    declare crs_dia14	smallint;
    declare crs_dia15	smallint;
    declare crs_dia16	smallint;
    declare crs_dia17	smallint;
    declare crs_dia18	smallint;
    declare crs_dia19	smallint;
    declare crs_dia20	smallint;
    declare crs_dia21	smallint;
    declare crs_dia22	smallint;
    declare crs_dia23	smallint;
    declare crs_dia24	smallint;
    declare crs_dia25	smallint;
    declare crs_dia26	smallint;
    declare crs_dia27	smallint;
    declare crs_dia28	smallint;
    declare crs_dia29 	smallint;
    declare crs_dia30	smallint;
    declare crs_dia31	smallint;
    declare crs_dias_trabajados	smallint;
    declare crs_asis_promedio	decimal(10,4);
    declare crs_estado_declaracion	smallint;
    declare crs_dias_asistidos	smallint;
    declare crs_fecha_incorporacion	date;
    declare crs_estado_colision	smallint;
    declare crs_estado_pago	smallint;
    declare crs_contador	integer default 0;
    declare crs_regimen_sep integer;
    declare crs_tipo_alumno integer;
    declare crs_orden_matricula integer;
    declare crs_curso_actual	varchar(30) default '';
    declare crs_curso_aux		varchar(30) default '';
    declare crs_exe smallint;
    declare crs_tipo_aula smallint;
    declare vintalumno_retirado smallint;
    declare vintasistencia_duplicada smallint;
    declare vdiastrabajados_duplicado varchar(250) default '';
    declare crs_aplica_jecd smallint default 0;
    declare crs_cod_ens_subv smallint default 0;
    declare crs_cod_gra_subv smallint default 0;
    declare count_cursor integer default 0 ;
    declare ptotal_asis integer default 0 ;
    declare vfacuse decimal(7,5) default 0 ;
    declare vvaloruse decimal(10,4) default 0 ;
    declare vdiastrabajados_duplicado_palabra varchar(4000);
    declare vmaxcurso integer default 0;
    declare estado_pago integer default 0;
    declare crs_monto_subv_normal integer default 0;


    declare cursor_asistencia cursor for
                  select sa.mes_escolar,sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur , sa.ano_escolar, sa.sal_run , s.dia1, s.dia2 ,  s.dia3, s.dia4,s.dia5 , s.dia6 , s.dia7 ,s.dia8 ,  s.dia9 , s.dia10, s.dia11 , s.dia12, s.dia13 , s.dia14 ,s.dia15,s.dia16 ,  s.dia17 ,  s.dia18 ,  s.dia19, s.dia20 ,  s.dia21,  s.dia22 ,  s.dia23, s.dia24 ,  s.dia25 , s.dia26 ,  s.dia27  , s.dia28 , s.dia29  ,  s.dia30 , s.dia31 ,  sa.dias_trabajados , sa.asis_promedio ,  sa.estado_declaracion  ,  sa.dias_asistidos, sa.fecha_matricula, sa.regimen_sep,sa.tipo_alumno,sa.orden_matricula,sa.tipo_aula,sa.jecd,sa.cod_ens_subv,sa.cod_gra_subv,sa.monto_subv_normal,sa.estado_colision,sa.estado_pago, sa.asis_promedio
                        from  sige_asistencia_declarada sa, sige_asistencia s
                        where   sa.ano_escolar  = intanio
                                and sa.estado_pago  = 1
                                and sa.mes_pago     = intmespago
                                and sa.cod_ens      = 299
                                and sa.mes_escolar  = intmesescolar
                                and sa.habilitado_subv = 1
                                and sa.estado_declaracion in (2,3)

                                and sa.ano_escolar   = s.ano_escolar 
                                and sa.mes_escolar   = s.mes_escolar 
                                and sa.rbd           = s.rbd 
                                and sa.cod_ens       = s.cod_ens 
                                 and sa.cod_gra       = s.cod_gra 
                                and sa.let_cur       = s.let_cur 
                                and sa.sal_run       = s.sal_run 
                                and (sa.rbd,sa.sal_run) in (select sp.rbd,sp.sal_run 
                                                            from sige_pie_alumnos_uns sp 
                                                            where sp.ano_escolar = intanio and mes_pago = intmespago  and sp.estado = 1 and sp.convenio = 1)
                                                
                           
                        order by sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur,sa.orden_matricula;

    declare continue handler for not found set done = true; 

    open cursor_asistencia;
        read_loop_1:loop

             fetch cursor_asistencia into crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run , crs_dia1, crs_dia2 ,  crs_dia3, crs_dia4,crs_dia5 , crs_dia6 , crs_dia7 ,crs_dia8 ,  crs_dia9 , crs_dia10, crs_dia11 , crs_dia12, crs_dia13 , crs_dia14 ,crs_dia15,crs_dia16 ,  crs_dia17 ,  crs_dia18 ,  crs_dia19, crs_dia20 ,  crs_dia21,  crs_dia22 ,  crs_dia23, crs_dia24 ,  crs_dia25 , crs_dia26 ,  crs_dia27  , crs_dia28 , crs_dia29  ,  crs_dia30 , crs_dia31 ,  crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,crs_fecha_incorporacion, crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,crs_monto_subv_normal,vintasistencia_duplicada,crs_estado_pago,crs_asis_promedio; 

             if done then
                    leave read_loop_1;
             end if;
   
             set crs_curso_actual = concat(cast(crs_rbd as char),cast(crs_cod_ens as char),cast(crs_cod_gra as char),cast(crs_let_cur as char));
			
           set vintalumno_retirado =  if(crs_dia1=-3,0,1)+ if(crs_dia2=-3,0,1)+ if(crs_dia3=-3,0,1)+ if(crs_dia4=-3,0,1)+ if(crs_dia5=-3,0,1)+ if(crs_dia6=-3,0,1)+ if(crs_dia7=-3,0,1)+ if(crs_dia8=-3,0,1)+ if(crs_dia9=-3,0,1)+if(crs_dia10=-3,0,1)+if(crs_dia11=-3,0,1)+if(crs_dia12=-3,0,1)+if(crs_dia13=-3,0,1)+if(crs_dia14=-3,0,1)+if(crs_dia15=-3,0,1)+if(crs_dia16=-3,0,1)+if(crs_dia17=-3,0,1)+if(crs_dia18=-3,0,1)+if(crs_dia19=-3,0,1)+if(crs_dia20=-3,0,1)+if(crs_dia21=-3,0,1)+if(crs_dia22=-3,0,1)+if(crs_dia23=-3,0,1)+if(crs_dia24=-3,0,1)+if(crs_dia25=-3,0,1)+if(crs_dia26=-3,0,1)+if(crs_dia27=-3,0,1)+if(crs_dia28=-3,0,1)+if(crs_dia29=-3,0,1)+if(crs_dia30=-3,0,1)+if(crs_dia31=-3,0,if(crs_dia31=99,0,1)); 

           if (vintalumno_retirado > 0)then
                    if(crs_cod_ens = 299)then
                        set vmaxcurso = 15;
                    else
                        set vmaxcurso = 45;
                    end if;

                    if(crs_exe <= vmaxcurso )then
					insert into sige_asistencia_declarada_pie(mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur, ano_escolar, sal_run, dia1, dia2, dia3, dia4, dia5, dia6, dia7, dia8, dia9, dia10, dia11, dia12, dia13, dia14, dia15, dia16, dia17, dia18, dia19, dia20, dia21, dia22, dia23, dia24, dia25, dia26, dia27, dia28, dia29, dia30, dia31, dias_trabajados, asis_promedio, estado_declaracion, dias_asistidos, estado_pago, fecha_matricula, estado_colision,regimen_sep,tipo_alumno,orden_matricula,tipo_aula,jecd,cod_ens_subv,cod_gra_subv,monto_subv_normal)
					values (intmespago,crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run , crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,1, crs_fecha_incorporacion, vintasistencia_duplicada,crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,crs_monto_subv_normal);			
                    else
					insert into sige_asistencia_declarada_pie(mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur, ano_escolar, sal_run, dias_trabajados, asis_promedio, estado_declaracion, dias_asistidos, estado_pago, fecha_matricula, estado_colision,regimen_sep,tipo_alumno,orden_matricula,tipo_aula,jecd,cod_ens_subv,cod_gra_subv,monto_subv_normal)
					values (intmespago,crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run ,   crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,2 , crs_fecha_incorporacion, vintasistencia_duplicada,crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,crs_monto_subv_normal);						
                    end if;

           end if;
			
           set crs_curso_aux 	= concat(cast(crs_rbd as char),cast(crs_cod_ens as char),cast(crs_cod_gra as char),cast(crs_let_cur as char));
		   set crs_exe          = crs_exe + 1;
		   set crs_contador     = crs_contador +1;


        end loop;
    close cursor_asistencia;

end




/******************************************************************************************************************
/*      marca tipo aula = 2
/******************************************************************************************************************

call sp_extraccion_tipo_aula(2014,8,3)

--drop procedure sp_extraccion_tipo_aula
go



create procedure sp_extraccion_tipo_aula(in pano_escolar int, in pmes_pago int,in pmes_actual int)
not deterministic
contains sql
begin

	drop table if exists temp1;
        create temporary table temp1 engine=memory as(
            select sec.ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,sec.rbd,sec.cod_ens,sec.cod_gra,sec.let_cur,sec.tipo_aula
            from sige_estructura_curso  sec
            where ano_escolar = pano_escolar
                and tipo_aula = 2
                and sec.rbd < 60000
        );

    create index  idx_tmp on temp1(ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur);


       
       update  sige_asistencia_declarada a,temp1 b
       set a.tipo_aula = 2
       where a.ano_escolar = b.ano_escolar and
            a.mes_pago = b.mes_pago and
            a.rbd = b.rbd and
            a.cod_ens = b.cod_ens and
            a.cod_gra = b.cod_gra and
            a.let_cur = b.let_cur and
            a.ano_escolar = pano_escolar and
            a.mes_pago = pmes_pago and
            a.mes_escolar = pmes_actual
;

    select count(*)
    from sige_asistencia_declarada
    where ano_escolar   = pano_escolar and
          mes_pago      = pmes_pago and
          mes_escolar   = pmes_actual and
          tipo_aula = 2;
    

end


/******************************************************************************************************************
/*      habilitado subvenciones
/******************************************************************************************************************


--drop procedure sp_extraccion_habilitado_subv
go

--call sp_extraccion_habilitado_subv(2015,4,3); 
go

create procedure sp_extraccion_habilitado_subv(in pano_escolar int, in pmes_pago int,in pmes_actual int)
not deterministic
contains sql
begin

	drop table if exists temp1;
        create temporary table temp1 engine=memory as(
            select distinct sad.ano_escolar, sad.mes_pago, sad.mes_escolar, sad.rbd,sad.cod_ens,sad.cod_gra,sad.let_cur,sec.habilitado_subv
            from sige_asistencia_declarada sad inner join sige_estructura_curso sec
                                                        on sad.ano_escolar = sec.ano_escolar
                                                        and sad.rbd = sec.rbd
                                                        and sad.cod_ens = sec.cod_ens
                                                        and sad.cod_gra = sec.cod_gra
                                                         and trim(sad.let_cur) = trim(sec.let_cur)
                                                        and (sec.estado_habilitacion = 99 or (sec.estado_habilitacion in (0,1) and sec.habilitado_subv = 0))
            where sad.ano_escolar = pano_escolar
            and sad.mes_pago 	  = pmes_pago
            and sad.mes_escolar   = pmes_actual 
        );

        create index  idx_tmp on temp1(ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur);


       
       update  sige_asistencia_declarada a,temp1 b
       set a.habilitado_subv = b.habilitado_subv
       where a.ano_escolar = b.ano_escolar and
            a.mes_pago = b.mes_pago and
            a.rbd = b.rbd and
            a.cod_ens = b.cod_ens and
            a.cod_gra = b.cod_gra and
            a.let_cur = b.let_cur and
            a.ano_escolar = pano_escolar and
            a.mes_pago = pmes_pago and
            a.mes_escolar = pmes_actual
;

   
    

end


