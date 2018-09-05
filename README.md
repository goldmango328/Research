# SASA_Personal_Research(자율연구)  
CATALOG : SASA_Personal_Research > parsing_data  

여기에서는 데이터를 추출하는 과정에 대한 코드를 저장한다.  
본 연구에서의 데이터 추출 과정은 크게 ***2가지 과정*** 을 거친다. 

## 1. USGS_Earthquakes data
Project : USGS 에서 제공하는 데이터를 저장해둠   
URL : https://earthquake.usgs.gov/earthquakes/feed/  
Specific : 데이터의 특성  
  *강도()이상, 위치() 등  
  
Date : 2018.05.15   
Edit :  
  *parsing data  
  *create file  
  
=========================  
  Date : 2018.09.05  
  Edit :  
    *Problems with data  
    *missing data & wrong data  
    -2000.07.01-2000.12.31  
    -2003.07.01-2003.12.31  
    -2005.01.01-2005.06.30  
    -2005.07.01-2005.12.31  
    
=========================  

## 2. NOAA_significant_Earthquakes data  
Project : NOAA에서 제공하는 데이터를 저장해둠  
URL : https://www.ngdc.noaa.gov/nndc/struts/form?t=101650&s=1&d=1  
Specific : 데이터의 특성(significant earthquake의 조건)  
   *강도()이상, 위치() 등
   
Date : 2018.08.29  
Edit :  
  *parsing data  
  *create file  
