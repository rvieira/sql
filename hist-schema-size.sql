select owner, sum(mb) 
from audit_event.segments_size_hist
where audit_date = to_date('18-MAR-2019')
group by owner
order by sum(mb) desc; 
