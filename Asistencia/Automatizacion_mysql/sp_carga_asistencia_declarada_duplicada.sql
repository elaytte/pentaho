
--call sp_carga_asistencia_declarada_duplicada(2014,4,3)

drop procedure sp_carga_asistencia_declarada_duplicada
go

CREATE PROCEDURE sp_carga_asistencia_declarada_duplicada(in pano_escolar int, in pmes_pago int,in pmes_actual int)
NOT DETERMINISTIC
CONTAINS SQL
begin


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
    select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('Matricula duplicada [',pano_escolar,',',pmes_pago,']:',cast(count(*) as char)) as descripcion
        from    sige_run_duplicada
        where   ano_escolar = pano_escolar and
                mes_pago    = pmes_pago;



     delete from sige_run_duplicada_asistencia
     where ano_escolar      = pano_escolar
           and mes_pago     = pmes_pago
           and mes_escolar  = pmes_actual;
        
        insert into sige_run_duplicada_asistencia   
        select sa.mes_pago,sa.mes_escolar,sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur , sa.ano_escolar, sa.sal_run , sa.dia1, sa.dia2 ,  sa.dia3, sa.dia4,sa.dia5 , sa.dia6 , sa.dia7 ,sa.dia8 ,  sa.dia9 , sa.dia10, sa.dia11 , sa.dia12, sa.dia13 , sa.dia14 ,sa.dia15,sa.dia16 ,  sa.dia17 ,  sa.dia18 ,  sa.dia19, sa.dia20 ,  sa.dia21,  sa.dia22 ,  sa.dia23, sa.dia24 ,  sa.dia25 , sa.dia26 ,  sa.dia27  , sa.dia28 , sa.dia29  ,  sa.dia30 , sa.dia31 ,  sa.dias_trabajados , sa.asis_promedio ,  sa.estado_declaracion  ,  sa.dias_asistidos, sa.fecha_matricula, sa.regimen_sep,sa.tipo_alumno,sa.orden_matricula,sa.tipo_aula,sa.jecd,sa.cod_ens_subv,sa.cod_gra_subv, sa.monto_subv_normal
        from sige_asistencia_declarada sa, sige_run_duplicada sd
        where   sa.ano_escolar          = pano_escolar
                and sa.mes_escolar      = pmes_actual
                and sa.mes_pago         = pmes_pago
                and sa.mes_pago         = sd.mes_pago
                and sa.sal_run          = sd.sal_run 
                and sa.estado_declaracion in (3,2)
                and sa.habilitado_subv  = 1
                and sd.ano_escolar = sa.ano_escolar
        order by sa.rbd, sa.cod_ens,sa.cod_gra, sa.let_cur, sa.orden_matricula;
    

  
    insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
    select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('Matricula Duplicada Asistencia [',pano_escolar,',',pmes_pago,']:',cast(count(*) as char)) as descripcion
        from sige_run_duplicada_asistencia
        where ano_escolar       = pano_escolar
              and mes_pago      = pmes_pago
              and mes_escolar   = pmes_actual;
    

end
go