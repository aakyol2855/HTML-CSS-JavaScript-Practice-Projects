CREATE DATABASE yemek_rezervasyon;
USE yemek_rezervasyon;

-- Kullanıcılar Tablosu
CREATE TABLE kullanicilar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_adi VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    sifre VARCHAR(100) NOT NULL
);


-- Rezervasyonlar Tablosu
CREATE TABLE rezervasyonlar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kullanici_id INT NOT NULL,
    tarih DATE NOT NULL,
    ogun ENUM('Oglen', 'Aksam') NOT NULL,
    FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id) ON DELETE CASCADE
);

-- Menüler Tablosu
CREATE TABLE menuler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tarih DATE NOT NULL,
    yemek_adi VARCHAR(100) NOT NULL,
    porsiyon INT NOT NULL,
    enerji_degeri INT NOT NULL
);

INSERT INTO kullanicilar (kullanici_adi, email, sifre) VALUES
('ali.veli', 'ali.veli@universite.edu', '123456'),
('ayse.yilmaz', 'ayse.yilmaz@universite.edu', 'abcdef'),
('mehmet.kaya', 'mehmet.kaya@universite.edu', '123abc'),
('fatma.korkmaz', 'fatma.korkmaz@universite.edu', '456xyz'),
('mustafa.demir', 'mustafa.demir@universite.edu', '789xyz'),
('zeynep.aktas', 'zeynep.aktas@universite.edu', '000111'),
('emre.gunes', 'emre.gunes@universite.edu', '654321'),
('elif.dogan', 'elif.dogan@universite.edu', 'dogan123'),
('burak.celik', 'burak.celik@universite.edu', 'celik123'),
('selin.uzun', 'selin.uzun@universite.edu', 'uzun123');

INSERT INTO rezervasyonlar (kullanici_id, tarih, ogun) VALUES
(1, '2024-12-09', 'Oglen'),
(2, '2024-12-09', 'Aksam'),
(3, '2024-12-10', 'Oglen'),
(4, '2024-12-10', 'Aksam'),
(5, '2024-12-11', 'Oglen'),
(6, '2024-12-11', 'Aksam'),
(7, '2024-12-12', 'Oglen'),
(8, '2024-12-12', 'Aksam'),
(9, '2024-12-13', 'Oglen'),
(10, '2024-12-13', 'Aksam');
SELECT * FROM kullanicilar WHERE email = 'ali.veli@universite.edu';
ALTER TABLE menuler ADD COLUMN gorsel_url VARCHAR(255) NOT NULL AFTER enerji_degeri;

ALTER TABLE kullanicilar ADD COLUMN bakiye DECIMAL(10, 2) DEFAULT 0.00;
SET SQL_SAFE_UPDATES = 0;
UPDATE kullanicilar
SET bakiye = ROUND(RAND() * 400 + 100, 2);
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM kullanicilar;
SELECT * FROM rezervasyonlar;
SELECT * FROM rezervasyonlar WHERE kullanici_id = 1;
SELECT * FROM menuler;
INSERT INTO kullanicilar (kullanici_adi, email, sifre, bakiye) 
VALUES ('admin', 'admin@edu.tr', '$2b$10$Q4d6eNpKrRP/NjyX.kv.Tea4Tfs1L7JGieaAfOxV16AEYo8QIdwty', 0.00);
ALTER TABLE kullanicilar ADD COLUMN rol ENUM('yetkili', 'kullanici') DEFAULT 'kullanici';
INSERT INTO kullanicilar (kullanici_adi, email, sifre, bakiye, rol) 
VALUES ('admin', 'admin@edu.tr', '$2b$10$Q4d6eNpKrRP/NjyX.kv.Tea4Tfs1L7JGieaAfOxV16AEYo8QIdwty', 0.00, 'yetkili');
SELECT * FROM kullanicilar WHERE email = 'admin@edu.tr';
UPDATE kullanicilar 
SET rol = 'yetkili' 
WHERE email = 'admin@edu.tr';
SELECT * FROM kullanicilar WHERE email = 'admin@edu.tr';
SELECT * FROM kullanicilar WHERE email = 'admin@edu.tr';
UPDATE kullanicilar
SET sifre = '<$2b$10$WC9efbkNuOSump4b6jf.U.iGRsCsTcjzFxF4aeMScVR.o8K5BYyqG>'
WHERE email = 'admin@edu.tr';
SELECT * FROM kullanicilar WHERE email = 'admin@edu.tr';

UPDATE kullanicilar
SET sifre = '$2b$10$WC9efbkNuOSump4b6jf.U.iGRsCsTcjzFxF4aeMsCVR.o8K5BYyqG'
WHERE email = 'admin@edu.tr';
SELECT sifre FROM kullanicilar WHERE email = 'admin@edu.tr';
UPDATE kullanicilar
SET sifre = ' $2b$10$hZKKaATRA1U5My6aqBovAuzTOGlegks7L/LV5593RZw1NOqNZHia.'
WHERE email = 'admin@edu.tr';
SELECT sifre FROM kullanicilar WHERE email = 'admin@edu.tr';
SELECT * FROM kullanicilar WHERE email = 'admin@edu.tr';
SELECT * FROM kullanicilar WHERE email = 'admin@edu.tr';
UPDATE kullanicilar
SET sifre = '$2b$10$hZKKaATRA1U5My6aqBovAuzTOGlegks7L/LV5593RZw1N0qNZHia.'
WHERE email = 'admin@edu.tr';
SET SQL_SAFE_UPDATES = 0;
UPDATE kullanicilar
SET sifre = '$2b$10$hZKKaATRA1U5My6aqBovAuzTOGlegks7L/LV5593RZw1N0qNZHia.'
WHERE email = 'admin@edu.tr';
SET SQL_SAFE_UPDATES = 1;
SELECT sifre FROM kullanicilar WHERE email = 'admin@edu.tr';
SHOW COLUMNS FROM kullanicilar;
UPDATE kullanicilar
SET sifre = '$2b$10$hZKKaATRA1U5My6aqBovAuzTOGlegks7L/LV5593RZw1N0qNZHia.'
WHERE email = 'admin@edu.tr';
SELECT sifre FROM kullanicilar WHERE email = 'admin@edu.tr';
SELECT sifre FROM kullanicilar WHERE email = 'admin@edu.tr';
UPDATE kullanicilar
SET sifre = '$2b$10$vmUjN51vnpemnc8OYoLol.na2E1LDW22eJpS/4ZkSzkY6x2Blezzm'
WHERE email = 'admin@edu.tr';
SELECT * FROM menuler;
SELECT * FROM rezervasyonlar;
INSERT INTO menuler (tarih, yemek_adi, porsiyon, enerji_degeri, gorsel_url)
VALUES 
('2024-12-10', 'Mercimek Çorbası', 1, 150, 'https://i.nefisyemektarifleri.com/2021/04/30/mercimek-corbasi-tarifi-7.jpg');
SELECT * FROM menuler;
