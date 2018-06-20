-- using oracle
select t.Request_at "Day",
       round(count(case when status <> 'completed' then 1 else null end)/count(1),2) "Cancellation Rate"
from Trips t,
     Users client,
     Users driver
where t.Request_at between '2013-10-01' and '2013-10-03'
  and t.Client_Id = client.Users_Id
  and t.Driver_Id = driver.Users_Id
  and client.Banned = 'No'
  and driver.Banned = 'No'
group by t.Request_at