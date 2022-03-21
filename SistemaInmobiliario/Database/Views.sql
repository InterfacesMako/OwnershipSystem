create view METRICAS_OBTERNER
as
select (select COUNT(id) from USERS) as 'CountUsers',
(select  COUNT(id) from Clientes) as 'CountClientes',
(select  COUNT(id) from EMPRESAS) as 'CountEmpresas',
(select  COUNT(id) from Items) as 'CountItems'