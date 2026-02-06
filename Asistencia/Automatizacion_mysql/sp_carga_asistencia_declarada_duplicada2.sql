
-- call sp_carga_asistencia_declarada_duplicada2(2014,4,3)


drop procedure sp_carga_asistencia_declarada_duplicada2
go

CREATE PROCEDURE sp_carga_asistencia_declarada_duplicada2(in pano_escolar int, in pmes_pago int,in pmes_actual int)
NOT DETERMINISTIC
CONTAINS SQL
begin

    declare done int default false;

    declare crs_intmespago 	smallint;
    declare crs_mes_escolar	smallint;
    declare crs_rbd	integer;
    declare crs_cod_ens	smallint;
    declare crs_cod_gra	smallint;
    declare crs_let_cur	varchar(2) CHARSET utf8 COLLATE utf8_spanish_ci ;
    declare crs_ano_escolar	integer;
    declare crs_sal_run	varchar(20) CHARSET utf8 COLLATE utf8_spanish_ci ;
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
                    select if((if(crs_dia1=1,if(sum(D.dia1)>0,1,0),0)+ if(crs_dia2=1,if(sum(D.dia2)>0,1,0),0)+ if(crs_dia3=1,if(sum(D.dia3)>0,1,0),0)+ if(crs_dia4=1,if(sum(D.dia4)>0,1,0),0)+ if(crs_dia5=1,if(sum(D.dia5)>0,1,0),0)+ if(crs_dia6=1,if(sum(D.dia6)>0,1,0),0)+ if(crs_dia7=1,if(sum(D.dia7)>0,1,0),0)+ if(crs_dia8=1,if(sum(D.dia8)>0,1,0),0)+ if(crs_dia9=1,if(sum(D.dia9)>0,1,0),0)+ if(crs_dia10=1,if(sum(D.dia10)>0,1,0),0)+ if(crs_dia11=1,if(sum(D.dia11)>0,1,0),0)+ if(crs_dia12=1,if(sum(D.dia12)>0,1,0),0)+ if(crs_dia13=1,if(sum(D.dia13)>0,1,0),0)+ if(crs_dia14=1,if(sum(D.dia14)>0,1,0),0)+ if(crs_dia15=1,if(sum(D.dia15)>0,1,0),0)+ if(crs_dia16=1,if(sum(D.dia16)>0,1,0),0)+ if(crs_dia17=1,if(sum(D.dia17)>0,1,0),0)+ if(crs_dia18=1,if(sum(D.dia18)>0,1,0),0)+ if(crs_dia19=1,if(sum(D.dia19)>0,1,0),0)+ if(crs_dia20=1,if(sum(D.dia20)>0,1,0),0)+ if(crs_dia21=1,if(sum(D.dia21)>0,1,0),0)+ if(crs_dia22=1,if(sum(dia22)>0,1,0),0)+ if(crs_dia23=1,if(sum(D.dia23)>0,1,0),0)+ if(crs_dia24=1,if(sum(D.dia24)>0,1,0),0)+ if(crs_dia25=1,if(sum(D.dia25)>0,1,0),0)+ if(crs_dia26=1,if(sum(D.dia26)>0,1,0),0)+ if(crs_dia27=1,if(sum(D.dia27)>0,1,0),0)+ if(crs_dia28=1,if(sum(D.dia28)>0,1,0),0)+ if(crs_dia29=1,if(sum(D.dia29)>0,1,0),0)+ if(crs_dia30=1,if(sum(D.dia30)>0,1,0),0)+ if(crs_dia31=1,if(sum(D.dia31)>0,1,0),0))>0,1,0) colision
                    into vintasistencia_duplicada
                    from
                       (select if(A.dia1=1,1,0) dia1,  if(A.dia2=1,1,0) dia2, if(A.dia3=1,1,0) dia3, if(A.dia4=1,1,0) dia4, if(A.dia5=1,1,0) dia5, if(A.dia6=1,1,0) dia6, if(A.dia7=1,1,0) dia7, if(A.dia8=1,1,0) dia8, if(A.dia9=1,1,0) dia9, if(A.dia10=1,1,0) dia10, if(A.dia11=1,1,0) dia11, if(A.dia12=1,1,0) dia12, if(A.dia13=1,1,0) dia13, if(A.dia14=1,1,0) dia14, if(A.dia15=1,1,0) dia15, if(A.dia16=1,1,0) dia16, if(A.dia17=1,1,0) dia17, if(A.dia18=1,1,0) dia18, if(A.dia19=1,1,0) dia19, if(A.dia20=1,1,0) dia20, if(A.dia21=1,1,0) dia21, if(A.dia22=1,1,0) dia22, if(A.dia23=1,1,0) dia23, if(A.dia24=1,1,0) dia24, if(A.dia25=1,1,0) dia25, if(A.dia26=1,1,0) dia26, if(A.dia27=1,1,0) dia27, if(A.dia28=1,1,0) dia28, if(A.dia29=1,1,0) dia29, if(A.dia30=1,1,0) dia30,if(A.dia31=1,1,0) dia31
                        from sige_run_duplicada_asistencia A
                        where A.ano_escolar  = pano_escolar and
                            A.mes_escolar  = pmes_actual and
                            A.mes_pago     = pmes_pago and
                            A.sal_run      = crs_sal_run and
                            A.estado_declaracion = 99 and
                            A.rbd <> crs_rbd
                        ) D;


                end if;  


                       

                if vintasistencia_duplicada > 0 then

                SET lc_time_names = 'es_UY';

                 --    insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)
                 --    values (2014,4,3,concat('inserto datos en sige_asistencia_duplicada del rbd-run:',crs_rbd,'-',crs_sal_run));

                     select   concat(if(crs_dia1=1,if(sum(D.dia1)>0,'dia1,',''),'')
                            , if(crs_dia2=1,if(sum(D.dia2)>0,'dia2,',''),'')
                            , if(crs_dia3=1,if(sum(D.dia3)>0,'dia3,',''),'')
                            , if(crs_dia4=1,if(sum(D.dia4)>0,'dia4,',''),'')
                            , if(crs_dia5=1,if(sum(D.dia5)>0,'dia5,',''),'')
                            , if(crs_dia6=1,if(sum(D.dia6)>0,'dia6,',''),'')
                            , if(crs_dia7=1,if(sum(D.dia7)>0,'dia7,',''),'')
                            , if(crs_dia8=1,if(sum(D.dia8)>0,'dia8,',''),'')
                            , if(crs_dia9=1,if(sum(D.dia9)>0,'dia9,',''),'')
                            , if(crs_dia10=1,if(sum(D.dia10)>0,'dia10,',''),'')
                            , if(crs_dia11=1,if(sum(D.dia11)>0,'dia11,',''),'')
                            , if(crs_dia12=1,if(sum(D.dia12)>0,'dia12,',''),'')
                            , if(crs_dia13=1,if(sum(D.dia13)>0,'dia13,',''),'')
                            , if(crs_dia14=1,if(sum(D.dia14)>0,'dia14,',''),'')
                            , if(crs_dia15=1,if(sum(D.dia15)>0,'dia15,',''),'')
                            , if(crs_dia16=1,if(sum(D.dia16)>0,'dia16,',''),'')
                            , if(crs_dia17=1,if(sum(D.dia17)>0,'dia17,',''),'')
                            , if(crs_dia18=1,if(sum(D.dia18)>0,'dia18,',''),'')
                            , if(crs_dia19=1,if(sum(D.dia19)>0,'dia19,',''),'')
                            , if(crs_dia20=1,if(sum(D.dia20)>0,'dia20,',''),'')
                            , if(crs_dia21=1,if(sum(D.dia21)>0,'dia21,',''),'')
                            , if(crs_dia22=1,if(sum(dia22)>0,'dia22,',''),'')
                            , if(crs_dia23=1,if(sum(D.dia23)>0,'dia23,',''),'')
                            , if(crs_dia24=1,if(sum(D.dia24)>0,'dia24,',''),'')
                            , if(crs_dia25=1,if(sum(D.dia25)>0,'dia25,',''),'')
                            , if(crs_dia26=1,if(sum(D.dia26)>0,'dia26,',''),'')
                            , if(crs_dia27=1,if(sum(D.dia27)>0,'dia27,',''),'')
                            , if(crs_dia28=1,if(sum(D.dia28)>0,'dia28,',''),'')
                            , if(crs_dia29=1,if(sum(D.dia29)>0,'dia29,',''),'')
                            , if(crs_dia30=1,if(sum(D.dia30)>0,'dia30,',''),'')
                            , if(crs_dia31=1,if(sum(D.dia31)>0,'dia31',''),'')) dias,
                       concat(if(crs_dia1=1,if(sum(D.dia1)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-01')),' 1,'),''),'')
                            , if(crs_dia2=1,if(sum(D.dia2)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-02')),' 2,'),''),'')
                            , if(crs_dia3=1,if(sum(D.dia3)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-03')),' 3,'),''),'')
                            , if(crs_dia4=1,if(sum(D.dia4)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-04')),' 4,'),''),'')
                            , if(crs_dia5=1,if(sum(D.dia5)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-05')),' 5,'),''),'')
                            , if(crs_dia6=1,if(sum(D.dia6)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-06')),' 6,'),''),'')
                            , if(crs_dia7=1,if(sum(D.dia7)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-07')),' 7,'),''),'')
                            , if(crs_dia8=1,if(sum(D.dia8)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-08')),' 8,'),''),'')
                            , if(crs_dia9=1,if(sum(D.dia9)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-09')),' 9,'),''),'')
                            , if(crs_dia10=1,if(sum(D.dia10)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-10')),' 10,'),''),'')
                            , if(crs_dia11=1,if(sum(D.dia11)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-11')),' 11,'),''),'')
                            , if(crs_dia12=1,if(sum(D.dia12)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-12')),' 12,'),''),'')
                            , if(crs_dia13=1,if(sum(D.dia13)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-13')),' 13,'),''),'')
                            , if(crs_dia14=1,if(sum(D.dia14)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-14')),' 14,'),''),'')
                            , if(crs_dia15=1,if(sum(D.dia15)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-15')),' 15,'),''),'')
                            , if(crs_dia16=1,if(sum(D.dia16)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-16')),' 16,'),''),'')
                            , if(crs_dia17=1,if(sum(D.dia17)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-17')),' 17,'),''),'')
                            , if(crs_dia18=1,if(sum(D.dia18)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-18')),' 18,'),''),'')
                            , if(crs_dia19=1,if(sum(D.dia19)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-19')),' 19,'),''),'')
                            , if(crs_dia20=1,if(sum(D.dia20)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-20')),' 20,'),''),'')
                            , if(crs_dia21=1,if(sum(D.dia21)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-21')),' 21,'),''),'')
                            , if(crs_dia22=1,if(sum(D.dia22)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-22')),' 22,'),''),'')
                            , if(crs_dia23=1,if(sum(D.dia23)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-23')),' 23,'),''),'')
                            , if(crs_dia24=1,if(sum(D.dia24)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-24')),' 24,'),''),'')
                            , if(crs_dia25=1,if(sum(D.dia25)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-25')),' 25,'),''),'')
                            , if(crs_dia26=1,if(sum(D.dia26)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-26')),' 26,'),''),'')
                            , if(crs_dia27=1,if(sum(D.dia27)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-27')),' 27,'),''),'')
                            , if(crs_dia28=1,if(sum(D.dia28)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-28')),' 28,'),''),'')
                            , if(crs_dia29=1,if(sum(D.dia29)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-29')),' 29,'),''),'')
                            , if(crs_dia30=1,if(sum(D.dia30)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-30')),' 30,'),''),'')
                            , if(crs_dia31=1,if(sum(D.dia31)>0,concat(dayname(concat(cast(pano_escolar AS CHAR(4)),'-',cast(pmes_actual as char(2)),'-31')),' 31,'),''),'')) dias_palabra
                    into vdiastrabajados_duplicado,vdiastrabajados_duplicado_palabra
                    from
                       (select if(A.dia1=1,1,0) dia1,  if(A.dia2=1,1,0) dia2, if(A.dia3=1,1,0) dia3, if(A.dia4=1,1,0) dia4, if(A.dia5=1,1,0) dia5, if(A.dia6=1,1,0) dia6, if(A.dia7=1,1,0) dia7, if(A.dia8=1,1,0) dia8, if(A.dia9=1,1,0) dia9, if(A.dia10=1,1,0) dia10, if(A.dia11=1,1,0) dia11, if(A.dia12=1,1,0) dia12, if(A.dia13=1,1,0) dia13, if(A.dia14=1,1,0) dia14, if(A.dia15=1,1,0) dia15, if(A.dia16=1,1,0) dia16, if(A.dia17=1,1,0) dia17, if(A.dia18=1,1,0) dia18, if(A.dia19=1,1,0) dia19, if(A.dia20=1,1,0) dia20, if(A.dia21=1,1,0) dia21, if(A.dia22=1,1,0) dia22, if(A.dia23=1,1,0) dia23, if(A.dia24=1,1,0) dia24, if(A.dia25=1,1,0) dia25, if(A.dia26=1,1,0) dia26, if(A.dia27=1,1,0) dia27, if(A.dia28=1,1,0) dia28, if(A.dia29=1,1,0) dia29, if(A.dia30=1,1,0) dia30,if(A.dia31=1,1,0) dia31
                        from sige_run_duplicada_asistencia A
                        where A.ano_escolar  = pano_escolar and
                            A.mes_escolar  = pmes_actual and
                            A.mes_pago     = pmes_pago and
                            A.sal_run      = crs_sal_run and
                            A.estado_declaracion = 99 and
                            A.rbd <> crs_rbd
                        ) D;



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
					and sal_run = crs_sal_run;

                else
                    set vintasistencia_duplicada = 0;
                end if;

       

        end loop;
      close duplicados;



end
go