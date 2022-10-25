-- Table: public.singers
insert into public.singers (nickname) values ('Sting'); 
insert into public.singers (nickname) values ('Robbie Williams'); 
insert into public.singers (nickname) values ('Klaus Meine'); 
insert into public.singers (nickname) values ('Juanes'); 
insert into public.singers (nickname) values ('Madonna'); 
insert into public.singers (nickname) values ('George Michael'); 
insert into public.singers (nickname) values ('Александр Васильев'); 
insert into public.singers (nickname) values ('Леонид Агутин'); 
insert into public.singers (nickname) values ('Филипп Киркоров'); 
insert into public.singers (nickname) values ('Юрий Шевчук'); 

-- Table: public.genres
insert into public.genres (name) values ('rock'); 
insert into public.genres (name) values ('pop'); 
insert into public.genres (name) values ('dance'); 
insert into public.genres (name) values ('blues'); 
insert into public.genres (name) values ('русский поп'); 
insert into public.genres (name) values ('русский рок'); 

-- Table: public.albums
insert into public.albums (title, year) values ('Album 2002', 2002); 
insert into public.albums (title, year) values ('Album 2003', 2003); 
insert into public.albums (title, year) values ('Album 2004', 2004); 
insert into public.albums (title, year) values ('Album 2005', 2005); 
insert into public.albums (title, year) values ('Album 2006', 2006); 
insert into public.albums (title, year) values ('Album 2007', 2007); 
insert into public.albums (title, year) values ('Album 2008', 2008); 
insert into public.albums (title, year) values ('Album 2009', 2009); 
insert into public.albums (title, year) values ('Album 2010', 2010); 
insert into public.albums (title, year) values ('Album 2011', 2011); 
insert into public.albums (title, year) values ('Album 2012', 2012);  
insert into public.albums (title, year) values ('Album 2018 1', 2018);
insert into public.albums (title, year) values ('Album 2018 2', 2018);
insert into public.albums (title, year) values ('Album 2018 3', 2018);
insert into public.albums (title, year) values ('Album 2019 1', 2019);
insert into public.albums (title, year) values ('Album 2019 2', 2019);
insert into public.albums (title, year) values ('Album 2020 1', 2020);
insert into public.albums (title, year) values ('Album 2020 2', 2020);

-- Table: public.tracks
insert into public.tracks (title, duration, albumId) values ('Track 01', 180, 1); 
insert into public.tracks (title, duration, albumId) values ('Track 02', 240, 1); 
insert into public.tracks (title, duration, albumId) values ('Track 03', 150, 2); 
insert into public.tracks (title, duration, albumId) values ('Track 04', 195, 3); 
insert into public.tracks (title, duration, albumId) values ('Track 05', 180, 4); 
insert into public.tracks (title, duration, albumId) values ('Track 06', 165, 4); 
insert into public.tracks (title, duration, albumId) values ('Track 07', 220, 5); 
insert into public.tracks (title, duration, albumId) values ('Track 08', 240, 5); 
insert into public.tracks (title, duration, albumId) values ('Track 09', 135, 5); 
insert into public.tracks (title, duration, albumId) values ('Track 10', 195, 6); 
insert into public.tracks (title, duration, albumId) values ('Track 11', 150, 6); 
insert into public.tracks (title, duration, albumId) values ('Track 12', 150, 6); 
insert into public.tracks (title, duration, albumId) values ('Track 13', 180, 6); 
insert into public.tracks (title, duration, albumId) values ('Track 14', 180, 7); 
insert into public.tracks (title, duration, albumId) values ('Track 15', 240, 8); 
insert into public.tracks (title, duration, albumId) values ('Track 16', 235, 8); 
insert into public.tracks (title, duration, albumId) values ('Track 17', 175, 9); 
insert into public.tracks (title, duration, albumId) values ('Track 18', 125, 10); 
insert into public.tracks (title, duration, albumId) values ('Track 19', 150, 11); 
insert into public.tracks (title, duration, albumId) values ('Track 20', 180, 11);
insert into public.tracks (title, duration, albumId) values ('My way', 228, 9); 
insert into public.tracks (title, duration, albumId) values ('Ты мой бред', 300, 5); 
insert into public.tracks (title, duration, albumId) values ('Return my car', 180, 8);  
insert into public.tracks (title, duration, albumId) values ('Track 111111', 180, 15);
insert into public.tracks (title, duration, albumId) values ('Track 22222', 195, 15);
insert into public.tracks (title, duration, albumId) values ('Track 3333', 480, 16);
insert into public.tracks (title, duration, albumId) values ('Track 4444', 320, 17);
insert into public.tracks (title, duration, albumId) values ('Track 66666', 175, 17);
insert into public.tracks (title, duration, albumId) values ('Track 555', 240, 18); 


