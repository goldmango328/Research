// Personal_Research > processing_data 
// Making_NOAA_year
// 연도별 지진발생횟수를 정리하는 코드

Table NOAA;
Table[] NOAA_year = new Table[18];

int rowCount = 0;
int yearCount = 18;

void setup(){
  // NOAA 데이터를 받아오자
  NOAA = loadTable("NOAA_2000_2017.csv","header");
  rowCount = NOAA.getRowCount();
  
  for(int i=0 ; i<yearCount ; i++){
    NOAA_year[i] = new Table();
    NOAA_year[i].addColumn("I_D");
    NOAA_year[i].addColumn("focal_depth",Table.INT);
    NOAA_year[i].addColumn("EQ_primary",Table.FLOAT);
    NOAA_year[i].addColumn("intensity",Table.INT);
    NOAA_year[i].addColumn("country");
    NOAA_year[i].addColumn("state");
    NOAA_year[i].addColumn("latitude",Table.FLOAT);
    NOAA_year[i].addColumn("longitude",Table.FLOAT);
    NOAA_year[i].addColumn("region_code",Table.INT);
    NOAA_year[i].addColumn("deaths",Table.INT);
    NOAA_year[i].addColumn("deaths_description",Table.INT);
    NOAA_year[i].addColumn("missing",Table.INT);
    NOAA_year[i].addColumn("missing_description",Table.INT);
    NOAA_year[i].addColumn("injuries",Table.INT);
    NOAA_year[i].addColumn("injuries_description",Table.INT);
    NOAA_year[i].addColumn("damage_millions_dollars",Table.INT);
    NOAA_year[i].addColumn("damage_description",Table.INT);
    NOAA_year[i].addColumn("house_destroyed",Table.INT);
    NOAA_year[i].addColumn("house_destroyed_description",Table.INT);
    NOAA_year[i].addColumn("house_damaged",Table.INT);
    NOAA_year[i].addColumn("house_damaged_description",Table.INT);
    NOAA_year[i].addColumn("total_deaths",Table.INT);
    NOAA_year[i].addColumn("total_missing",Table.INT);
    NOAA_year[i].addColumn("total_injuries",Table.INT);
    NOAA_year[i].addColumn("total_damage_million_dollars",Table.INT);
    NOAA_year[i].addColumn("total_house_destroyed",Table.INT);
    NOAA_year[i].addColumn("total_house_damaged",Table.INT);
  }
  
  for(TableRow NOAA_Row : NOAA.rows()){
    int year = NOAA_Row.getInt("YEAR");
    year -= 2000;
    
    TableRow addRow = NOAA_year[year].addRow();
    addRow.setInt("I_D",NOAA_Row.getInt("I_D"));
    addRow.setInt("focal_depth",NOAA_Row.getInt("FOCAL_DEPTH"));
    addRow.setFloat("EQ_primary",NOAA_Row.getFloat("EQ_PRIMARY"));
    addRow.setInt("intensity",NOAA_Row.getInt("INTENSITY"));
    addRow.setString("country",NOAA_Row.getString("COUNTRY"));
    addRow.setString("state",NOAA_Row.getString("STATE"));
    addRow.setString("location_name",NOAA_Row.getString("LOCATION_NAME"));
    addRow.setFloat("latitude",NOAA_Row.getFloat("LATITUDE"));
    addRow.setFloat("longitude",NOAA_Row.getFloat("LONGITUDE"));
    addRow.setInt("region_code",NOAA_Row.getInt("REGION_CODE"));
    addRow.setInt("deaths",NOAA_Row.getInt("DEATHS"));
    addRow.setInt("deaths_description",NOAA_Row.getInt("DEATHS_DESCRIPTION"));
    addRow.setInt("missing",NOAA_Row.getInt("MISSING"));
    addRow.setInt("missing_description",NOAA_Row.getInt("MISSING_DESCRIPTION"));
    addRow.setInt("injuries",NOAA_Row.getInt("INJURIES"));
    addRow.setInt("injuries_description",NOAA_Row.getInt("INJURIES_DESCRIPTION"));
    addRow.setInt("damage_millions_dollars",NOAA_Row.getInt("DAMAGE_MILLIONS_DOLLARS"));
    addRow.setInt("damage_description",NOAA_Row.getInt("DAMAGE_DESCRIPTION"));
    addRow.setInt("house_destroyed",NOAA_Row.getInt("HOUSES_DESTROYED"));
    addRow.setInt("house_destroyed_description",NOAA_Row.getInt("HOUSES_DESTROYED_DESCRIPTION"));
    addRow.setInt("house_damaged",NOAA_Row.getInt("HOUSES_DAMAGED"));
    addRow.setInt("house_damaged_description",NOAA_Row.getInt("HOUSES_DAMAGED_DESCRIPTION"));
    addRow.setInt("total_deaths",NOAA_Row.getInt("TOTAL_DEATHS"));
    addRow.setInt("total_missing",NOAA_Row.getInt("TOTAL_MISSING"));
    addRow.setInt("total_injuries",NOAA_Row.getInt("TOTAL_INJURIES"));
    addRow.setInt("total_damage_million_dollars",NOAA_Row.getInt("TOTAL_DAMAGE_MILLIONS_DOLLARS"));
    addRow.setInt("total_house_destroyed",NOAA_Row.getInt("TOTAL_HOUSES_DESTROYED"));
    addRow.setInt("total_house_damaged",NOAA_Row.getInt("TOTAL_HOUSES_DAMAGED"));
  }
  
  println("Process is Done!");
  for(int i=0 ; i<yearCount ; i++){
    saveTable(NOAA_year[i],"data/NOAA_year["+i+"].csv");
    println("Saved "+str(2000+i)+"!");
  }
}
