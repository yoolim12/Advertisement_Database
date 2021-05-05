INSERT fit (product,media, 10male,10female,20male,20female,30male,30female,40male,40female,50male,50female,total)

select ordered.product_type,contactacceptgenderx.media,contactacceptgenderx.10male,contactacceptgenderx.10female ,
contactacceptgenderx.20male,contactacceptgenderx.20female,
contactacceptgenderx.30male,contactacceptgenderx.30female,
contactacceptgenderx.40male,contactacceptgenderx.40female,
contactacceptgenderx.50male,contactacceptgenderx.50female,
weighttotal.total
from contactacceptgenderx,ordered,weighttotal
where contactacceptgenderx.media= weighttotal.media