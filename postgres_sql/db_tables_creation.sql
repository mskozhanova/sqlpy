/*Main tables*/
create table if not exists Genres (
	id serial primary key,
	name varchar(255) not null
);
create table if not exists Singers (
	id serial primary key,
	nickname varchar(255) not null
);
create table if not exists Albums (
	id serial primary key,
	title varchar(255) not null,
	year integer not null
);
create table if not exists Tracks (
	id serial primary key,
	title varchar(255) not null,
	duration integer not null,
	albumId integer not null references Albums(id)
);
create table if not exists Collections (
	id serial primary key,
	title varchar(255) not null,
	year_release integer not null
);
/*Relation tables*/
create table if not exists SingersGenres (
	id serial primary key,
	singerId integer not null references Singers(id),
	genreId integer not null references Genres(id)
);
create table if not exists SingersAlbums (
	id serial primary key,
	singerId integer not null references Singers(id),
	albumId integer not null references Albums(id)
);
create table if not exists TracksCollections (
	id serial primary key,
	trackId integer not null references Tracks(id),
	collectionId integer not null references Collections(id)
);
