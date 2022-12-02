DROP DATABASE IF EXISTS SpotifyClone;
  
  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
      plano VARCHAR(50) NOT NULL,
      valor_plano DECIMAL (3,2) NOT NULL
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.planos(plano, valor_plano)
  VALUES
    ("gratuito", 0.00),
    ("familiar", 7.99),
    ("universitário", 5.99),
    ("pessoal", 6.99);
   
  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
      usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
     FOREIGN KEY (plano_id) REFERENCES planos (plano_id) 
  ) engine = InnoDB;
    
   INSERT INTO SpotifyClone.usuarios(usuario, idade, plano_id)
  VALUES
    ("Barbara Liskov", 82 , 1),
    ("Robert Cecil Martin", 58, 1 ),
    ("Ada Lovelace", 37, 2),
    ("Martin Fowler", 46, 2),
    ("Sandi Metz", 58 , 2 ),
    ("Paulo Freire", 19, 3),
    ("Bell Hooks", 26, 3),
    ("Christopher Alexander", 85, 4),
    ("Judith Butler", 45 , 4),
    ("Jorge Amado", 58, 4);

  CREATE TABLE SpotifyClone.artistas(
      artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
      artista VARCHAR(50) NOT NULL
      
  ) engine = InnoDB;
  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
    ("Beyoncé"),
    ("Queen"),
    ("Elis Regina"),
    ("Baco Exu do Blues"),
    ("Blind Guardian"),
    ("Nina Simone");
  
  CREATE TABLE SpotifyClone.albuns(
      album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
      album VARCHAR(50) NOT NULL,
      ano_lancamento INT NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
   ) engine = InnoDB;
    INSERT INTO SpotifyClone.albuns ( album, ano_lancamento, artista_id )
  VALUES
    ("Renaissance", 2022, 1 ),
    ("Jazz", 1978, 2),
    ("Hot Space", 1982, 2),
    ("Vento de Maio", 1998, 3),
    ("Falso Brilhante", 2001, 3),
    ("QVVJFA?", 2003, 4),
    ("Somewhere Far Beyond?", 2003, 5),
    ("I Put A Spell On You", 2003, 6);
    
    
    CREATE TABLE SpotifyClone.seguidores(
		artista_id INT NOT NULL,
        usuario_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(artista_id, usuario_id),
		FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
		FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
  
   ) engine = InnoDB;
  INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1 ,2),
    (1 , 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

    CREATE TABLE SpotifyClone.cancoes(
		    cancoes_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
            cancao VARCHAR (50) NOT NULL,
            album_id INT NOT NULL,
            artista_id INT NOT NULL,
            duracao_segundos INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES albuns(album_id),
     FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
   ) engine = InnoDB; 

  INSERT INTO SpotifyClone.cancoes ( cancao, album_id, duracao_segundos, artista_id)
  VALUES
    ("BREAK MY SOUL",1, 279, 1),
    ("VIRGO’S GROOVE",1, 369, 1),
    ("ALIEN SUPERSTAR", 1, 116, 1),
    ("Don’t Stop Me Now", 2, 203, 2 ),
    ("Under Pressure",3 ,152, 2),
    ("Como Nossos Pais", 4, 105, 3),
    ("O Medo de Amar é o Medo de Ser Livre", 5, 207, 3),
    ("Samba em Paris", 6, 267, 4),
    ("The Bard’s Song",7, 244, 5),
    ("Feeling Good",8,100 , 6);
         
    
    CREATE TABLE SpotifyClone.reproducao(
		   cancoes_id INT NOT NULL,
           usuario_id INT NOT NULL,
           data_reproducao DATETIME NOT NULL,
	  CONSTRAINT PRIMARY KEY(cancoes_id, usuario_id ),
      FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
      
   ) engine = InnoDB;

  INSERT INTO SpotifyClone.reproducao ( data_reproducao, usuario_id, cancoes_id )
  VALUES
 ("2022-02-28 10:45:55",1, 8),
 ("2020-05-02 05:30:35",1 , 2),
 ("2020-03-06 11:22:33",1 , 10),
 ("2022-08-05 08:05:17",2, 10),
 ("2020-01-02 07:40:33",2, 7), 
 ("2020-11-13 16:55:13", 3, 10),
 ("2020-12-05 18:38:30",3, 2),
 ("2021-08-15 17:10:10",4, 8),
 ("2022-01-09 01:44:33",5, 8),
 ("2020-08-06 15:23:43",5, 5),
 ("2017-01-24 00:31:17",6, 7),
 ("2017-10-12 12:35:20",6, 1),
 ("2011-12-15 22:30:49",7, 4),
 ("2012-03-17 14:56:41",8, 4),
 ("2022-02-24 21:14:22",9, 9),
 ("2015-12-13 08:30:22",10, 3);
