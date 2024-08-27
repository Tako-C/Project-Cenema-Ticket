# Cinema Ticket Database Project

Welcome to the Cinema Ticket Database project. This database schema manages information for a cinema, including cinema programs, movies, seats, ticket orders, and more.

![CinemaTicket](https://github.com/Tako-C/Project-Cenema-Ticket/blob/main/Photo/Screenshot%202024-08-27%20125053.png?raw=true)

## Why This Project?

This project arises from the course INT 205 DATABASE MANAGEMENT SYSTEM. It involves designing a cinema system in the form of a schema, which includes a ticketing system, movie programming system, and movie screening room system, among others.

## Project Team

- Mr. Chanachai Mainoy
- Mr. Shisanucha Chengsamo
- Mr. Natsaran Sae-oueng
- Tinnapop Tienbang
- Taspol Thuanchamnan
- Papangkorn Kijsakulrat
- Phatcharadol Thangplub
- Phakphum Phrajrern (Me)

## Cinema Ticket Database Schema

![CinemaTicket](https://github.com/Tako-C/Project-Cenema-Ticket/blob/main/Photo/CenemaTicket_ER_V2.png?raw=true)

## Table of Contents

- [Database Schema Overview](#database-schema-overview)
- [Tables](#tables)
  - [movie](#movie)
  - [poster](#poster)
  - [screen](#screen)
  - [cinema](#cinema)
  - [showtime](#showtime)
  - [cinemaprogram](#cinemaprogram)
  - [membertype](#membertype)
  - [staff](#staff)
  - [member](#member)
  - [seat](#seat)
  - [seatType](#seattype)
  - [orderticket](#orderticket)
- [Indexes](#indexes)
- [Cinema Ticket Booking System](#cinema-ticket-booking-system)

## Database Schema Overview

The database is organized into several key tables that store information about different entities within the cinema ticket booking system. Below is an overview of each table and its corresponding fields.

## Tables

### `movie`
- **movieID**: Unique identifier for the movie (`INT`)
- **movieName**: Name of the movie (`VARCHAR(100)`)
- **movieGenre**: Genre of the movie (`VARCHAR(45)`)
- **movieDirector**: Director of the movie (`VARCHAR(50)`)
- **studio**: Studio that produced the movie (`VARCHAR(45)`)
- **duration**: Duration of the movie in minutes (`INT`)
- **movieDescription**: A brief description of the movie (`VARCHAR(200)`)
- **language**: Language of the movie (`VARCHAR(45)`)

### `poster`
- **posterID**: Unique identifier for the poster (`VARCHAR(20)`)
- **posterName**: Name of the poster (`VARCHAR(45)`)
- **quantity**: Number of posters available (`INT`)
- **movieID**: Foreign key reference to the `movie` table (`INT`)

### `screen`
- **screenID**: Unique identifier for the screen (`INT`)
- **screenName**: Name of the screen (`VARCHAR(45)`)
- **ScreenPrice**: Base price for watching a movie on this screen type (`INT`)

### `cinema`
- **cinemaNumber**: Unique identifier for the cinema (`INT`)
- **cinemaName**: Name of the cinema (`VARCHAR(10)`)
- **screenID**: Foreign key reference to the `screen` table (`INT`)

### `showtime`
- **showTime_ID**: Unique identifier for the showtime (`INT`)
- **showDate**: Date of the show (`DATE`)
- **showTime**: Time of the show (`TIME`)

### `cinemaprogram`
- **cinemaProgramID**: Unique identifier for the cinema program (`VARCHAR(45)`)
- **movieID**: Foreign key reference to the `movie` table (`INT`)
- **showTime_ID**: Foreign key reference to the `showtime` table (`INT`)
- **cinemaNumber**: Foreign key reference to the `cinema` table (`INT`)

### `membertype`
- **MemberTypeID**: Unique identifier for the member type (`INT`)
- **MemberTypeName**: Name of the member type (`VARCHAR(45)`)
- **PromotionDiscount**: Discount percentage associated with the member type (`INT`)

### `staff`
- **staffID**: Unique identifier for the staff member (`INT`)
- **staffFirstname**: First name of the staff member (`VARCHAR(45)`)
- **staffLastName**: Last name of the staff member (`VARCHAR(45)`)

### `member`
- **MemberID**: Unique identifier for the member (`INT`)
- **MemberFirstName**: First name of the member (`VARCHAR(80)`)
- **MemberLastName**: Last name of the member (`VARCHAR(80)`)
- **birthDate**: Birth date of the member (`DATE`)
- **Email**: Email address of the member (`VARCHAR(100)`)
- **phone**: Phone number of the member (`VARCHAR(45)`)
- **MemberTypeID**: Foreign key reference to the `membertype` table (`INT`)
- **staffID**: Foreign key reference to the `staff` table (`INT`)

### `seat`
- **seatID**: Unique identifier for the seat (`VARCHAR(5)`)
- **seatNumber**: Number of the seat (`VARCHAR(3)`)
- **cinemaProgramID**: Foreign key reference to the `cinemaprogram` table (`VARCHAR(45)`)
- **seatType**: Foreign key reference to the `seatType` table (`INT`)
- **TotalPrice**: Total price for the seat (`INT`)
- **reserve**: Indicates if the seat is reserved (`TINYINT`)

### `seatType`
- **seatType**: Unique identifier for the seat type (`INT`)
- **seatName**: Name of the seat type (`VARCHAR(45)`)
- **seatPrice**: Base price for this seat type (`INT`)

### `orderticket`
- **orderTicket_ID**: Unique identifier for the order ticket (`INT`)
- **orderDate**: Date when the ticket was ordered (`DATE`)
- **orderTime**: Time when the ticket was ordered (`TIME`)
- **MemberID**: Foreign key reference to the `member` table (`INT`)
- **seatID**: Foreign key reference to the `seat` table (`VARCHAR(5)`)

## Indexes

To optimize performance, consider adding indexes to the following columns:

- **movie**: `movieID` (Primary Key), `movieName`
- **poster**: `posterID` (Primary Key), `movieID`
- **screen**: `screenID` (Primary Key)
- **cinema**: `cinemaNumber` (Primary Key), `screenID`
- **showtime**: `showTime_ID` (Primary Key)
- **cinemaprogram**: `cinemaProgramID` (Primary Key), `movieID`, `showTime_ID`, `cinemaNumber`
- **membertype**: `MemberTypeID` (Primary Key)
- **staff**: `staffID` (Primary Key)
- **member**: `MemberID` (Primary Key), `Email`
- **seat**: `seatID` (Primary Key), `cinemaProgramID`, `seatType`
- **seatType**: `seatType` (Primary Key)
- **orderticket**: `orderTicket_ID` (Primary Key), `MemberID`, `seatID`

## Cinema Ticket Booking System

This repository contains the database schema for the Cinema Ticket Booking System. The schema is designed to manage various aspects of a cinema's operations, including movies, showtimes, cinemas, screens, seats, members, and ticket orders. The schema ensures that relationships between tables are maintained through foreign key constraints, facilitating efficient data management and querying.

## Getting Started

To get started with this project, clone the repository and review the database schema to understand its structure and relationships.

```bash
https://github.com/Tako-C/Project-Cenema-Ticket.git
