create view contactacceptgenderx
as select product,media,10s*male as 10male, 10s*female as 10female,
20s*male as 20male, 20s*female as 20female,
30s*male as 30male, 30s*female as 30female,
40s*male as 40male, 40s*female as 40female,
50s*male as 50male, 50s*female as 50female
from contactweightx

