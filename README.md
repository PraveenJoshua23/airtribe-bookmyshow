# BookMyShow Database Project 🎬

A MySQL database implementation for a movie ticket booking system inspired by BookMyShow. This project includes database design, schema creation, and sample queries for managing theatre shows and bookings.

## Overview 🎯

This database system manages:
- Multiple theatres and their screens
- Movie information and show timings
- Show scheduling across different screens
- Price management for different shows

## Database Schema Design 📊

### Tables

1. **Theatre**
   - Theatre details including location and city
   - Primary management of theatre information

2. **Movie**
   - Movie information including duration and language
   - Tracks all movies in the system

3. **Screen**
   - Screen management within theatres
   - Handles seating capacity information

4. **Show_Timing**
   - Show schedule management
   - Links movies, screens, and timing information

## Features ⭐

- Normalized database design (1NF, 2NF, 3NF, BCNF compliant)
- Referential integrity through foreign key constraints
- Sample data for testing and development
- Query templates for common operations

## Sample Queries 🔍

```sql
-- List all shows for a specific theatre on a given date
SELECT 
    t.theatre_name,
    m.movie_name,
    s.screen_name,
    st.show_date,
    st.show_time,
    st.price
FROM 
    show_timing st
    JOIN screen s ON st.screen_id = s.screen_id
    JOIN theatre t ON s.theatre_id = t.theatre_id
    JOIN movie m ON st.movie_id = m.movie_id
WHERE 
    st.show_date = '2024-12-29'
    AND t.theatre_id = 1;
```

## Technologies Used 🛠️

- MySQL 8.0
- MySQL Workbench

## Installation Guide 📝

1. Install MySQL and MySQL Workbench
2. Clone this repository
3. Open MySQL Workbench
4. Execute the SQL script (`airtribe_project.sql`)
5. Verify table creation and sample data


## License 📄

This project is licensed under the MIT License - see the LICENSE file for details.


---
**Note**: This is an educational project and is not affiliated with BookMyShow.