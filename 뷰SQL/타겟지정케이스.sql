create view cqfit
	# 10대 남자의 미디어에 대한 적합도를 출력한다
as select fit.media, fit.10female
from fit, ordered, leastmoney
	# 투자가능 금액이 광고의 최소 제작 금액보다 큰 미디어만 출력한다
where ordered.max_budget>leastmoney.m_cost
	# 주문한 제품과 같은 제품에 대한 값만을 출력한다
and ordered.product_type = fit.product
and fit.media = leastmoney.media;



	# 적합도를 오름차순으로 정렬하여 효과가 좋은 미디어를 찾기 쉽게 한다
create view cqrecommend
as select media, 10female
from cqfit
order by 10female desc;

	# 적합도 top3를 출력하여 고객에게 추천한다
create view top3
as select media,10female
from cqrecommend limit 3;

	# 케이블tv의 비히클의 단가와 시청률을 고려한 단가를 출력한다
create view cqCable_channel_tv_10female
as select fit.media,rating.rank, 
	# 비히클의 단가
cablechanneltvasset.OCN,cablechanneltvasset.SPOTV,cablechanneltvasset.YTN,
	# 시청률을 고려한 단가의 가성비
((fit.10female)/(cablechanneltvasset.OCN))*rating.OCN as OCN_eff,
((fit.10female)/(cablechanneltvasset.SPOTV))*rating.SPOTV as SPOTV_eff,
((fit.10female)/(cablechanneltvasset.YTN))*rating.YTN as YTN_eff

from cablechanneltvasset,fit,rating,ordered,leastmoney

where fit.media='Cable channel tv'
and cablechanneltvasset.rank = rating.rank
and fit.product = ordered.product_type
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost;

	# 케이블tv경우와 같다
create view cqComprehensive_organization_channel_tv_10female
as select fit.media,rating.rank, comprehensiveorganizationchanneltvasset.JTBC,
comprehensiveorganizationchanneltvasset.channel_a,comprehensiveorganizationchanneltvasset.tvchosun,
((fit.10female)/(comprehensiveorganizationchanneltvasset.JTBC))*rating.JTBC as JTBC_eff,
((fit.10female)/(comprehensiveorganizationchanneltvasset.channel_a))*rating.channel_a as channel_a_eff,
((fit.10female)/(comprehensiveorganizationchanneltvasset.tvchosun))*rating.tvchosun as tvchosun_eff


from comprehensiveorganizationchanneltvasset,fit,rating,ordered,leastmoney

where fit.media='Comprehensive organization channel tv'
and comprehensiveorganizationchanneltvasset.rank = rating.rank
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;


	# 인터넷 비히클의 단가를 출력한다
create view cqinternet_10female
as select  internetasset.media,
(internetasset.Naver)as Naver,
(internetasset.Daum)as Daum,
(internetasset.Google)as Google

from fit,internetasset,ordered,leastmoney

where  internetasset.media=fit.media
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;

	# 잡지의 비히클의 단가를 출력한다
create view cqmagazine_10female
as select  magazineasset.media,
(magazineasset.WOMENSENSE_WOMEN)as WOMENSENSE_WOMEN,
(magazineasset.Vogue_fashion)as Vogue_fashion,
(magazineasset.TOPGEAR_CAR)as TOPGEAR_CAR


from fit,magazineasset,ordered,leastmoney

where magazineasset.media=fit.media
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;


	# 신문의 비히클의 단가를 출력한다
create view cqNewspaper_10female
as select  newspaperasset.media,
(newspaperasset.Chosun)as Chosun,
(newspaperasset.Donga)as Donga,
(newspaperasset.joonang)as joonang,
(newspaperasset.kyunghyang)as kyunghyang,
(newspaperasset.hanhyeore)as hanhyeore


from fit,newspaperasset,ordered,leastmoney

where newspaperasset.media=fit.media
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;

	# 라디오 비히클의 단가를 출력한다
create view cqRadio_10female
as select fit.media,rating.rank, radioasset.KBSRADIO,radioasset.MBCRADIO,radioasset.SBSRADIO,
((fit.10female)/(radioasset.KBSRADIO))*rating.KBSRADIO as KBSRADIO_eff,
((fit.10female)/(radioasset.MBCRADIO))*rating.MBCRADIO as MBCRADIO_eff,
((fit.10female)/(radioasset.SBSRADIO))*rating.SBSRADIO as SBSRADIO_eff

from radioasset,fit,rating,ordered,leastmoney

where fit.media='Radio'
and radioasset.rank = rating.rank
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;


	# 외부 광고의 비히클의 단가를 출력한다
create view cqoutdoor_10female
as select  outdoorasset.media,
(outdoorasset.AD_Price)as AD_Price

from fit,outdoorasset,ordered,leastmoney

where  outdoorasset.media=fit.media
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;

	# SNS 매체의 비히클의 단가를 출력한다
create view cqSNS_10female
as select  snsasset.media,
(snsasset.Facebook)as Facebook,
(snsasset.instagram)as instagram,
(snsasset.twitter)as twitter


from fit,snsasset,ordered,leastmoney

where  snsasset.media=fit.media
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;
	
    
	# 지상파tv의 비히클의 단가와 시청률을 고려한 단가를 출력한다
create view cqTerrestrial_channel_tv_10female
as select fit.media,rating.rank, 
	# 비히클의 단가
terrestrialchanneltvasset.kbs, terrestrialchanneltvasset.mbc,terrestrialchanneltvasset.sbs,
	# 시청률을 고려한 단가의 가성비
((fit.10female)/(terrestrialchanneltvasset.kbs))*rating.kbs as KBS_eff,
((fit.10female)/(terrestrialchanneltvasset.mbc))*rating.mbc as MBC_eff,
((fit.10female)/(terrestrialchanneltvasset.sbs))*rating.sbs as SBS_eff

from terrestrialchanneltvasset,fit,rating,ordered,leastmoney

where fit.media='Terrestrial channel tv'
and terrestrialchanneltvasset.rank = rating.rank
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;