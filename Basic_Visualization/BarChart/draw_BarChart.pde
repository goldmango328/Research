void draw_VerticalGridLines(float x1,float y1,float x2,float y2){
  int gap = 20;
  
  stroke(GRID_color);
  strokeWeight(1);
  
  for(float y = MINy ; y <= MAXy ; y++){
    if(y % yInterval == 0){
      float val = map(y,MAXy,MINy,y1+gap,y2-gap);
      // grid text
      textSize(10);
      textFont(titleFont);
      fill(GRID_color);
      textAlign(LEFT,CENTER);
      text((int)y, x2, val);
      // grid line
      line(x1,val,x2-gap,val);
    }
  } 
}

void draw_HorizontalGridLines(float x1,float y1,float x2,float y2){
  int gap = 10;
  int yInterval = 10;
  
  stroke(GRID_color);
  strokeWeight(1);
  
  for(float y = MINy ; y <= MAXy ; y++){
    if(y % yInterval == 0){
      float val = map(y,MINy,MAXy,x1+gap,x2-gap);
      // grid text
      textSize(10);
      textFont(titleFont);
      fill(GRID_color);
      textAlign(CENTER);
      text((int)y, val, y2+10);
      
      // grid line
      line(val,y1,val,y2-10);
    }
  } 
}

void draw_VerticalBarChart(Table data,float x1,float y1,float x2,float y2){
  noStroke();
  rectMode(CORNERS);
  fill(BOX_color);
  int gap = 20;
  
  for(TableRow row : data.rows()){
    int time = row.getInt(0);
    int val = row.getInt(1);
    float x = map(time,MINx,MAXx,x1+50,x2-50);
    float y = map(val,MAXy,MINy,y1+gap,y2-gap);
    rect(x-barWidth/2,y,x+barWidth/2,y2);
    
    textSize(15);
    fill(BOX_color);
    textAlign(CENTER);
    text(val, x,y-10);
  }
}

void draw_HorizontalBarChart(Table data,float x1,float y1,float x2, float y2){
  noStroke();
  rectMode(CORNERS);
  fill(BOX_color);
  int gap = 20;
  int barWidth = 30;
  float cnt = 1;
  data.sort(1);
  
  // 정렬해서 가장 큰 게 위로 오도록 만들어야 함
  for(TableRow row : data.rows()){
    int val = row.getInt(1);
    print("val:"+val+"\n");
    float x = map(val,MINy,MAXy,x1+gap,x2-gap);
    float y = map(cnt,MAXx,MINx,y1+gap,y2-gap); // X,Y 좌표를 다루는 것에 유의! 특히 y mapping 중요
    rect(x1,y-barWidth/2,x,y+barWidth/2);
    cnt++;
    
    textSize(15);
    fill(BOX_color);
    textAlign(LEFT, CENTER);
    text(val, x+10,y);
  }
}

void drawLabelTitle(float x, float y,String title){
  fill(0);
  textSize(20);
  textFont(titleFont);
  textAlign(LEFT,CORNER);
  text(title,x,y+40);
}
