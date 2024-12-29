CREATE DATABASE bookmyshow;
USE bookmyshow;

-- Theatre table
CREATE TABLE theatre (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_name VARCHAR(100) NOT NULL,
    location VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Movie table
CREATE TABLE movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100) NOT NULL,
    duration_minutes INT NOT NULL,
    language VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL
);

-- Screen table (as theatres can have multiple screens)
CREATE TABLE screen (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,
    seating_capacity INT NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES theatre(theatre_id)
);

-- Show table (contains show timings)
CREATE TABLE show_timing (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);


-- Insert theatres
INSERT INTO theatre (theatre_name, location, city) VALUES
('PVR Cinemas', 'Downtown Mall', 'Mumbai'),
('INOX', 'City Center', 'Mumbai'),
('Cinepolis', 'Metro Mall', 'Mumbai');

-- Insert movies
INSERT INTO movie (movie_name, duration_minutes, language, release_date) VALUES
('Avatar 2', 192, 'English', '2023-12-15'),
('Pathaan', 146, 'Hindi', '2024-01-25'),
('Rocky Bhai', 168, 'Kannada', '2024-02-01');

-- Insert screens
INSERT INTO screen (theatre_id, screen_name, seating_capacity) VALUES
(1, 'Screen 1', 150),
(1, 'Screen 2', 120),
(2, 'Screen 1', 180),
(3, 'Screen 1', 200);

-- Insert show timings
INSERT INTO show_timing (screen_id, movie_id, show_date, show_time, price) VALUES
(1, 1, '2024-12-29', '10:00:00', 250.00),
(1, 1, '2024-12-29', '13:30:00', 250.00),
(1, 2, '2024-12-29', '17:00:00', 200.00),
(2, 3, '2024-12-29', '11:00:00', 180.00),
(2, 2, '2024-12-29', '14:30:00', 200.00);


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
    st.show_date = '2024-12-29'  -- Replace with your date
    AND t.theatre_id = 1;        -- Replace with your theatre_id