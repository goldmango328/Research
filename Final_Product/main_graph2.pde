// 뱀부차트..? 수직선에다가 버블로 표현하는 차트 그리기

void draw_graph2(){
  int box_height = 200;
  int box_width = 1780-main_section[3][0];
  int box_margin = 20;
  
  int timeline_gap = 15;
  int timeline_smallgap = 8;
  int timetext_gap = 10;
  
  // Graph2 Guide Lines :: main_section[3][0], main_section[3][1]
  /*
  rectMode(CORNERS);
  fill(255,40);
  rect(main_section[3][0],main_section[3][1],main_section[3][0]+box_width,main_section[3][1]+box_height);
  
  fill(255);
  textAlign(CENTER,CENTER);
  textFont(title_font);
  textSize(36);
  text("Graph2",(2*main_section[3][0]+box_width)/2,(2*main_section[3][1]+box_height)/2);
  */
  
  stroke(255,120);
  strokeWeight(3);
  int timeline_sx = main_section[3][0]+box_margin;
  int timeline_ex = main_section[3][0]+box_width-box_margin;
  int timelineY = main_section[3][1]+box_height/2;
  
  line(timeline_sx,timelineY,timeline_ex,timelineY);
  line(timeline_sx,timelineY-timeline_gap,timeline_sx,timelineY+timeline_gap);
  line(timeline_ex,timelineY-timeline_gap,timeline_ex,timelineY+timeline_gap);  
  
  // 년도마다 수직선에 표시하기 위한 for문
  for(int year  = start_year ; year <= end_year ; year++){
    float timelineX = map(year,start_year,end_year,timeline_sx,timeline_ex);
    strokeWeight(1);
    line(timelineX,timelineY-timeline_smallgap,timelineX,timelineY+timeline_smallgap);  
    
    textFont(tab_font);
    textSize( year == start_year || year == end_year ? 15: 10);
    text(str(year),timelineX,timelineY+timeline_gap+timetext_gap);
  }
  
  // Table에서 자료 가져와서 보여주는 for문
  int type = 0 ; // 개선해야할 점 : type종류도 정해서 코드로 정해둘것
  // 0 :: EQ_primary
  // 1 :: Deaths
  color[] typeColor = new color[3];
  typeColor[0] = #FF9090;
  typeColor[1] = #F8FF43;
  
  // 개선해야할 점 : 날짜 계산을 지금은 임의로 1년에 360일로 계산, 한 달에 30일씩 -> 정확도를 높여야 함
  // 개선해야할 점 : 명확하게 원이 잘 드러나지 않는 다는 점, 색상 변경 / 사이즈 변경 혹의 방법이 필요
  // 개선해야할 점 : 각 데이터의 minimum, maximum을 구해야 mapping을 할 수 있음
  // 개선해야할 점 : 사용자가 minimum, maximum을 조절할 수 있게끔 하여 시각화의 편의성
  
  for(int year = start_year ; year <= end_year ; year++){
    for(TableRow row : NOAA_year[year-2000].rows()){
      //float raw_value = row.getFloat("EQ_primary");
      float raw_value = row.getFloat("deaths");
      int years = row.getInt("year");
      int months = row.getInt("month");
      int days = row.getInt("day");
      int total_days = (years-start_year)*360 + (months-1)*30 + days;
      float x = map(total_days,0,360*(end_year-start_year+1),timeline_sx,timeline_ex);
      float value = map(raw_value,5,10,1,30);
      
      //fill(typeColor[0],50);
      fill(typeColor[1],50);
      noStroke();
      ellipseMode(CENTER);
      ellipse(x,timelineY,value,value);
      println(years+":"+months+":"+days+". values:"+raw_value+"\n");
    }
  }
      
}