-- Table: public.collections
insert into public.collections (title, year_release) values ('Collection 01', 2005); 
insert into public.collections (title, year_release) values ('Collection 02', 2002); 
insert into public.collections (title, year_release) values ('Collection 03', 2008); 
insert into public.collections (title, year_release) values ('Collection 04', 2008); 
insert into public.collections (title, year_release) values ('Collection 05', 2007); 
insert into public.collections (title, year_release) values ('Collection 06', 2014); 
insert into public.collections (title, year_release) values ('Collection 07', 2014); 
insert into public.collections (title, year_release) values ('Collection 08', 2003); 
insert into public.collections (title, year_release) values ('Collection 09', 2015); 
insert into public.collections (title, year_release) values ('Collection 10', 2015); 
insert into public.collections (title, year_release) values ('Collection 11', 2018); 
insert into public.collections (title, year_release) values ('Collection 12', 2018); 
insert into public.collections (title, year_release) values ('Collection 13', 2019); 
insert into public.collections (title, year_release) values ('Collection 14', 2019); 
insert into public.collections (title, year_release) values ('Collection 15', 2020); 


-- Table: public.singersgenres
insert into public.singersgenres (singerId, genreId) values (1, 1); 
insert into public.singersgenres (singerId, genreId) values (1, 2); 
insert into public.singersgenres (singerId, genreId) values (2, 1); 
insert into public.singersgenres (singerId, genreId) values (2, 2); 
insert into public.singersgenres (singerId, genreId) values (2, 3); 
insert into public.singersgenres (singerId, genreId) values (3, 1); 
insert into public.singersgenres (singerId, genreId) values (4, 2); 
insert into public.singersgenres (singerId, genreId) values (5, 2); 
insert into public.singersgenres (singerId, genreId) values (5, 3);
insert into public.singersgenres (singerId, genreId) values (6, 2); 
insert into public.singersgenres (singerId, genreId) values (6, 4);  
insert into public.singersgenres (singerId, genreId) values (7, 6);   
insert into public.singersgenres (singerId, genreId) values (8, 5);  
insert into public.singersgenres (singerId, genreId) values (9, 5);   
insert into public.singersgenres (singerId, genreId) values (10, 6); 

-- Table: public.singersalbums
insert into public.singersalbums (singerId, albumId) values (1, 1); 
insert into public.singersalbums (singerId, albumId) values (1, 2); 
insert into public.singersalbums (singerId, albumId) values (1, 3); 
insert into public.singersalbums (singerId, albumId) values (2, 1); 
insert into public.singersalbums (singerId, albumId) values (2, 3); 
insert into public.singersalbums (singerId, albumId) values (2, 4); 
insert into public.singersalbums (singerId, albumId) values (3, 5); 
insert into public.singersalbums (singerId, albumId) values (4, 6); 
insert into public.singersalbums (singerId, albumId) values (5, 5); 
insert into public.singersalbums (singerId, albumId) values (5, 5);
insert into public.singersalbums (singerId, albumId) values (6, 7); 
insert into public.singersalbums (singerId, albumId) values (6, 8);  
insert into public.singersalbums (singerId, albumId) values (7, 6);   
insert into public.singersalbums (singerId, albumId) values (8, 9);  
insert into public.singersalbums (singerId, albumId) values (9, 8);   
insert into public.singersalbums (singerId, albumId) values (10, 9);  
insert into public.singersalbums (singerId, albumId) values (1, 16);  
insert into public.singersalbums (singerId, albumId) values (2, 15);  


-- Table: public.trackscollections
insert into public.trackscollections (trackId, collectionId) values (1, 1);
insert into public.trackscollections (trackId, collectionId) values (2, 1);
insert into public.trackscollections (trackId, collectionId) values (3, 1);
insert into public.trackscollections (trackId, collectionId) values (4, 2);
insert into public.trackscollections (trackId, collectionId) values (5, 2);
insert into public.trackscollections (trackId, collectionId) values (6, 3);
insert into public.trackscollections (trackId, collectionId) values (7, 3);
insert into public.trackscollections (trackId, collectionId) values (8, 3);
insert into public.trackscollections (trackId, collectionId) values (9, 4);
insert into public.trackscollections (trackId, collectionId) values (10, 5);
insert into public.trackscollections (trackId, collectionId) values (11, 6);
insert into public.trackscollections (trackId, collectionId) values (12, 6);
insert into public.trackscollections (trackId, collectionId) values (13, 6);
insert into public.trackscollections (trackId, collectionId) values (14, 7);
insert into public.trackscollections (trackId, collectionId) values (15, 8);
insert into public.trackscollections (trackId, collectionId) values (16, 8);
insert into public.trackscollections (trackId, collectionId) values (17, 9);
insert into public.trackscollections (trackId, collectionId) values (18, 9);
insert into public.trackscollections (trackId, collectionId) values (19, 10);
insert into public.trackscollections (trackId, collectionId) values (20, 10);
insert into public.trackscollections (trackId, collectionId) values (1, 2);
insert into public.trackscollections (trackId, collectionId) values (2, 3);
insert into public.trackscollections (trackId, collectionId) values (1, 4);
insert into public.trackscollections (trackId, collectionId) values (2, 5);




















