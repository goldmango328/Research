// 세계지도 관련된 function 정리

void draw_worldmap(){
  int box_height = 360;
  int box_width = 470;
  
  rectMode(CORNERS);
  fill(255,40);
  rect(main_section[0][0],main_section[0][1],main_section[0][0]+box_width,main_section[0][1]+box_height);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textSize(36);
  text("World Map",(2*main_section[0][0]+box_width)/2,(2*main_section[0][1]+box_height)/2);
  
  control_worldmap();
  grid_worldmap(main_section[0][0]+box_width+grid_gap*2, main_section[0][1]);
}

void control_worldmap(){
  int box_height = 300;
  int box_width = 470;
  
  tabbox_top = (main_section[1][1] + box_height/2);
  tabbox_bottom = (main_section[1][1] +box_height/2)+30;
  tabbox_width = 60;
  tabbox_height = tabbox_bottom - tabbox_top;
  
  tabboxLeft[0] = main_section[1][0] + grid_gap*2;
  tabboxRight[0] = tabboxLeft[0] + tabbox_width;
  texttabboxLeft[0] = tabboxRight[0];
  texttabboxRight[0] = texttabboxLeft[0] + tabbox_width*2;
  
  // Horizontal 
  /*
  tabboxLeft[1] = texttabboxRight[0] + 40;
  tabboxRight[1] = tabboxLeft[1] + tabbox_width;
  texttabboxLeft[1] = tabboxRight[1];
  texttabboxRight[1] = texttabboxLeft[0] + tabbox_width;
  */
  
  // Vertical
  tabboxLeft[1] = tabboxLeft[0];
  tabboxRight[1] = tabboxRight[0];
  texttabboxLeft[1] = texttabboxLeft[0];
  texttabboxRight[1] = texttabboxRight[0];
  
  noStroke();
  fill(TAB_color);
  rectMode(CORNERS);
  rect(tabboxLeft[0],tabbox_top,tabboxRight[0],tabbox_bottom);
  rect(tabboxLeft[1],tabbox_top+tabbox_height+10,tabboxRight[1],tabbox_bottom+tabbox_height+10);
  
  fill(255,80);
  rect(texttabboxLeft[0],tabbox_top,texttabboxRight[0],tabbox_bottom);
  rect(texttabboxLeft[1],tabbox_top+tabbox_height+10,texttabboxRight[1],tabbox_bottom+tabbox_height+10);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(tab_font);
  textSize(12);
  text("START", (tabboxLeft[0]+tabboxRight[0])/2,tabbox_top+tabbox_height/2);
  text("END",(tabboxLeft[1]+tabboxRight[1])/2,tabbox_top+tabbox_height/2+tabbox_height+10);
  textSize(14);
  text(str(start_year),(texttabboxLeft[0]+texttabboxRight[0])/2,tabbox_top+tabbox_height/2);
  text(str(end_year),(texttabboxLeft[1]+texttabboxRight[1])/2,tabbox_top+tabbox_height/2+tabbox_height+10);
  /*
  rectMode(CORNERS);
  fill(255,40);
  rect(main_section[1][0],main_section[1][1],main_section[1][0]+box_width,main_section[1][1]+box_height);
  
  textAlign(CENTER,CENTER);
  textSize(36);
  fill(255);
  text("World Map Control",(2*main_section[1][0]+box_width)/2,(2*main_section[1][1]+box_height)/2);
  */
  
}

void grid_worldmap(int x, int y){
  stroke(255);
  strokeWeight(2);
  line(x,y,x,height-grid_gap);
}
