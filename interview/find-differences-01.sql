select 
	c.*
from 
	countries c left join
	countries3 c3 on (c.country_id = c3.country_id)
where 
	c3.country_id is null;
