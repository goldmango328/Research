// Sub Graph1
// 국가별 지진 발생에 대한 분석(제일 중요함)
// draw_subgraph1 :: 국가별 지진 발생 사건에 대한 그래프
// 미리 그리드로 표현해놓자 ->
int CountryNum = 97;

// SelectBar에서 96개를 한번에 보여주는게 아니라 아래에 slidebar / 항목을 보여줄수있게끔 만들어서~
void draw_selectBar1(){
  int box_width = 150;
  noStroke();
  
  subtypeboxLeft = sub_section[0][0];
  subtypeboxRight = subtypeboxLeft + box_width;
  subtypeboxTop[0] = sub_section[0][1];             subtypeboxBottom[0] = subtypeboxTop[0]+typebox_height;
  for(int i=1 ; i<6 ; i++){
    subtypeboxTop[i] = subtypeboxBottom[i-1]+grid_gap;
    subtypeboxBottom[i] = subtypeboxTop[i]+typebox_height;
  }
  
  for(int i=0 ; i<6 ; i++){
    fill(255,80);
    rect(subtypeboxLeft,subtypeboxTop[i],subtypeboxRight,subtypeboxBottom[i]);
    fill(BOX_color);
    rect(subtypeboxLeft,subtypeboxTop[i],subtypeboxLeft+typebox_height,subtypeboxBottom[i]);
      
    fill(255);
    textAlign(CENTER,CENTER);
    textFont(tab_font);
    textSize(12);
    text(columnName[i], (subtypeboxLeft+subtypeboxRight+typebox_height)/2,(subtypeboxTop[i]+subtypeboxBottom[i])/2);   
  }
}

void draw_selectBar2(){
  int box_height = 80;
  int box_width = width-20-sub_section[2][0];
  
  // selectArea1 Guide Lines
  stroke(255);
  rectMode(CORNERS);
  fill(255,40);
  rect(sub_section[5][0], sub_section[5][1], sub_section[5][0]+box_width, sub_section[5][1]+box_height);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(title_font);
  textSize(20);
  text("SelectArea_2", (2*sub_section[5][0]+box_width)/2, (2*sub_section[5][1]+box_height)/2);
}

void draw_selectBar3(){
  int box_height = 680;
  int box_width = 150;
  
  // selectArea1 Guide Lines
  stroke(255);
  rectMode(CORNERS);
  fill(255,40);
  rect(sub_section[0][0], sub_section[0][1]+240, sub_section[0][0]+box_width, sub_section[0][1]+box_height);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(title_font);
  textSize(20);
  text("SelectArea", (2*sub_section[0][0]+box_width)/2, (2*sub_section[0][1]+box_height+230)/2);
}

// sub_MAINgraph
void draw_subgraph1(){
  int box_height = 680;
  int box_width = 1080;
  
  int horz_grid = 30;
  int vert_grid = 30;
  
  strokeWeight(1.5);
  stroke(255,80);
  
  // 4 방향 기준선
  line(sub_section[1][0]+box_width/2, sub_section[1][1], sub_section[1][0]+box_width/2, sub_section[1][1]+box_height);
  line(sub_section[1][0], sub_section[1][1]+box_height/2, sub_section[1][0]+box_width, sub_section[1][1]+box_height/2);
  
  // x축 그리드선
  for(int x=0 ; x<=box_width/2 ; x++){
    if(x%horz_grid == 0){
      stroke(255,20);
      line(x+sub_section[1][0],sub_section[1][1],x+sub_section[1][0],sub_section[1][1]+box_height);
      line(x+sub_section[1][0]+box_width/2, sub_section[1][1], x+sub_section[1][0]+box_width/2, sub_section[1][1]+box_height);
    }
  }
  // y축 그리드선
  for(int y=0 ; y<=box_height/2; y++){
    if(y%vert_grid == 0){
      line(sub_section[1][0], sub_section[1][1]+box_height/2-y,sub_section[1][0]+box_width,sub_section[1][1]+box_height/2-y);
      line(sub_section[1][0], sub_section[1][1]+box_height/2+y,sub_section[1][0]+box_width,sub_section[1][1]+box_height/2+y);
    }
  }
  
  // 4 방향 기준선끝의 화살표 모양 -> 이를 알려주는 text자리도 필요함
  // 위 :: 지진의 강도가 큼
  triangle(sub_section[1][0]+box_width/2, sub_section[1][1]-2, sub_section[1][0]+box_width/2-2,sub_section[1][1]+2, sub_section[1][0]+box_width/2+2,sub_section[1][1]+2);
  textAlign(LEFT,TOP);
  textSize(20);
  text("Up",sub_section[1][0]+box_width/2+10, sub_section[1][1]);
  
  // 아래 :: 지진의 강도가 약함
  triangle(sub_section[1][0]+box_width/2, sub_section[1][1]+box_height+2, sub_section[1][0]+box_width/2-2,sub_section[1][1]+box_height-2, sub_section[1][0]+box_width/2+2, sub_section[1][1]+box_height-2);
  textAlign(LEFT,BOTTOM);
  textSize(20);
  text("Down",sub_section[1][0]+box_width/2+10, sub_section[1][1]+box_height);
  
  // 왼쪽 :: 지진으로 인한 피해가 약함
  triangle(sub_section[1][0]-3,sub_section[1][1]+box_height/2,sub_section[1][0],sub_section[1][1]+box_height/2-2, sub_section[1][0], sub_section[1][1]+box_height/2+2);
  textAlign(LEFT,TOP);
  textSize(20);
  text("Left",sub_section[1][0]-3, sub_section[1][1]+box_height/2+10);
  
  // 오른쪽 :: 지진으로 인한 피해가 큼
  triangle(sub_section[1][0]+box_width+3, sub_section[1][1]+box_height/2,sub_section[1][0]+box_width,sub_section[1][1]+box_height/2-2,sub_section[1][0]+box_width,sub_section[1][1]+box_height/2+2);
  textAlign(RIGHT,TOP);
  textSize(20);
  text("Right",sub_section[1][0]+box_width, sub_section[1][1]+box_height/2+10);
  
  strokeWeight(1);
  
  draw_BubbleChart(NOAA_country[selectedCountry], sub_section[1][0],sub_section[1][1], sub_section[1][0]+box_width, sub_section[1][1]+box_height); 
  /*
  // Graph1 Guide Lines
  stroke(255);
  rectMode(CORNERS);
  fill(255,40);
  rect(sub_section[1][0],sub_section[1][1],sub_section[1][0]+box_width,sub_section[1][1]+box_height);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(title_font);
  textSize(36);
  text("Sub_Graph1",(2*sub_section[1][0]+box_width)/2,(2*sub_section[1][1]+box_height)/2);
  */
}
