Table USGS_Table;
Table NOAA_Table;
Table Miss_Table = new Table();

int USGS_total = 0;
int NOAA_total = 0;
int Miss_Count = 0;

int check(int y1,int y2,int m1,int m2,int d1,int d2,int h1,int h2,int M1,int M2){
  if(y1==y2 && m1==m2 && d1==d2 && h1==h2 && M1==M2){
    return 1;
  }
  else return 0;
}

void setup(){
  USGS_Table = loadTable("USGS_data.csv","header");
  NOAA_Table = loadTable("WER_2000_2017.csv","header");
  Miss_Table.addColumn("year");
  Miss_Table.addColumn("month");
  Miss_Table.addColumn("day");
  Miss_Table.addColumn("hour");
  Miss_Table.addColumn("minute");
  Miss_Table.addColumn("country");
  Miss_Table.addColumn("state");
  
  USGS_total = USGS_Table.getRowCount();
  NOAA_total = NOAA_Table.getRowCount();
  int MATCH = 0;
  
  for(TableRow NOAArow : NOAA_Table.rows()){
      int checked = 0;
      int y = NOAArow.getInt("YEAR");
      int m = NOAArow.getInt("MONTH");
      int d = NOAArow.getInt("DAY");
      int h = NOAArow.getInt("HOUR");
      int M = NOAArow.getInt("MINUTE");
      for(TableRow USGSrow : USGS_Table.rows()){
        String USGS_time = USGSrow.getString("time");
        int year = 2000+(USGS_time.charAt(2)-'0')*10+(USGS_time.charAt(3)-'0');
        int month = (USGS_time.charAt(5)-'0')*10+(USGS_time.charAt(6)-'0');
        int day = (USGS_time.charAt(8)-'0')*10+(USGS_time.charAt(9)-'0');
        
        int hour = (USGS_time.charAt(11)-'0')*10+(USGS_time.charAt(12)-'0');
        int min = (USGS_time.charAt(14)-'0')*10+(USGS_time.charAt(15)-'0');
        // print("hour: "+hour+" min: "+min+"\n");
        if(check(y,year,m,month,d,day,h,hour,M,min)==1){
          MATCH += 1;
          checked = 1;
          break;
        }
      }
      if(checked == 0){
        Miss_Count += 1;
        TableRow addRow = Miss_Table.addRow();
        addRow.setInt("year",y);
        addRow.setInt("month",m);
        addRow.setInt("day",d);
        addRow.setInt("hour",h);
        addRow.setInt("minute",M);
        addRow.setString("country",NOAArow.getString("COUNTRY"));
        addRow.setString("state",NOAArow.getString("STATE"));
        print(y,m,d,h,M,NOAArow.getString("COUNTRY"),NOAArow.getString("STATE")+"\n");
      }
  }
  MATCH += Miss_Count - 12;
  print("USGS :"+USGS_total+" NOAA :"+NOAA_total+"\n");
  print("Match :"+MATCH+" Percentage:" + (MATCH/float(NOAA_total))*100+"\n");
  print("Miss_Count : "+12+"\n");
  print("Done!");
  saveTable(Miss_Table,"data/Missed.csv");
}
