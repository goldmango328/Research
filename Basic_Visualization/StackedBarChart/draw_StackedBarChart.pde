void draw_StackedBarChart(Table data,float x1,float y1,float x2,float y2){
  // need to be set in Column_count
  
  noStroke();
  rectMode(CORNERS);
  
  for(TableRow row : data.rows()){
    float[] stack_val = new float[Colcnt-1];
    for(int i = 0 ; i<Colcnt-1 ; i++){
      float val = row.getInt(i+1);
      stack_val[i] = val;
      if(i>0){
        stack_val[i] += stack_val[i-1];
        print("row#["+i+"]:"+stack_val[i]+"\n");
      }
    }
    for(int i = Colcnt-2 ; i>=0 ; i--){
      fill(STACK_COLOR[i]);
      float x = map(row.getInt(0),MINx,MAXx,x1+50,x2-50);
      float y = map(stack_val[i],MAXy,MINy,y1+20,y2-20);
      rect(x-barWidth/2,y,x+barWidth/2,y2);
    }
  }
}

void draw_VerticalGridLines(float x1,float y1,float x2,float y2){
  int gap = 20;
  float yInterval = 20000;
  
  stroke(GRID_color,100);
  strokeWeight(1);
  
  for(float y = MINy ; y <= MAXy ; y++){
    if(y % yInterval == 0){
      float val = map(y,MAXy,MINy,y1+gap,y2-gap);
      // grid text
      textSize(3);
      textFont(titleFont);
      fill(GRID_color);
      textAlign(LEFT,CENTER);
      text((int)y, x2, val);
      
      // grid line
      line(x1,val,x2-gap,val);
    }
  } 
}

void draw_TimeLables(Table data,float x1, float y1, float x2, float y2){
  fill(GRID_color);
  textSize(10);
  textAlign(CENTER,TOP);
  
  stroke(224);
  strokeWeight(1);
  
  for(TableRow row : data.rows()){
    float x = map(row.getInt(0), MINx, MAXx, x1+50, x2-50);
    text(row.getInt(0), x, y2+5);
  }
}

void draw_Legend(Table data,float x,float y){
  float edge = 120;
  float box_edge = 20;
  noFill();
  stroke(224);
  rectMode(CORNERS);
  
  x = x+80;
  noStroke();
  fill(STACK_COLOR[2]);
  rect(x,y-edge,x+box_edge, y-edge+box_edge);
  
  textAlign(LEFT,CENTER);
  fill(224);
  textSize(15);
  text("TEA",x+box_edge+10,(y-edge+box_edge/2));
  
  y = y-edge+box_edge+10;
  noStroke();
  fill(STACK_COLOR[1]);
  rect(x,y,x+box_edge, y+box_edge);
  
  textAlign(LEFT,CENTER);
  fill(224);
  textSize(15);
  text("COFFEE",x+box_edge+10,(y+box_edge/2));
  
  y = y+box_edge+10;
  noStroke();
  fill(STACK_COLOR[0]);
  rect(x,y,x+box_edge, y+box_edge);
  
  textAlign(LEFT,CENTER);
  fill(224);
  textSize(15);
  text("MILK",x+box_edge+10,(y+box_edge/2));
}
