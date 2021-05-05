create view contactweightx
as select product.product, contact.media, 
((0.15343681328851777*contact.10s + 
0.06818203845609318*contactimage.10s+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.10s)*
contactusingx.10s) as 10s,

((0.15343681328851777*contact.20s + 
0.06818203845609318*contactimage.20s+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.20s)*
contactusingx.20s) as 20s,

((0.15343681328851777*contact.30s + 
0.06818203845609318*contactimage.30s+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.30s)*
contactusingx.30s) as 30s,

((0.15343681328851777*contact.40s + 
0.06818203845609318*contactimage.40s+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.40s)*
contactusingx.40s) as 40s,

((0.15343681328851777*contact.50s + 
0.06818203845609318*contactimage.50s+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.50s)*
contactusingx.50s) as 50s,

((0.15343681328851777*contact.male + 
0.06818203845609318*contactimage.male+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.male)*
contactusingx.male) as male,

((0.15343681328851777*contact.female + 
0.06818203845609318*contactimage.female+
0.2518322868906848*ad_notice.ad_interest+
0.2175290719616281*ad_notice.ad_attention +
0.3090197894030762*product.female)*
contactusingx.female) as female


from contact,contactusingx,ad_notice,contactimage,product,media_group


where contact.media = media_group.media
and media_group.grou = contactimage.media
and media_group.grou = contactusingx.media
and media_group.grou = ad_notice.media
