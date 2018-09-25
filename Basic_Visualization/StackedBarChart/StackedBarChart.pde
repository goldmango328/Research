// Stacked Bar Chart 2018.09.21
Table data;

float plotX1,plotX2;
float plotY1,plotY2;
float MINy = 2000000;
float MAXy = 0;
float MINx = 2000000;
float MAXx = 0;
float barWidth = 20;

int Colcnt = 0;

color GRID_color = color(200);
color[] STACK_COLOR = new color[3];
PFont titleFont;

void setup(){
  size(1200,600);
  noLoop();
  
  titleFont = loadFont("YDIYGO340-20.vlw");
  data = loadTable("stacked_data.csv","header");
  Colcnt = data.getColumnCount();
  
  plotX1 = 60;
  plotX2 = width - 320;
  plotY1 = 60;
  plotY2 = height - 90;
  
  STACK_COLOR[0] = color(255,72,127);
  STACK_COLOR[1] = color(169,125,206);
  STACK_COLOR[2] = color(106,114,188);
  
  // find MINy, MAXy
  for(TableRow row : data.rows()){
    float rowSum = 0;
    for(int i=1 ; i<Colcnt ; i++){
      rowSum += row.getInt(i);
    }
    if(rowSum > MAXy){
      MAXy = rowSum;
    }
    for(int i=1 ; i<Colcnt ; i++){
      if(row.getInt(i) < MINy){
        MINy = row.getInt(i);
      }
    }
  }
  // find MINx, MAXx
  for(TableRow row : data.rows()){
    if(row.getInt(0) > MAXx){
      MAXx = row.getInt(0);
    }
    if(row.getInt(0) < MINx){
      MINx = row.getInt(0);
    }
  }
}

void draw(){
  background(20);
  
  stroke(255);
  strokeWeight(1);
  line(plotX1,plotY2,plotX2,plotY2); // Horizontal :: X label line
  
  draw_VerticalGridLines(plotX1,plotY1,plotX2,plotY2);
  draw_StackedBarChart(data,plotX1,plotY1,plotX2,plotY2); // draw Stacked Bar Chart
  draw_TimeLables(data,plotX1,plotY1,plotX2,plotY2); // draw X time labels
  draw_Legend(data,plotX2,plotY2);
}
