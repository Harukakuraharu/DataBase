--таблица "жанр"
create table if not exists Genres (
	genre_id SERIAL primary key,
	genre_name VARCHAR(15) not null
);

--таблица "исполнитель"
create table if not exists Artists (
	artist_id SERIAL primary key,
--genre_id INTEGER references Genres(genre_id),
	artist_name VARCHAR(50) not null
);

--связывающая таблица "жанр-исполнитель"
create table if not exists Genre_Artist (
	id SERIAL primary key,
	genre_id INTEGER references Genres(genre_id),
	artist_id INTEGER references Artists(artist_id)
);

--таблица "альбом"
create table if not exists Albums (
	album_id SERIAL primary key,
--artist_id INTEGER references Artists(artist_id),
	name_album VARCHAR(30) not null,
	year_release DATE not null	
);

--связывающая таблица "альбом-исполнитель"
create table if not exists Album_Artist (
	id SERIAL primary key,
	album_id INTEGER references Albums(album_id),
	artist_id INTEGER references Artists(artist_id)
);	
	
--таблица "трек/песня"
create table if not exists Songs (
	song_id SERIAL primary key,
	album_id INTEGER references Albums(album_id),
	name_song VARCHAR(50) not null,
	duration_song TIME not null	
);

--таблица "сборник"
create table if not exists Collections (
	collection_id SERIAL primary key,
	name_collection VARCHAR(50) not null,
	year_release DATE not null	
);
--связывающая таблица "сборник-трек/песня"	
create table if not exists Collection_Song (
	id SERIAL primary key,
	collection_id INTEGER references Collections(collection_id),
	song_id INTEGER references Songs(song_id)
);	
	
