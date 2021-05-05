create view finalcal
as select contactacceptgenderx.product, contactacceptgenderx.media, contactacceptgenderx.10male, contactacceptgenderx.10female,
contactacceptgenderx.20male, contactacceptgenderx.20female,
contactacceptgenderx.30male, contactacceptgenderx.30female,
contactacceptgenderx.40male, contactacceptgenderx.40female,
contactacceptgenderx.50male,contactacceptgenderx.50female
, weighttotal.total
from contactacceptgenderx,weighttotal
where contactacceptgenderx.media = weighttotal.media
and contactacceptgenderx.product = weighttotal.product