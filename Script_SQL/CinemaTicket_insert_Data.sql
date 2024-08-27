use cinematicket;

INSERT INTO `CinemaTicket`.`Movie` (`movieID`, `movieName`, `movieGenre`, `movieDirector`, `studio`, `duration`, `movieDescription`, `language`) VALUES
(1, 'Inception', 'Sci-Fi', 'Christopher Nolan', 'Warner Bros.', 148, 'A mind-bending thriller', 'English'),
(2, 'Titanic', 'Romance', 'James Cameron', '20th Century Fox', 195, 'An epic love story on a doomed ship', 'English'),
(3, 'The Godfather', 'Crime', 'Francis Ford Coppola', 'Paramount Pictures', 175, 'A mafia family saga', 'English'),
(4, 'Spirited Away', 'Animation', 'Hayao Miyazaki', 'Studio Ghibli', 125, 'A young girl in a magical world', 'Japanese'),
(5, 'Parasite', 'Thriller', 'Bong Joon-ho', 'CJ Entertainment', 132, 'A social commentary thriller', 'Korean');

INSERT INTO `CinemaTicket`.`Poster` (`posterID`, `posterName`, `quantity`, `movieID`) VALUES
('P1', 'Inception Poster', 50, 1),
('P2', 'Titanic Poster', 60, 2),
('P3', 'The Godfather Poster', 40, 3),
('P4', 'Spirited Away Poster', 70, 4),
('P5', 'Parasite Poster', 30, 5);

INSERT INTO `CinemaTicket`.`Screen` (`screenID`, `screenName`, `ScreenPrice`) VALUES
(1, 'IMAX', 20),
(2, '4DX', 25),
(3, 'Standard', 15),
(4, 'VIP', 30),
(5, 'Dolby Cinema', 35);

INSERT INTO `CinemaTicket`.`Cinema` (`cinemaNumber`, `cinemaName`, `screenID`) VALUES
(1, 'Cinema A', 1),
(2, 'Cinema B', 2),
(3, 'Cinema C', 3),
(4, 'Cinema D', 4),
(5, 'Cinema E', 5);

INSERT INTO `CinemaTicket`.`ShowTime` (`showTime_ID`, `showDate`, `showTime`) VALUES
(1, '2024-08-27', '14:00:00'),
(2, '2024-08-27', '17:00:00'),
(3, '2024-08-27', '20:00:00'),
(4, '2024-08-28', '14:00:00'),
(5, '2024-08-28', '17:00:00');

INSERT INTO `CinemaTicket`.`MemberType` (`MemberTypeID`, `MemberTypeName`, `PromotionDiscount`) VALUES
(1, 'Regular', 0),
(2, 'Silver', 10),
(3, 'Gold', 15),
(4, 'Platinum', 20),
(5, 'Diamond', 25);

INSERT INTO `CinemaTicket`.`Staff` (`staffID`, `staffFirstname`, `staffLastName`) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Brown'),
(4, 'Emily', 'Davis'),
(5, 'Daniel', 'Wilson');

INSERT INTO `CinemaTicket`.`Member` (`MemberID`, `MemberFirstName`, `MemberLastName`, `brithDate`, `Email`, `phone`, `MemberTypeID`, `staffID`) VALUES
(1, 'Alice', 'Johnson', '1990-05-14', 'alice.johnson@example.com', '123-456-7890', 1, 1),
(2, 'Bob', 'Miller', '1985-09-23', 'bob.miller@example.com', '098-765-4321', 2, 2),
(3, 'Charlie', 'Garcia', '1992-07-11', 'charlie.garcia@example.com', '567-890-1234', 3, 3),
(4, 'David', 'Martinez', '1988-12-04', 'david.martinez@example.com', '321-654-0987', 4, 4),
(5, 'Eva', 'Hernandez', '1995-01-19', 'eva.hernandez@example.com', '234-567-8901', 5, 5);

INSERT INTO `CinemaTicket`.`CinemaProgram` (`cinemaProgramID`, `movieID`, `showTime_ID`, `cinemaNumber`) VALUES
('CP1', 1, 1, 1),
('CP2', 2, 2, 2),
('CP3', 3, 3, 3),
('CP4', 4, 4, 4),
('CP5', 5, 5, 5);

INSERT INTO `CinemaTicket`.`SeatType` (`seatType`, `seatName`, `seatPrice`) VALUES
(1, 'Standard', 10),
(2, 'Premium', 15),
(3, 'VIP', 20),
(4, 'Recliner', 25),
(5, 'Sofa', 30);

INSERT INTO `CinemaTicket`.`Seat` (`seatID`, `seatNumber`, `cinemaProgramID`, `seatType`, `TotalPrice`, `reserve`) VALUES
('S1', 'A1', 'CP1', 1, 10, 0),
('S2', 'A2', 'CP2', 2, 15, 1),
('S3', 'B1', 'CP3', 3, 20, 0),
('S4', 'B2', 'CP4', 4, 25, 1),
('S5', 'C1', 'CP5', 5, 30, 0);

INSERT INTO `CinemaTicket`.`OrderTicket` (`orderTicket_ID`, `orderDate`, `orderTime`, `MemberID`, `seatID`) VALUES
(1, '2024-08-27', '14:05:00', 1, 'S1'),
(2, '2024-08-27', '17:10:00', 2, 'S2'),
(3, '2024-08-27', '20:15:00', 3, 'S3'),
(4, '2024-08-28', '14:20:00', 4, 'S4'),
(5, '2024-08-28', '17:25:00', 5, 'S5');
