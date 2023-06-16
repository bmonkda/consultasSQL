WITH meses AS (
  SELECT generate_series(
           DATE_TRUNC('MONTH', MIN(fecefectiva))::date,
           CURRENT_DATE,
           '1 month'::interval
         ) AS mes
  FROM exp_expedientexsueldos
  WHERE EXTRACT(YEAR FROM fecefectiva) >= 2020
  --), salarios AS (
  --  SELECT DISTINCT ON (idempleado, mes)
  --         idempleado,
  --         mes,
  --         monto
  --  FROM exp_expedientexsueldos
  --  CROSS JOIN meses
  --  WHERE EXTRACT(YEAR FROM fecefectiva) >= 2020git 
  --        AND fecefectiva <= mes
  --        AND (fecfin IS NULL OR fecfin >= mes)
  --  ORDER BY idempleado, mes DESC
  --)
  --SELECT idempleado, mes, COALESCE(s.monto, lag(s.monto) OVER (PARTITION BY idempleado ORDER BY mes)) AS monto
  --FROM meses
  --LEFT JOIN salarios s ON meses.mes = s.mes
  --ORDER BY idempleado, mes;

  idempleado in (3257, 3893, 4459)

esta consulta 
SELECT idempleado, EXTRACT(YEAR FROM fecefectiva) AS anio, EXTRACT(MONTH FROM fecefectiva) AS mes, SUM(monto) AS sueldo
FROM exp_expedientexsueldos
WHERE EXTRACT(YEAR FROM fecefectiva) >= 2020 and idempleado in (3893)
GROUP BY idempleado, anio, mes
ORDER BY idempleado, anio, mes;
me arroja esto
3893	2020	3	0.42
3893	2020	5	0.68
3893	2020	11	2.02
3893	2021	3	3.03
3893	2022	1	11.76
3893	2022	2	17.82
3893	2022	7	192.00
3893	2022	9	348.00
y se quiere
3893	2020	3	0.42
3893	2020	4	0.42
3893	2020	5	0.68
3893	2020	6	0.68
3893	2020	7	0.68
3893	2020	8	0.68
3893	2020	9	0.68
3893	2020	10	0.68
3893	2020	11	2.02
3893	2020	12	2.02
3893	2021	1	2.02
3893	2021	2	2.02
3893	2021	3	3.03
3893	2021	4	3.03
3893	2021	5	3.03
3893	2021	6	3.03
3893	2021	7	3.03
3893	2021	8	3.03
3893	2021	9	3.03
3893	2021	10	3.03
3893	2021	11	3.03
3893	2021	12	3.03
3893	2022	1	11.76
3893	2022	2	17.82
3893	2022	3	17.82
3893	2022	4	17.82
3893	2022	5	17.82
3893	2022	6	17.82
3893	2022	7	192.00
3893	2022	8	192.00
3893	2022	9	348.00
3893	2022	10	348.00
3893	2022	11	348.00
3893	2022	12	348.00

