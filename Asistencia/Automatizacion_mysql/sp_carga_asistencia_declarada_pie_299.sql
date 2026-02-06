
-- call sp_carga_asistencia_declarada_pie_299(2014,4,3,0)


drop procedure sp_carga_asistencia_declarada_pie_299
go

CREATE PROCEDURE sp_carga_asistencia_declarada_pie_299(in intanio int, in intmespago int,in intmesescolar int, in intrbd integer)
NOT DETERMINISTIC
CONTAINS SQL
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
                  select sa.mes_escolar,sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur , sa.ano_escolar, sa.sal_run , sa.dia1, sa.dia2 ,  sa.dia3, sa.dia4,sa.dia5 , sa.dia6 , sa.dia7 ,sa.dia8 ,  sa.dia9 , sa.dia10, sa.dia11 , sa.dia12, sa.dia13 , sa.dia14 ,sa.dia15,sa.dia16 ,  sa.dia17 ,  sa.dia18 ,  sa.dia19, sa.dia20 ,  sa.dia21,  sa.dia22 ,  sa.dia23, sa.dia24 ,  sa.dia25 , sa.dia26 ,  sa.dia27  , sa.dia28 , sa.dia29  ,  sa.dia30 , sa.dia31 ,  sa.dias_trabajados , sa.asis_promedio ,  sa.estado_declaracion  ,  sa.dias_asistidos, sa.fecha_matricula, sa.regimen_sep,sa.tipo_alumno,sa.orden_matricula,sa.tipo_aula,sa.jecd,sa.cod_ens_subv,sa.cod_gra_subv,sa.monto_subv_normal,sa.estado_colision,sa.estado_pago, sa.asis_promedio
                        from  sige_asistencia_declarada sa, sige_pie_alumnos_uns sp
                        where   sa.rbd = sp.rbd 
                                and sa.sal_run = sp.sal_run
                                and sp.ano_escolar  = intanio
                                and sp.mes_pago     = intmespago
                                and sp.estado       = 1
                                and sp.convenio     = 1
                                and sa.ano_escolar  = sp.ano_escolar
                                and sa.estado_pago  = 1
                                and sa.mes_pago     = sp.mes_pago
                                and sa.cod_ens      = 299
                                and sa.mes_escolar  = 3
                                and sa.habilitado_subv = 1
                                and sa.estado_declaracion in (2,3)
                        order by sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur,sa.orden_matricula ;

    declare continue handler for not found set done = true; 

    OPEN cursor_asistencia;
        read_loop_1:LOOP

             FETCH cursor_asistencia INTO crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run , crs_dia1, crs_dia2 ,  crs_dia3, crs_dia4,crs_dia5 , crs_dia6 , crs_dia7 ,crs_dia8 ,  crs_dia9 , crs_dia10, crs_dia11 , crs_dia12, crs_dia13 , crs_dia14 ,crs_dia15,crs_dia16 ,  crs_dia17 ,  crs_dia18 ,  crs_dia19, crs_dia20 ,  crs_dia21,  crs_dia22 ,  crs_dia23, crs_dia24 ,  crs_dia25 , crs_dia26 ,  crs_dia27  , crs_dia28 , crs_dia29  ,  crs_dia30 , crs_dia31 ,  crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,crs_fecha_incorporacion, crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,crs_monto_subv_normal,vintasistencia_duplicada,crs_estado_pago,crs_asis_promedio; 

             IF done THEN
                    leave read_loop_1;
             END IF;
   
             SET crs_curso_actual = concat(cast(crs_rbd as char),cast(crs_cod_ens as char),cast(crs_cod_gra as char),cast(crs_let_cur as char));
			
           SET vintalumno_retirado = if(crs_dia1=1,1,0)+ if(crs_dia2=1,1,0)+ if(crs_dia3=1,1,0)+ if(crs_dia4=1,1,0)+ if(crs_dia5=1,1,0)+ if(crs_dia6=1,1,0)+ if(crs_dia7=1,1,0)+ if(crs_dia8=1,1,0)+ if(crs_dia9=1,1,0)+ if(crs_dia10=1,1,0)+ if(crs_dia11=1,1,0)+ if(crs_dia12=1,1,0)+ if(crs_dia13=1,1,0)+ if(crs_dia14=1,1,0)+ if(crs_dia15=1,1,0)+ if(crs_dia16=1,1,0)+ if(crs_dia17=1,1,0)+ if(crs_dia18=1,1,0)+ if(crs_dia19=1,1,0)+ if(crs_dia20=1,1,0)+ if(crs_dia21=1,1,0)+ if(crs_dia22=1,1,0)+ if(crs_dia23=1,1,0)+ if(crs_dia24=1,1,0)+ if(crs_dia25=1,1,0)+ if(crs_dia26=1,1,0)+ if(crs_dia27=1,1,0)+ if(crs_dia28=1,1,0)+ if(crs_dia29=1,1,0)+ if(crs_dia30=1,1,0)+ if(crs_dia31=1,1,0); 

           IF (vintalumno_retirado > 0)THEN
                    IF(crs_cod_ens = 299)THEN
                        SET vmaxcurso = 15;
                    ELSE
                        SET vmaxcurso = 45;
                    END IF;

                    IF(crs_exe <= vmaxcurso )THEN
					insert into sige_asistencia_declarada_pie(mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur, ano_escolar, sal_run, dia1, dia2, dia3, dia4, dia5, dia6, dia7, dia8, dia9, dia10, dia11, dia12, dia13, dia14, dia15, dia16, dia17, dia18, dia19, dia20, dia21, dia22, dia23, dia24, dia25, dia26, dia27, dia28, dia29, dia30, dia31, dias_trabajados, asis_promedio, estado_declaracion, dias_asistidos, estado_pago, fecha_matricula, estado_colision,regimen_sep,tipo_alumno,orden_matricula,tipo_aula,jecd,cod_ens_subv,cod_gra_subv,monto_subv_normal)
					values (intmespago,crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run , crs_dia1, crs_dia2 ,  crs_dia3, crs_dia4,crs_dia5 , crs_dia6 , crs_dia7 ,crs_dia8 ,  crs_dia9 , crs_dia10, crs_dia11 , crs_dia12, crs_dia13 , crs_dia14 ,crs_dia15,crs_dia16 ,  crs_dia17 ,  crs_dia18 ,  crs_dia19, crs_dia20 ,  crs_dia21,  crs_dia22 ,  crs_dia23, crs_dia24 ,  crs_dia25 , crs_dia26 ,  crs_dia27  , crs_dia28 , crs_dia29  ,  crs_dia30 , crs_dia31 ,  crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,1, crs_fecha_incorporacion, vintasistencia_duplicada,crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,crs_monto_subv_normal);			
                    ELSE
					insert into sige_asistencia_declarada_pie(mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur, ano_escolar, sal_run, dia1, dia2, dia3, dia4, dia5, dia6, dia7, dia8, dia9, dia10, dia11, dia12, dia13, dia14, dia15, dia16, dia17, dia18, dia19, dia20, dia21, dia22, dia23, dia24, dia25, dia26, dia27, dia28, dia29, dia30, dia31, dias_trabajados, asis_promedio, estado_declaracion, dias_asistidos, estado_pago, fecha_matricula, estado_colision,regimen_sep,tipo_alumno,orden_matricula,tipo_aula,jecd,cod_ens_subv,cod_gra_subv,monto_subv_normal)
					values (intmespago,crs_mes_escolar,crs_rbd, crs_cod_ens,crs_cod_gra, crs_let_cur , crs_ano_escolar, crs_sal_run , crs_dia1, crs_dia2 ,  crs_dia3, crs_dia4,crs_dia5 , crs_dia6 , crs_dia7 ,crs_dia8 ,  crs_dia9 , crs_dia10, crs_dia11 , crs_dia12, crs_dia13 , crs_dia14 ,crs_dia15,crs_dia16 ,  crs_dia17 ,  crs_dia18 ,  crs_dia19, crs_dia20 ,  crs_dia21,  crs_dia22 ,  crs_dia23, crs_dia24 ,  crs_dia25 , crs_dia26 ,  crs_dia27  , crs_dia28 , crs_dia29  ,  crs_dia30 , crs_dia31 ,  crs_dias_trabajados , crs_asis_promedio ,  crs_estado_declaracion  ,  crs_dias_asistidos,2 , crs_fecha_incorporacion, vintasistencia_duplicada,crs_regimen_sep,crs_tipo_alumno,crs_orden_matricula,crs_tipo_aula,crs_aplica_jecd,crs_cod_ens_subv,crs_cod_gra_subv,crs_monto_subv_normal);						
                    END IF;

           END IF;
			
           SET crs_curso_aux 	= concat(cast(crs_rbd as char),cast(crs_cod_ens as char),cast(crs_cod_gra as char),cast(crs_let_cur as char));
		   SET crs_exe          = crs_exe + 1;
		   SET crs_contador     = crs_contador +1;


        END LOOP;
    CLOSE cursor_asistencia;

end
