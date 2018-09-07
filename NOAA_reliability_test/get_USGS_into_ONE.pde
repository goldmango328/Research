Table[] EarthQuakeTable = new Table[2];
Table EQ_total_Table = new Table();
float dataMin = 100000;
float dataMax = 0;
int Total_EarthQuake = 0;

void setup(){
  EQ_total_Table.addColumn("time");
  EQ_total_Table.addColumn("lat");
  EQ_total_Table.addColumn("log");
  EQ_total_Table.addColumn("mag");
  EQ_total_Table.addColumn("place");
  
  for(int year = 0 ; year<=17 ; year++){
    if(year<10){
      EarthQuakeTable[0] = loadTable("200"+year+".01.01-200"+year+".06.30.csv","header");
      EarthQuakeTable[1] = loadTable("200"+year+".07.01-200"+year+".12.31.csv","header");
    }
    else{
      EarthQuakeTable[0] = loadTable("20"+year+".01.01-20"+year+".06.30.csv","header");
      EarthQuakeTable[1] = loadTable("20"+year+".07.01-20"+year+".12.31.csv","header");
    }
    
    for( int i=0 ; i<2 ; i++){
      for(TableRow row : EarthQuakeTable[i].rows()){
        String type = row.getString("type");
        
        if(type.equals("earthquake") == true){
          TableRow newRow = EQ_total_Table.addRow();
          newRow.setString("time",row.getString("time"));
          newRow.setFloat("lat",row.getInt("latitude"));
          newRow.setFloat("log",row.getInt("longitude"));
          newRow.setString("mag",row.getString("mag"));
          newRow.setString("place",row.getString("place"));
          Total_EarthQuake += 1;
          print("Finding..");
        }
      }
    }
  }
  saveTable(EQ_total_Table,"data/USGS_data.csv");
  println("Total EarthQuake :"+Total_EarthQuake);
  println("Process Done!");
}
