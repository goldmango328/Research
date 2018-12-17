// Sub Graph3
// 국가별 지진 발생에 대한 분석(제일 중요함) -> small graphs
// draw_subgraph2 :: 

void draw_subgraph3(){
  int box_height = 180;
  int box_width = width-20-sub_section[2][0];
 
  // Graph2 Guide Lines
  stroke(255);
  rectMode(CORNERS);
  fill(255,40);
  rect(sub_section[3][0],sub_section[3][1],sub_section[3][0]+box_width,sub_section[3][1]+box_height);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(title_font);
  textSize(36);
  text("Sub_Graph3",(2*sub_section[3][0]+box_width)/2,(2*sub_section[3][1]+box_height)/2);
}
