select * from (
SELECT '<tr><td>'||owner||'</td>',
'<td>'||segment_name||'</td>',
'<td>'||segment_type||'</td>',
'<td>'|| round(bytes/1024/1024,2) ||'</td></tr>' used_space_m 
FROM dba_segments  ORDER BY bytes DESC ) where rownum < 11;
