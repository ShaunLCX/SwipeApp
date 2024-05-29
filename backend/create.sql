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
('Suki Tan', 'Female', 'Damansara', 'UCSI', 'Acting, Cooking', GETDATE(), NULL);

SELECT * FROM users