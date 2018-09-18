//Visualizing Bar chart graph
Table data;
float[] plotX1 = new float[2];
float[] plotX2 = new float[2];
float[] plotY1 = new float[2];
float[] plotY2 = new float[2];

float MINy = 2000000;
float MAXy = 0;
float MINx = 2000000;
float MAXx = 0;
float yInterval = 10;
float barWidth = 50;

color BOX_color = color(38,177,250);
color GRID_color = color(200);

PFont titleFont;
PFont valueFont;

void setup(){
  size(1600,600);
  
  titleFont = loadFont("YDIYGO340-20.vlw");
  valueFont = loadFont("YDIYGO310-20.vlw");
  data = loadTable("BarChart.csv","header");
  plotX1[0] = 30;
  plotX2[0] = width/2 - 30;
  plotY1[0] = 60;
  plotY2[0] = height - plotY1[0]; 
  
  // 여러 데이터를 이용해서 보여주려고 할 때 plot좌표 배열, data 배열 정리하는 방법이 필요할듯
  //countrydata = loadTable("Country.csv","header");
  plotX1[1] = width/2 + 90;
  plotX2[1] = width - 30;
  plotY1[1] = plotY1[0];
  plotY2[1] = plotY2[0];
  
  // find MINy, MAXy
  for(TableRow row : data.rows()){
    if(row.getInt(1) > MAXy){
      MAXy = row.getInt(1);
    }
    if(row.getInt(1) < MINy){
      MINy = row.getInt(1);
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
  background(255);
  
  stroke(200);
  strokeWeight(3);
  line(plotX1[0],plotY2[0],plotX2[0],plotY2[0]); // Horizontal :: X label line
  line(plotX1[1],plotY1[1],plotX1[1],plotY2[1]); // Vertical :: Y label Line
  
  draw_VerticalGridLines(plotX1[0],plotY1[0],plotX2[0],plotY2[0]); // drawGridLines
  draw_VerticalBarChart(data,plotX1[0],plotY1[0],plotX2[0],plotY2[0]); // draw Vertical BarChart
  drawLabelTitle(plotX1[0],plotY2[0],"Vertical Bar Chart"); // draw Label Title
  
  draw_HorizontalGridLines(plotX1[1],plotY1[1],plotX2[1],plotY2[1]); // drawGridLines
  draw_HorizontalBarChart(data,plotX1[1],plotY1[1],plotX2[1],plotY2[1]); // draw Horizontal BarChart
  drawLabelTitle(plotX1[1],plotY2[1],"Horizontal Bar Chart"); // draw Label Title
  
}
