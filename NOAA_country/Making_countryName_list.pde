// processing_data > country_name_list
// NOAA 데이터에서 국가 이름 리스트를 만드는 코드 

Table countryName;
Table NOAA;

int cnt = 1;

void setup(){
  //countryName 속성
  countryName = new Table();
  countryName.addColumn("index",Table.INT);
  countryName.addColumn("country");
  
  NOAA = loadTable("NOAA_2000_2017.csv","header");
  
  for(TableRow NOAArow : NOAA.rows()){
    boolean exist = false;
    String country = NOAArow.getString("COUNTRY");
    for(TableRow Namerow : countryName.rows()){
      if(Namerow.getString("country").equals(country) == true){
        exist = true;
        break;
      }
    }
    if(exist == false){
      TableRow newRow = countryName.addRow();
      newRow.setInt("index",cnt);
      newRow.setString("country",country);
      cnt++;
    }
  }
  
  print("Finding Countries Name is done!");
  print("Total country: "+cnt+"\n");
  saveTable(countryName, "data/countryName.csv");
  print("Saved!");
}
