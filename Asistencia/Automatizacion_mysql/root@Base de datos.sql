
select count(*)
from sige_ficha_alumno



/*

 159517 registro(s) afectado(s) 

 [Ejecutado: 14/05/2015 14:50:46] [Ejecución: 7s] 


/*
select *
from proceso

/*

update sige_asistencia_declarada a, sige_ee_convenio b
set a.regimen_sep = 2
where   a.rbd = b.rbd 
        and a.ano_escolar = 2015 
        and a.mes_pago = 5 
        and a.mes_escolar = 3 
       
        and b.conv_tipo_id = '20121218195032457949000000' 
        and b.conv_estado = 1 
        and a.rbd <= 60000
        and (b.conv_fecha_fin_conven = '1900-01-01' 
                    or (b.conv_fecha_fin_conven <> '1900-01-01' 
                        and (year(b.conv_fecha_fin_conven) = 2015 and month(b.conv_fecha_fin_conven) >= 3)
                        ) 
                    or (year(b.conv_fecha_fin_conven) > 2015) 
                    )





/*
update sige_asistencia_declarada a
(select conv_id, conv_tipo_id, rbd, 2 conv_estado, 2015 ano_escolar, 5 mes_pago, 3 mes_escolar
from sige_ee_convenio 
where conv_tipo_id = '20121218195032457949000000' 
and conv_estado = 1 
and rbd <= 60000
and (conv_fecha_fin_conven = '1900-01-01' 
            or (conv_fecha_fin_conven <> '1900-01-01' 
                and (year(conv_fecha_fin_conven) = 2015 and month(conv_fecha_fin_conven) >= 3)
                ) 
            or (year(conv_fecha_fin_conven) > 2015) 
            )
             )temp b






/*

SELECT convenio,estado,count(*)
--ANO_ESCOLAR, ${v_mes_pago} MES_PAGO, RBD, COD_ENS, COD_GRA, LET_CUR, JECD, SAL_RUN, TIPO_PIE, COD_PIE, ESTADO, ANO_ANTERIOR, FECHA_ACTUALIZACION, HORA_ACTUALIZACION, CONVENIO
FROM SIGE_PIE_ALUMNOS
WHERE 
--CONVENIO = 1 
--AND ESTADO = 1 
--AND 
ANO_ESCOLAR =  2015
group by convenio,estado

/*
select *
from sige_informe_preferentes

/*
select  b.cp_region
        ,b.cp_deprov
        ,b.cp_comuna
        ,c.nom_comuna
        ,d.ano_escolar
        ,d.mes_pago
        ,d.mes_escolar
        ,b.rbd
        ,b.nombre_esta
        ,b.tipo_dependencia
        ,d.cod_ens_subv
        ,d.cod_gra_subv
        ,d.jecd
         ,sum((1-abs(sign(d.tipo_alumno - 1)))*d.asis_promedio) asis_promedio_prio
         ,sum((1-abs(sign(d.tipo_alumno - 3)))*d.asis_promedio) asis_promedio_pref
         ,sum((1-abs(sign(d.tipo_alumno-1)))) num_alumnos_prio
         ,sum((1-abs(sign(d.tipo_alumno-3)))) num_alumnos_pref
from sige_establecimiento b, sige_region_deprov_comuna c, sige_asistencia_declarada_sep d
where b.cod_comuna=c.cod_comuna 
and b.tipo_dependencia in(1,2,3,5)
and b.rbd = d.rbd 
and d.ano_escolar = 2015
and d.mes_pago = 5
and d.tipo_alumno = 3
and b.rbd < 60000



SELECT  count(*)
FROM SIGE_ESTABLECIMIENTO B, SIGE_REGION_DEPROV_COMUNA C, SIGE_ASISTENCIA_DECLARADA_SEP D
WHERE B.COD_COMUNA=C.COD_COMUNA 
AND B.TIPO_DEPENDENCIA IN(1,2,3,5)
AND B.RBD = D.RBD 
AND D.ANO_ESCOLAR = 2015
AND D.MES_PAGO = 5
AND D.TIPO_ALUMNO = 3 //1:ALUMNO PRIORITARIO , 3:ALUMNO PREFERENTE
AND B.RBD = 8485

select *
from sige_asistencia_declarada_sep 
where rbd = 8485 and mes_escolar = 3 and cod_ens = 110 and cod_gra = 7 and let_cur = 'A'


/*


SELECT  B.CP_REGION
        ,B.CP_DEPROV
        ,B.CP_COMUNA
        ,C.NOM_COMUNA
        ,D.ANO_ESCOLAR
        ,D.MES_PAGO
        ,D.MES_ESCOLAR
        ,B.RBD
        ,B.NOMBRE_ESTA
        ,B.TIPO_DEPENDENCIA
        ,D.COD_ENS_SUBV
        ,D.COD_GRA_SUBV
        ,D.JECD
         ,SUM((1-ABS(SIGN(D.TIPO_ALUMNO - 1)))*D.ASIS_PROMEDIO) ASIS_PROMEDIO_PRIO
         ,SUM((1-ABS(SIGN(D.TIPO_ALUMNO - 3)))*D.ASIS_PROMEDIO) ASIS_PROMEDIO_PREF
         ,SUM((1-ABS(SIGN(D.TIPO_ALUMNO-1)))) NUM_ALUMNOS_PRIO
         ,SUM((1-ABS(SIGN(D.TIPO_ALUMNO-3)))) NUM_ALUMNOS_PREF
FROM SIGE_ESTABLECIMIENTO B, SIGE_REGION_DEPROV_COMUNA C, SIGE_ASISTENCIA_DECLARADA_SEP D
WHERE B.COD_COMUNA=C.COD_COMUNA 
AND B.TIPO_DEPENDENCIA IN(1,2,3,5)
AND B.RBD = D.RBD 
AND D.ANO_ESCOLAR = 2014
AND D.MES_PAGO = 5
AND D.TIPO_ALUMNO IN (1,3) //1:ALUMNO PRIORITARIO , 3:ALUMNO PREFERENTE
AND B.RBD < 60000

