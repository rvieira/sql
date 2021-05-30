select country_id, country_name, count(*)
from countries2
group by country_id, country_name
having count(*) > 1;
