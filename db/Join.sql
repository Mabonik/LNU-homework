select *
from test_scheme.feed
right join test_scheme.vetclinic
on feed.shop = vetclinic.name

select *
from test_scheme.puppies
inner join test_scheme.owners
on puppies.ownerid = owners.id

select * 
from test_scheme.vetdoctor
left join test_scheme.vetclinic
on vetdoctor.clinic = vetclinic.name
left join test_scheme.feed
on feed.shop = vetclinic.name

select * 
from test_scheme.suppliers
full join test_scheme.vetclinic
on suppliers.name = vetclinic.name

select * 
from test_scheme.vetdoctor
join test_scheme.vetclinic
on TRUE

select *
from test_scheme.feed, test_scheme.vetdoctor
where feed.shop = vetdoctor.clinic