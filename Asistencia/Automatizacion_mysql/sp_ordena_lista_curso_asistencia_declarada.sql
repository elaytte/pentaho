
/*
COLLATE = utf8_spanish_ci
go
call sp_ordena_lista_curso_asistencia_declarada(2014,4,3)
go

*/


drop procedure sp_ordena_lista_curso_asistencia_declarada
go

CREATE PROCEDURE sp_ordena_lista_curso_asistencia_declarada(in pano_escolar int, in pmes_pago int,in pmes_actual int)
NOT DETERMINISTIC
CONTAINS SQL
begin



	declare v_ano_escolar,v_mes_pago,v_mes_escolar,v_rbd,v_cod_ens,v_cod_gra int;
	declare v_let_cur varchar(2) CHARSET utf8 COLLATE utf8_spanish_ci ;
	declare done int default false;


    
    
    declare cursos45  cursor for
			select ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur
			    from sige_asistencia_declarada 
			    where ano_escolar 	= pano_escolar
			    and mes_pago 		= pmes_pago
			    and mes_escolar 	= pmes_actual
                
			    group by ano_escolar,mes_pago,mes_escolar,rbd,cod_ens,cod_gra,let_cur
			    having count(*)>45;
		declare continue handler for not found set done = true;

        delete from  tmp_ordena_lista;
       
      
		open cursos45;
		read_loop_1: loop
				fetch cursos45 into v_ano_escolar,v_mes_pago,v_mes_escolar,v_rbd,v_cod_ens,v_cod_gra,v_let_cur; 
					if done then
						leave read_loop_1;
					end if;


					--insert into tmp_curso_ordenado
                    insert into tmp_ordena_lista
					select sad.ano_escolar,sad.mes_pago,sad.mes_escolar,sad.rbd,sad.cod_ens,sad.cod_gra,sad.let_cur,sad.sal_run ,sad.orden_matricula, @row_number := @row_number + 1 orden_final
                        from sige_asistencia_declarada sad ,  (select @row_number:=0) R
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

        update  sige_asistencia_declarada s, tmp_ordena_lista t
        set     s.orden_matricula = t.orden_final
        where   s.ano_escolar = t.ano_escolar and
                s.mes_pago    = t.mes_pago and
                s.mes_escolar = t.mes_escolar and
                s.rbd         = t.rbd and
                s.cod_ens     = t.cod_ens and
                s.cod_gra     = t.cod_gra and
                s.let_cur     = t.let_cur;


        insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
        select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('Nº de registros procesados:',cast(count(*) as char)) as descripcion
        from tmp_ordena_lista;

end