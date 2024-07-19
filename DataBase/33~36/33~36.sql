-- select title, author from books;
-- select *from books where rate>=4.0;
-- select title,price from books where review>=100;
-- select title,price from books where price <20000;
-- select*from books where ranking_weeks>=4;
-- select*from books where author='최태성 저';
-- select*from books where publish='이투스북';

-- select author,count(*) as book_count from books group by author;
-- select publish,count(*) as pub_count from books group by publish order by pub_count desc limit 1;
-- select author, avg(rate) as author_rt from books group by author order by author_rt desc limit 1;
-- select title, author, ranking from books order by ranking limit 10;
-- select *from books order by sales desc,  review desc limit 10;
-- select * from books order by publishing desc limit 5;

-- select author, avg(rate) as author_rate from books group by author order by author_rate desc;
-- select publishing, count(*) as pub_count from books group by publishing order by pub_count desc;
-- select title, avg(price) as avg_price from books group by title order by avg_price desc;
-- select*from books order by review desc limit 5;
-- select ranking, avg(review) as avg_review from books group by ranking order by avg_review desc;

-- select title, rate from books where rate>(select avg(rate) from books) order by rate desc;
-- select title, price from books where price>(select avg(price) from books) order by price desc;
-- select title,review from books where review>(select max(review) from books)
-- select title, sales from books where sales<(select avg(sales) from books);
-- select title,author,publishing from books 
-- where author = (select author from books group by author order by count(*) desc limit 1)
-- order by publishing desc limit 1;

-- update books set price=14500 where bookid=155;
-- update books set title='누가 내머리에 똥쌌어!' where bookid=151;
-- delete from books where sales=(SELECT min(sales) from books); /똑같이 쳤는데 실행x 참조하는 동시에 delete하려고 해서 발생
-- update books set rate=rate+1 where publish='대원';

-- select author,avg(rate) as av_rate, avg(sales) as av_sales from books group by author
-- order by av_rate desc, av_sales desc;

-- select publishing,avg(price) from books group by publishing
-- order by avg(price) asc;

-- select publish,count(*),avg(review) from books group by publish
-- order by count(*) desc, avg(review) desc;

-- select ranking,avg(sales) from books group by ranking order by ranking;
-- select price,avg(review),avg(rate) from books group by price order by avg(review) desc, avg(rate) asc; 

-- select author, publish,avg(sales) from books
-- group by author,publish
-- order by publish,avg(sales) desc limit 1;

-- select title,review,price from books
-- where review>(select avg(review) from books) and
-- price<(select avg(price) from books)

-- select author, count(distinct title) as dif_title from books
-- group by author order by dif_title desc limit 1;
-- select title, author, max(sales) as max_sales from books group by author/ only_full_group_by 모드로 실행 불가

/*여기서부터 mysql이 테이블에 연결되지않아 코드 확인을 못했습니다.*/
-- select year(publishing)as year, count(*), avg(price) from books 
-- group by year;

-- select publish, max(rate)-min(rate) as gap from books
-- group by publish
-- order by gap desc limit 1;

-- select title, rating/sales as ratio from books
-- where author='최태성 저'
-- order by ratio desc limit 1 