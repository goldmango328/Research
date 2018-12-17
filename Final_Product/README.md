# Final Product  
설명 : 자율연구 프로젝트의 최종 완성본  
  
## 1. Baisc Outline  
Date : 2018.10.23.12:21:00  
내용 :  
  - 전체 화면의 가이드라인 ( Main Page / Sub Page 로 구성됨 )  
  - keyboard input & mouse input  
  ( keyboard : 'M' = Main Page / 'S' = Sub Page / 'V' = visualize gridlines )  
  
## 1-1) Main Page ScreenShot
![main_page](https://user-images.githubusercontent.com/42968884/47333610-7f240f00-d6be-11e8-812a-bb090a400906.JPG)  
#### (1) Section1 :: World Map  
구성 :  
- section[0][0] = 20; section[0][1] = 100;  
- box_height = 360; box_width = 470;  

내용 :  
- World Map Control 에서 선택한 속성들을 보여주는 지도  
- mouse input 가능 -> Sub Page 와 연동  

#### (2) Section2 :: World Map Control  
구성 :  
- section[1][0] = 20; section[1][1] = 480;  
- box_height = 300; box_width = 470;  

내용 :  
- World Map 과 연동될 속성들을 보여주는 란  
- 최대, 최소 등의 자료들을 보여주기도 하는 란으로 활용   

#### (3) Section3 :: Graph1  
구성 :  
- section[2][0] = 530; section[2][1] = section[0][1];  
- box_height = 360; box_width = 470;  

내용 :  

#### (4) Section4 :: Graph2  
구성 :  
- section[3][0] = 530; section[3][1] = section[2][1]+460+grid_gap**2;  
- box_height = 360; box_width = 470;  

내용 :  

## 1-2) Process ScreenShot  
![process_scshot 1](https://user-images.githubusercontent.com/42968884/49132295-19f7b500-f31f-11e8-8e4b-7c624d2562dc.JPG)  
Date : 2018.11.28  

## 1-3) Process ScreenShot  
![process_scshot 2](https://user-images.githubusercontent.com/42968884/50069385-27f97100-020d-11e9-975d-bba68cbcdc03.JPG)
Date : 2018.12.05  
