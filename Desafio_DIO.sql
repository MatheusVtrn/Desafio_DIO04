USE Filmes

-- 1 - Buscar o nome e ano dos Filmes

SELECT NOME, ANO FROM dbo.Filmes

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT Nome, ano, Duracao FROM dbo.Filmes order by Ano asc

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

SELECT Nome, ano, Duracao FROM dbo.Filmes WHERE NOME ='De Volta para o Futuro'

-- 4 - Buscar os filmes lançados em 1997

SELECT Nome, ano, Duracao FROM dbo.Filmes WHERE Ano = '1997'

-- 5 - Buscar os filmes lançados APÓS o ano 2000

SELECT Nome, ano, Duracao FROM dbo.Filmes WHERE Ano > 2000

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

SELECT Nome, ano, Duracao FROM dbo.Filmes WHERE duracao > 100 AND duracao<150 order by duracao asc

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

select Ano, COUNT (*) AS Quantidade
FROM dbo.Filmes
GROUP by Ano
ORDER BY Quantidade DESC, SUM(Duracao) DESC  

-- opcional abaixo 

select Ano, COUNT (*) AS Quantidade, SUM(Duracao)
FROM dbo.Filmes
GROUP by Ano
ORDER BY Quantidade DESC, SUM(Duracao) DESC  


-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT * FROM dbo.Atores WHERE Genero = 'M'

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT * FROM dbo.Atores WHERE Genero = 'F' ORDER BY PrimeiroNome ASC

-- 10 - Buscar o nome do filme e o gênero

SELECT
dbo.Filmes.Nome, dbo.Generos.Genero from dbo.Filmes
join dbo.FilmesGenero ON dbo.Filmes.Id = dbo.FilmesGenero.IdFilme
join dbo.Generos ON dbo.Generos.Id = dbo.FilmesGenero.IdGenero;

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"

SELECT
dbo.Filmes.Nome, dbo.Generos.Genero  from dbo.Filmes
join dbo.FilmesGenero ON dbo.Filmes.Id = dbo.FilmesGenero.IdFilme
join dbo.Generos ON dbo.Generos.Id = dbo.FilmesGenero.IdGenero
Where dbo.Generos.Genero = 'Mistério'

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT
dbo.Filmes.Nome, dbo.Atores.PrimeiroNome, dbo.Atores.UltimoNome, dbo.ElencoFilme.Papel  from dbo.Filmes
join dbo.ElencoFilme ON dbo.Filmes.Id = dbo.ElencoFilme.IdFilme
join dbo.Atores ON dbo.Atores.Id = dbo.ElencoFilme.IdAtor
