CREATE TABLE users (
    id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name NVARCHAR(100) NOT NULL,
    gender NVARCHAR(10) NOT NULL,
    location NVARCHAR(100) NOT NULL,
    university NVARCHAR(100) NULL,
    interests NVARCHAR(MAX)  NULL,
	createdon DATETIME NOT NULL,
	updatedon DATETIME NULL
);

INSERT INTO users (name, gender, location, university, interests, createdon, updatedon)
VALUES 
('Shaun Lee', 'Male', 'Setapak', 'TARUC', 'Reading, Hiking', GETDATE(), NULL),
('Alice Wong', 'Female', 'Petaling Jaya', 'Sunway', 'Cooking, Basketball', GETDATE(), NULL),
('Meng Di', 'Male', 'Petaling Jaya', 'Sunway', 'Gaming, Music', GETDATE(), NULL),
('Joey Wong', 'Female', 'Setapak', 'TARUC', 'Traveling, Painting', GETDATE(), NULL),
('Ethan Hunt', 'Male', 'Setapak', 'UTAR', 'Running, Photography', GETDATE(), NULL),
('Fiona Lee', 'Female', 'Setapak', 'TARUC', 'Yoga, Blogging', GETDATE(), NULL),
('Tom Holland', 'Male', 'Petaling Jaya', 'Sunway', 'Surfing, Music', GETDATE(), NULL),
('Jesicca Jung', 'Female', 'Petaling Jaya', 'Monash', 'Singing, Dancing', GETDATE(), NULL),
('Bruno Mars', 'Male', 'Petaling Jaya', 'Sunway', 'Writing, Singing', GETDATE(), NULL),
('Suki Tan', 'Female', 'Damansara', 'UCSI', 'Acting, Cooking', GETDATE(), NULL),
('Dua Lipa', 'Female', 'Damansara', 'UCSI', 'Singing, Acting', GETDATE(), NULL),
('Felix Ben', 'Male', 'Damansara', 'UCSI', 'Running, Gym', GETDATE(), NULL),
('Alicia Yuen', 'Female', 'Kuala Lumpur', 'Tecnology', 'Coding, Yoga', GETDATE(), NULL),
('Muhammad Ali', 'Male', 'Petaling Jaya', 'Sunway', 'Boxing, Gym', GETDATE(), NULL),
('Jolin Tsai', 'Female', 'Petaling Jaya', 'Sunway', 'Writing, Singing', GETDATE(), NULL),
('SUN WU kong', 'Male', 'Petaling Jaya', 'Sunway', 'Traveling, Photography', GETDATE(), NULL),
('Eling Wong', 'Female', 'Setapak', 'TARUC', 'Hiking, Singing', GETDATE(), NULL),
('Alex Tan', 'Male', 'Kuala Lumpur', 'Sunway', 'Reading, Hiking', GETDATE(), NULL),
('Jessica Wong', 'Female', 'Subang Jaya', 'Monash', 'Cooking, Traveling', GETDATE(), NULL),
('Michael Chen', 'Male', 'Kuala Lumpur', 'UCSI', 'Basketball, Coding', GETDATE(), NULL),
('Samantha Lim', 'Female', 'Petaling Jaya', 'Sunway', 'Drawing, Writing', GETDATE(), NULL),
('David Lee', 'Male', 'Klang', 'TARUC', 'Photography, Cycling', GETDATE(), NULL),
('Emily Tan', 'Female', 'Shah Alam', 'Monash', 'Yoga, Music', GETDATE(), NULL),
('John Smith', 'Male', 'Ampang', 'UCSI', 'Gaming, Traveling', GETDATE(), NULL),
('Rachel Ng', 'Female', 'Cheras', 'Sunway', 'Cooking, Reading', GETDATE(), NULL),
('Henry Wong', 'Male', 'Bangsar', 'Monash', 'Football, Acting', GETDATE(), NULL),
('Natalie Chan', 'Female', 'Puchong', 'Sunway', 'Blogging, Photography', GETDATE(), NULL),
('Oliver Tan', 'Male', 'Setapak', 'TARUC', 'Music, Traveling', GETDATE(), NULL),
('CUTIE Girl', 'Female', 'Setapak', 'TARUC', 'Blogging, Traveling', GETDATE(), NULL),
('Mini Lee', 'Female', 'Klang', 'TARUC', 'Photography, Cycling', GETDATE(), NULL);
SELECT * FROM users