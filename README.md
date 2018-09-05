# SASA_Personal_Research(자율연구)  
CATALOG : SASA_Personal_Research > processing_data  

여기에서는 데이터를 가공하는 과정에 대한 코드를 저장한다.  
본 연구에서의 데이터 가공 과정은 크게 ***3가지 과정*** 을 거친다. 

## 1. DATA Reliability Check(데이터 신뢰도 평가)  
Project : 수집한 NOAA 데이터와 USGS 데이터를 비교하여 NOAA 데이터의 신뢰도를 판단한다    
  
Date : 2018.09.04. 22:44:00  
Edit : Create file  
  
========= RESULT =========  
* NOAA data_size : 1016  
* USGS data_size : 409283  
* Matches : 906
* Match Percentage : 88.76%  

========================  
Date : 2018.09.04. 23:07:00  
Edit :  
- add comparing "minute"
  
========= RESULT =========  
* NOAA data_size : 1016  
* USGS data_size : 409283  
* Matches : 858
* Match Percentage : 84.44882%  

========================  
Date : 2018.09.05. 13:58:00  
Edit :  
- edit USGS_data  
  (find & replace missed data)  
  
========= RESULT =========  
* NOAA data_size : 1016  
* USGS data_size : 429200  
* Matches : 970  
* Match Percentage : 95.47244%  

========================  
Date : 2018.09.05. 17:55:00  
Edit :  
- find missed data on USGS
( find similar data )
  
========= RESULT =========  
* NOAA data_size : 1016  
* USGS data_size : 429200  
* Matches : 1004 
* Match Percentage : 98.8189%  

========================  
