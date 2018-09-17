// 연도별 속성별 국가 순위 매기기
// earthquakes / total_deaths / total_missing / total_injuries / total_damage_million_dollars / total_house_destroyed / total_house_damaged

Table[] NOAA_ranking = new Table[18];
Table NOAA_year;
Table country_name;
int year_total = 18;

int cntryName_rowCount = 0;

void setup(){
  country_name = loadTable("countryName.csv","header");
  cntryName_rowCount = country_name.getRowCount();
  
  for(int i=0  ; i<year_total ; i++){    
    NOAA_ranking[i] = new Table();
    NOAA_ranking[i].addColumn("year",Table.INT);
    NOAA_ranking[i].addColumn("EQ_ID",Table.INT);
    NOAA_ranking[i].addColumn("EQ_country");
    NOAA_ranking[i].addColumn("EQ_var",Table.INT);
    NOAA_ranking[i].addColumn("DH_ID",Table.INT);
    NOAA_ranking[i].addColumn("DH_country");
    NOAA_ranking[i].addColumn("DH_var",Table.INT);
    NOAA_ranking[i].addColumn("MS_ID",Table.INT);
    NOAA_ranking[i].addColumn("MS_country");
    NOAA_ranking[i].addColumn("MS_var",Table.INT);
    NOAA_ranking[i].addColumn("IN_ID",Table.INT);
    NOAA_ranking[i].addColumn("IN_country");
    NOAA_ranking[i].addColumn("IN_var",Table.INT);
    NOAA_ranking[i].addColumn("DD_ID",Table.INT);
    NOAA_ranking[i].addColumn("DD_country");
    NOAA_ranking[i].addColumn("DD_var",Table.INT);
    NOAA_ranking[i].addColumn("HT_ID",Table.INT);
    NOAA_ranking[i].addColumn("HT_country");
    NOAA_ranking[i].addColumn("HT_var",Table.INT);
    NOAA_ranking[i].addColumn("HM_ID",Table.INT);
    NOAA_ranking[i].addColumn("HM_country");
    NOAA_ranking[i].addColumn("HM_var",Table.INT);
  }
  for(int year = 0 ; year<year_total ; year++){
    NOAA_year = loadTable("NOAA_year["+year+"].csv","header");
    
    rank_EQ(NOAA_year,year);
    rank_general(NOAA_year,year);
    
    for(TableRow row : NOAA_ranking[year].rows())
      row.setInt("year",2000+year);
     
    saveTable(NOAA_ranking[year],"data/NOAA_ranking["+year+"].csv");
  }
  
  println("PROCESS#2 DONE");
}
