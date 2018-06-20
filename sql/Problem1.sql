-- using oracle

-- question 1
select count(1)
from 
(select pvisit.msisdn,
       sum(pvisit.pv) pv
 from PAGEVISIT pvisit,
      USER_INFO uinfo
 where pvisit.msisdn = uinfo.msisdn
   and uinfo.sex = '男'
   and pvisit.record_day between '20171001' and '20171007'
 group by pvisit.msisdn) nt
where pv > 100;

-- question 2
select msisdn
from
(select msisdn,
	sum(rpad(1, to_date('20171008','YYYYMMDD') - to_date(record_day,'YYYYMMDD'),0)) pvlist
	from PAGEVISIT pvisit
	where pvisit.record_day between '20171001' and '20171007' 
    and pv > 0 
 group by msisdn)
where instr(pvlist,'111') > 0;