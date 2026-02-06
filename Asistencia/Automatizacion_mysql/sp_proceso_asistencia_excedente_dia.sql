
--call sp_proceso_asistencia_excedente_dia(2014,4,3)

drop procedure sp_proceso_asistencia_excedente_dia
go

CREATE PROCEDURE sp_proceso_asistencia_excedente_dia(in pano_escolar int, in pmes_pago int,in pmes_actual int)
NOT DETERMINISTIC
CONTAINS SQL
begin

	drop table if exists temp1;
        create temporary table temp1 engine=memory as(
            select  distinct mes_pago, mes_escolar, rbd, cod_ens, cod_gra, let_cur, ano_escolar
            from sige_asistencia_declarada
            where ano_escolar = pano_escolar 
            and   mes_pago    = pmes_pago
            and   mes_escolar = pmes_actual
            and   estado_pago = 2
            and   habilitado_subv = 1
            and   estado_declaracion in (3,2)
            --and rbd < 100
        );

        insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
        select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('Nº de cursos con estado_pago(2):',cast(count(*) as char)) as descripcion
        from temp1;

        drop table if exists temp2;
        create temporary table temp2 engine=memory as(
            select a.mes_pago,a.mes_escolar,a.rbd,a.cod_ens,a.cod_gra,a.let_cur
            from sige_asistencia_declarada a, temp1 b
            where     a.ano_escolar = b.ano_escolar
                and   a.mes_pago    = b.mes_pago
                and   a.mes_escolar = b.mes_escolar
                and   a.rbd         = b.rbd
                and   a.cod_ens     = b.cod_ens
                and   a.cod_gra     = b.cod_gra
                and   a.let_cur     = b.let_cur
                and   a.estado_pago <> 4
                and   a.habilitado_subv = 1
                and   a.estado_declaracion in (3,2)
            group by a.mes_pago,a.mes_escolar,a.rbd,a.cod_ens,a.cod_gra,a.let_cur
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

        insert into proceso(ano_escolar,mes_pago,mes_escolar,descripcion)        
        select pano_escolar ano_escolar, pmes_pago mes_pago, pmes_actual mes_escolar,concat('Nº de cursos sin excedente:',cast(count(*) as char)) as descripcion
        from temp2;

    

end
go