create view weighttotal
as select product,media,((10male+20male+30male+40male+50male+
10female+20female+30female+40female+50female)/10) as total
from contactacceptgenderx