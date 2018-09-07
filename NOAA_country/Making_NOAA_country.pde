// Personal_Research > processing_data > Making_countryName_list > data
// 국가별 속성을 정리해두는 코드

int countryRowCount = 0;

Table countryName;
Table NOAA;
Table[] NOAA_country = new Table[countryRowCount];

void setup(){
  // countryName으로부터 이름 받아오기
  countryName = loadTable("countryName.csv","header");
  countryRowCount = countryName.getRowCount();
  println("total CountryCNT is "+countryRowCount);
  
  // countryName에 맞추어서 NOAA_country 선언해두기
  for(int i = 0 ; i < countryRowCount ; i++){
    NOAA_country[i].addColumn("year",Table.INT);
    NOAA_country[i].addColumn("month",Table.INT);
    NOAA_country[i].addColumn("day",Table.INT);
    NOAA_country[i].addColumn("hour",Table.INT);
    NOAA_country[i].addColumn("minute",Table.INT);
    NOAA_country[i].addColumn("second",Table.INT);
    NOAA_country[i].addColumn("focal_depth",Table.INT);
    NOAA_country[i].addColumn("EQ_primary",Table.FLOAT);
    NOAA_country[i].addColumn("intensity",Table.INT);
    // NOAA_country[i].addColumn("country");
    NOAA_country[i].addColumn("state");
    NOAA_country[i].addColumn("location_name");
    NOAA_country[i].addColumn("latitude",Table.FLOAT);
    NOAA_country[i].addColumn("longitude",Table.FLOAT);
    NOAA_country[i].addColumn("region_code",Table.INT);
    NOAA_country[i].addColumn("deaths",Table.INT);
    NOAA_country[i].addColumn("deaths_description",Table.INT);
    NOAA_country[i].addColumn("missing",Table.INT);
    NOAA_country[i].addColumn("missing_description",Table.INT);
    NOAA_country[i].addColumn("injuries",Table.INT);
    NOAA_country[i].addColumn("injuries_description",Table.INT);
    NOAA_country[i].addColumn("damage_millions_dollars",Table.INT);
    NOAA_country[i].addColumn("damage_description",Table.INT);
    NOAA_country[i].addColumn("house_destroyed",Table.INT);
    NOAA_country[i].addColumn("house_destroyed_description",Table.INT);
    NOAA_country[i].addColumn("house_damaged",Table.INT);
    NOAA_country[i].addColumn("house_damaged_description",Table.INT);
    NOAA_country[i].addColumn("total_deaths",Table.INT);
    NOAA_country[i].addColumn("total_missing",Table.INT);
    NOAA_country[i].addColumn("total_injuries",Table.INT);
    NOAA_country[i].addColumn("total_damage_million_dollars",Table.INT);
    NOAA_country[i].addColumn("total_house_destroyed",Table.INT);
    NOAA_country[i].addColumn("total_house_damaged",Table.INT);
  }
  
  // NOAA데이터 받아오기
  NOAA = loadTable("NOAA_2000_2017.csv","header");
  for(TableRow NOAA_Row : NOAA.rows()){
    String country = NOAA_Row.getString("COUNTRY");
    TableRow cntryRow = countryName.findRow(country,"country");
    int idx = cntryRow.getInt("index");
    idx -= 1;
    
    TableRow addRow = NOAA_country[idx].addRow();
    addRow.setInt("year",NOAA_Row.getInt("YEAR"));
    addRow.setInt("month",NOAA_Row.getInt("MONTH"));
    addRow.setInt("day",NOAA_Row.getInt("DAY"));
    addRow.setInt("hour",NOAA_Row.getInt("HOUR"));
    addRow.setInt("minute",NOAA_Row.getInt("MINUTE"));
    addRow.setInt("second",NOAA_Row.getInt("SECOND"));
    addRow.setInt("focal_depth",NOAA_Row.getInt("FOCAL_DEPTH"));
    addRow.setFloat("EQ_primary",NOAA_Row.getFloat("EQ_PRIMARY"));
    addRow.setInt("intensity",NOAA_Row.getInt("INTENSITY"));
    addRow.setString("state",NOAA_Row.getString("STATE"));
    addRow.setString("location_name",NOAA_Row.getString("LOCATION_NAME"));
    addRow.setFloat("latitude",NOAA_Row.getFloat("LATITUDE"));
    addRow.setFloat("longitude",NOAA_Row.getFloat("LONGITUDE"));
    addRow.setInt("region_code",NOAA_Row.getInt("REGION_NAME"));
    addRow.setInt("deaths",NOAA_Row.getInt("DEATHS"));
    addRow.setInt("deaths_description",NOAA_Row.getInt("DEATHS_DESCRIPTION"));
    addRow.setInt("missing",NOAA_Row.getInt("MISSING"));
    addRow.setInt("missing_description",NOAA_Row.getInt("MISSING_DESCRIPTION"));
    addRow.setInt("injuries",NOAA_Row.getInt("INJURIES"));
    addRow.setInt("injuries_description",NOAA_Row.getInt("INJURIES_DESCRIPTION"));
    addRow.setInt("damage_millions_dollars",NOAA_Row.getInt("DAMAGE_MILLIONS_DOLLARS"));
    addRow.setInt("daamge_description",NOAA_Row.getInt("DAMAGE_DESCRIPTION"));
    addRow.setInt("house_destroyed",NOAA_Row.getInt("HOUSES_DESTROYED"));
    addRow.setInt("house_destroyed_description",NOAA_Row.getInt("HOUSES_DESTROYED_DESCRIPTION"));
    addRow.setInt("house_damaged",NOAA_Row.getInt("HOUSES_DAMAGED"));
    addRow.setInt("house_damaged_description",NOAA_Row.getInt("HOUSES_DAMAGED_DESCRIPTION"));
    addRow.setInt("total_deaths",NOAA_Row.getInt("TOTAL_DEATHS"));
    addRow.setInt("total_missing",NOAA_Row.getInt("TOTAL_MISSING"));
    addRow.setInt("total_injuries",NOAA_Row.getInt("TOTAL_INJURIES"));
    addRow.setInt("total_damage_million_dollars",NOAA_Row.getInt("TOTAL_DAMAGE_MILLION_DOLLARS"));
    addRow.setInt("total_house_destroyed",NOAA_Row.getInt("TOTAL_HOUSE_DESTROYED"));
    addRow.setInt("total_house_damaged",NOAA_Row.getInt("TOTAL_HOUSE_DAMAGED"));
  }
  
  println("Process! Done!");
  for(int i = 0 ; i < countryRowCount ; i++){
    TableRow cntryRow = countryName.getRow(i);
    String country = cntryRow.getString("country");
    saveTable(NOAA_country[i],"data/NOAA_country["+i+"]_"+country);
    println("Saved "+country+ "!");
  }  
}
