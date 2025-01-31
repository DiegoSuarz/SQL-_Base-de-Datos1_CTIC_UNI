
SELECT GETDATE()
-----------------------------------------------------------------
SELECT DATENAME(MONTH, GETDATE()) AS Mes
-----------------------------------------------------------------
SELECT DATENAME(YEAR, GETDATE()) AS Año
-----------------------------------------------------------------
SELECT DATENAME(DAY, GETDATE()) AS Día
-----------------------------------------------------------------
SELECT DATENAME(WEEKDAY, GETDATE()) AS DíaSemana
-----------------------------------------------------------------
--FORMATO DE FECHA: 0..14 -> EL AÑO SE MUESTRA EN 4 CIFRAS
--					100..114 --> EL AÑO SE MUESTRA EN 2 CIFRAS
SELECT CONVERT(VARCHAR, GETDATE(), 0)  --MES/DIA/AÑO
SELECT CONVERT(VARCHAR, GETDATE(), 1)  --MES/DIA/AÑO
SELECT CONVERT(VARCHAR, GETDATE(), 2)  --MES/DIA/AÑO
SELECT CONVERT(VARCHAR, GETDATE(), 3)  --MES/DIA/AÑO FORMATO PERUANO
SELECT CONVERT(VARCHAR, GETDATE(), 10)
-----------------------------------------------------------------
SELECT MONTH(GETDATE())
-----------------------------------------------------------------
SELECT CASE MONTH(GETDATE())
		WHEN 1 THEN 'ENERO'
		WHEN 2 THEN 'FEBRERP'
		WHEN 3 THEN 'MARZO'
		WHEN 4 THEN 'ABRIL'
		WHEN 5 THEN 'MAYO'
		WHEN 6 THEN 'JUNIO'
		WHEN 7 THEN 'JULIO'
		WHEN 8 THEN 'AGOSTO'
		WHEN 9 THEN 'SETIEMBRE'
		WHEN 10 THEN 'OCTUBRE'
		WHEN 11 THEN 'NOVIEMBRE'
		WHEN 12 THEN 'DICIEMBRE'
		END AS MES
