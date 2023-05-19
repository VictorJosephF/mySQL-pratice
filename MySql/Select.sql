SELECT Datanasc, Endereco
FROM FUNCIONARIO
WHERE Pnome = 'João' AND Minicial = 'B' AND Unome = 'Silva';

SELECT Salario
FROM FUNCIONARIO
ORDER BY Salario;

SELECT Pnome, Cpf
FROM FUNCIONARIO
WHERE Endereco LIKE '%Sâo Paulo%';

SELECT Pnome, Cpf
FROM FUNCIONARIO
WHERE Dnr = 6 AND Salario BETWEEN 30000 AND 40000;

SELECT Pnome, Unome
FROM Funcionario