create view bqfit
	# 모든타겟의 미디어에 대한 적합도를 출력한다
as select fit.media, fit.10male,fit.10female ,
fit.20male,fit.20female,
fit.30male,fit.30female,
fit.40male,fit.40female,
fit.50male,fit.50female
from fit, ordered, leastmoney
	# 투자가능 금액이 광고의 최소 제작 금액보다 큰 미디어만 출력한다
where ordered.max_budget>leastmoney.m_cost
	# 주문한 제품과 같은 제품에 대한 값만을 출력한다
and ordered.product_type = fit.product
and fit.media = leastmoney.media;

# 순위의 타겟이 50남성을 가정


	# 케이블tv의 비히클의 단가와 시청률을 고려한 단가를 출력한다
create view bqCable_channel_tv_50female
as select fit.media,rating.rank, 
	# 비히클의 단가
cablechanneltvasset.OCN,cablechanneltvasset.SPOTV,cablechanneltvasset.YTN,
	# 시청률을 고려한 단가의 가성비
((fit.50female)/(cablechanneltvasset.OCN))*rating.OCN as OCN_eff,
((fit.50female)/(cablechanneltvasset.SPOTV))*rating.SPOTV as SPOTV_eff,
((fit.50female)/(cablechanneltvasset.YTN))*rating.YTN as YTN_eff

from cablechanneltvasset,fit,rating,ordered,leastmoney

where fit.media='Cable channel tv'
and cablechanneltvasset.rank = rating.rank
and fit.product = ordered.product_type
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost;

	# 케이블tv경우와 같다
create view bqComprehensive_organization_channel_tv_50female
as select fit.media,rating.rank, comprehensiveorganizationchanneltvasset.JTBC,
comprehensiveorganizationchanneltvasset.channel_a,comprehensiveorganizationchanneltvasset.tvchosun,
((fit.50female)/(comprehensiveorganizationchanneltvasset.JTBC))*rating.JTBC as JTBC_eff,
((fit.50female)/(comprehensiveorganizationchanneltvasset.channel_a))*rating.channel_a as channel_a_eff,
((fit.50female)/(comprehensiveorganizationchanneltvasset.tvchosun))*rating.tvchosun as tvchosun_eff


from comprehensiveorganizationchanneltvasset,fit,rating,ordered,leastmoney

where fit.media='Comprehensive organization channel tv'
and comprehensiveorganizationchanneltvasset.rank = rating.rank
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;


	# 인터넷 비히클의 단가를 출력한다
create view bqinternet_50female
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
create view bqmagazine_50female
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
create view bqNewspaper_50female
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
create view bqRadio_50female
as select fit.media,rating.rank, radioasset.KBSRADIO,radioasset.MBCRADIO,radioasset.SBSRADIO,
((fit.50female)/(radioasset.KBSRADIO))*rating.KBSRADIO as KBSRADIO_eff,
((fit.50female)/(radioasset.MBCRADIO))*rating.MBCRADIO as MBCRADIO_eff,
((fit.50female)/(radioasset.SBSRADIO))*rating.SBSRADIO as SBSRADIO_eff

from radioasset,fit,rating,ordered,leastmoney

where fit.media='Radio'
and radioasset.rank = rating.rank
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;


	# 외부 광고의 비히클의 단가를 출력한다
create view bqoutdoor_50female
as select  outdoorasset.media,
(outdoorasset.AD_Price)as AD_Price

from fit,outdoorasset,ordered,leastmoney

where  outdoorasset.media=fit.media
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;

	# SNS 매체의 비히클의 단가를 출력한다
create view bqSNS_50female
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
create view bqTerrestrial_channel_tv_50female
as select fit.media,rating.rank, 
	# 비히클의 단가
terrestrialchanneltvasset.kbs, terrestrialchanneltvasset.mbc,terrestrialchanneltvasset.sbs,
	# 시청률을 고려한 단가의 가성비
((fit.50female)/(terrestrialchanneltvasset.kbs))*rating.kbs as KBS_eff,
((fit.50female)/(terrestrialchanneltvasset.mbc))*rating.mbc as MBC_eff,
((fit.50female)/(terrestrialchanneltvasset.sbs))*rating.sbs as SBS_eff

from terrestrialchanneltvasset,fit,rating,ordered,leastmoney

where fit.media='Terrestrial channel tv'
and terrestrialchanneltvasset.rank = rating.rank
and leastmoney.media = fit.media
and ordered.max_budget>leastmoney.m_cost
and fit.product = ordered.product_type;