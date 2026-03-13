CREATE DATABASE IF NOT EXISTS knigovydacha;
USE knigovydacha;

CREATE TABLE Читатели (
    ID_Читателя INT PRIMARY KEY AUTO_INCREMENT,
    ФИО VARCHAR(150) NOT NULL,
    Телефон VARCHAR(20),
    Адрес VARCHAR(200)
);

CREATE TABLE Книги (
    Инвент_номер INT PRIMARY KEY AUTO_INCREMENT,
    Название VARCHAR(200) NOT NULL,
    Автор VARCHAR(150) NOT NULL,
    Статус VARCHAR(20) DEFAULT 'Доступна'
);

CREATE TABLE Выдача (
    ID_Выдачи INT PRIMARY KEY AUTO_INCREMENT,
    ID_Читателя INT,
    Инвент_номер INT,
    ДатаВыдачи DATE,
    СрокВозврата DATE,
    FOREIGN KEY (ID_Читателя) REFERENCES Читатели(ID_Читателя),
    FOREIGN KEY (Инвент_номер) REFERENCES Книги(Инвент_номер)
);

INSERT INTO Читатели (ФИО, Телефон, Адрес) VALUES
('Сидоров Иван Петрович', '+7(978)111-22-33', 'ул. Ленина, 5'),
('Козлова Мария Андреевна', '+7(978)444-55-66', 'ул. Нахимова, 15');

INSERT INTO Книги (Название, Автор, Статус) VALUES
('Евгений Онегин', 'Пушкин А.С.', 'Доступна'),
('Война и мир', 'Толстой Л.Н.', 'Доступна'),
('Приключения Незнайки', 'Носов Н.Н.', 'Доступна');

INSERT INTO Выдача (ID_Читателя, Инвент_номер, ДатаВыдачи, СрокВозврата) VALUES
(1, 1, '2026-03-01', '2026-03-15');

UPDATE Книги SET Статус = 'Выдана' WHERE Инвент_номер = 1;

SELECT * FROM Читатели;
SELECT * FROM Книги WHERE Статус = 'Доступна';
SELECT Ч.ФИО, К.Название, В.ДатаВыдачи, В.СрокВозврата
FROM Выдача В
JOIN Читатели Ч ON В.ID_Читателя = Ч.ID_Читателя
JOIN Книги К ON В.Инвент_номер = К.Инвент_номер;

SELECT * FROM Книги;
