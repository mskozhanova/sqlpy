-- количество исполнителей в каждом жанре;
SELECT t3.name as genre_name, count(distinct t1.nickname) as count_singers
FROM public.singers t1
join public.singersgenres t2 on t1.id = t2.singerId
join public.genres t3 on t3.id = t2.genreId
group by t3.id
order by count_singers desc;

-- количество треков, вошедших в альбомы 2019-2020 годов;
SELECT count(*) as count_tracks 
FROM public.tracks t1
join public.albums t2 on t1.albumId = t2.id
where t2.year between 2019 and 2020 

-- средняя продолжительность треков по каждому альбому;
SELECT round(avg(duration), 3) as avg_duration_in_seconds 
FROM public.tracks t1 

-- все исполнители, которые не выпустили альбомы в 2020 году;
SELECT t1.nickname  as singer_nickname 
FROM public.singers t1
where t1.id not in (
	select t2.id from public.singers  t2
	join public.singersalbums t3 on t2.id = t3.singerId
	join public.albums t4 on t4.id = t3.albumId
	where t4.year = 2020
)

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT distinct t1.title  as collection_title   
FROM public.collections t1
join public.trackscollections t2 on t1.id = t2.collectionId
join public.tracks t3 on t3.id = t2.trackId
join public.singersalbums t4 on t4.albumId = t3.albumId
join public.singers t5 on t5.id = t4.singerId
where t5.nickname = 'Madonna'

-- название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT distinct t1.title  as albumn_title     
FROM public.albums t1
join public.singersalbums t4 on t4.albumId = t1.id
where t4.singerId in (
	SELECT   t3.id   
	FROM   public.singers t3
	join public.singersgenres t2 on t2.singerId = t3.id
	join public.genres t5 on t5.id = t2.genreId
	group by t3.id 
	having count(distinct t5.id) > 1
)
 
 
-- наименование треков, которые не входят в сборники;
SELECT distinct t3.title  as track_title 
FROM public.tracks t3
left join public.trackscollections t2 on t3.id = t2.trackId 
where t2.trackId is null

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT distinct t1.nickname, t3.duration   
FROM public.singers t1
join public.singersalbums t2 on t1.id = t2.singerId
join public.tracks t3 on t3.albumId = t2.albumId 
where t3.duration  in (
	SELECT  min(t31.duration)
	FROM public.singers t11
	join public.singersalbums t21 on t11.id = t21.singerId
	join public.tracks t31 on t31.albumId = t21.albumId  
)


-- название альбомов, содержащих наименьшее количество треков.
	SELECT  t2.title 
	FROM public.tracks t1
	join public.albums t2 on t2.id = t1.albumId 
	group by t2.id   
	having count(distinct t1.id) in (
			SELECT count(distinct t1.id) 
			FROM public.tracks t1
			join public.albums t2 on t2.id = t1.albumId 
			group by t2.id 
			order by count(distinct t1.id) asc limit 1
	)


