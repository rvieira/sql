select 
	c.*, c3.*
from 
	countries c full join
	countries3 c3 on (c.country_id = c3.country_id)
where 
	c.country_id is null or c3.country_id is null;
