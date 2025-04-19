create database project;
use project;
select * from quotes_data;

-- To normalize the data to 1NF form  we have used recursive cte ,so that we can split the comma separated values in each row .
-- Here we have used substring_index to get initial rows and substring to get the pending tags .
create table authors as(
with recursive common as(
select ï»¿Author,Quote,
substring_index(TagNames,",",1) as tag,
substring(TagNames,length(substring_index(TagNames,",",1))+2) as pending_tags
from quotes_data
where TagNames is not null
union all
select ï»¿Author,Quote,
substring_index(pending_tags,",",1) as tag,
substring(pending_tags,length(substring_index(pending_tags,",",1))+2) as pending_tags
from common
where pending_tags<>'')
select ï»¿Author,Quote,tag
from common);

alter table authors
rename column ï»¿Author to Author;
select * from authors;

-- conversion to 2nf form and 3nf form.
-- In the above table we can see that there is a need to remove the redudancy.
-- Creating the quots_details table to store unique quotes .
create table quotes_details(
QuoteID int auto_increment primary key,
Author varchar(255),
Quotes text
);

-- Inserting unique quotes into the quotes table to remove duplicates.
insert into quotes_details(Author, Quotes)
select distinct Author,Quote
from authors;

select * from quotes_details;

-- Creating the tags_details table to store unique tags.
create table tags_details(
TagID int auto_increment primary key,
TagName varchar(255)
);

-- changing auto_increment to 100 so that it can start from 100.
alter table tags_details auto_increment=100;
-- Inserting distinct tags from authors table 
insert into tags_details(TagName)
select distinct tag
from authors;

select * from tags_details;

-- Creating a table to link quoteid and tagid so that a relationship can be established.
create table quote_tag(
QuoteID int,
TagID int,
Primary key(QuoteID, TagID),
foreign key(QuoteID) references quotes_details(QuoteID),
foreign key(TagID) references tags_details(TagID)
);

-- Insert relationships into the table by inserting quotes and tags with joning authors table to get the proper data.
insert into quote_tag(QuoteID, TagID)
select q.QuoteID, t.TagID
from authors a
join quotes_details q on q.Author = a.Author 
and a.Quote = q.Quotes
join tags_details t on a.tag = t.TagName;

select * from quote_tag;

-- To get the number of quotes we grouped the table by author name with count aggregate and distinct constraint 
-- to have unique quotes as the table contains same quotes for a partiular author to have proper insights which author has the most number of quotes  
-- Find the number of quotes by each author.
select Author,count(Quotes) as num_quotes
from quotes_details
group by Author;


-- The use of group by clause to get count of each tag  ordered in descending to get the most 5 common tags.
-- List the top 5 most common tags.
select q.TagID,t.TagName,count(q.TagID) as total_tags
from quote_tag q
join tags_details t  
on t.TagID=q.TagID
group by q.TagID
order by total_tags desc
limit 5;

-- To get the number of quotes we first grouped the table by author name with count aggregate to know number of quotes by each author.
-- Along with it we have used having clause to define the condition that number of quotes should be greater than 5.
-- Find authors who have more than 5 quotes.
select Author,count(Quotes) as num_quotes
from quotes_details
group by Author
having num_quotes>5;

-- To know which author has longest quote we need to use length function to know the length of each quote but here we want to know about 
-- longest so here we will go with subquery,where subquery will be used to get the maximum quote length by using max function.
-- Retrieve the longest quote and its author.
select Author,Quotes
from quotes_details
where length(Quotes)=(select max(length(Quotes)) from quotes_details);



