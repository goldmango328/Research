// Ranking NOAA total
Table NOAA_total;
Table NOAA_sort;
Table NOAA_year;
Table country_name;
int year_total = 18;

int cntryName_rowCount = 0;

void setup(){
  country_name = loadTable("countryName.csv","header");
  cntryName_rowCount = country_name.getRowCount();
  
  NOAA_total = new Table();
  NOAA_total.addColumn("EQ_ID",Table.INT);
  NOAA_total.addColumn("EQ_country");
  NOAA_total.addColumn("EQ_var",Table.INT);
  NOAA_total.addColumn("DH_ID",Table.INT);
  NOAA_total.addColumn("DH_country");
  NOAA_total.addColumn("DH_var",Table.INT);
  NOAA_total.addColumn("MS_ID",Table.INT);
  NOAA_total.addColumn("MS_country");
  NOAA_total.addColumn("MS_var",Table.INT);
  NOAA_total.addColumn("IN_ID",Table.INT);
  NOAA_total.addColumn("IN_country");
  NOAA_total.addColumn("IN_var",Table.INT);
  NOAA_total.addColumn("DD_ID",Table.INT);
  NOAA_total.addColumn("DD_country");
  NOAA_total.addColumn("DD_var",Table.INT);
  NOAA_total.addColumn("HT_ID",Table.INT);
  NOAA_total.addColumn("HT_country");
  NOAA_total.addColumn("HT_var",Table.INT);
  NOAA_total.addColumn("HM_ID",Table.INT);
  NOAA_total.addColumn("HM_country");
  NOAA_total.addColumn("HM_var",Table.INT);
  
  NOAA_sort = new Table();
  NOAA_sort.addColumn("EQ_ID",Table.INT);
  NOAA_sort.addColumn("EQ_country");
  NOAA_sort.addColumn("EQ_var",Table.INT);
  NOAA_sort.addColumn("DH_ID",Table.INT);
  NOAA_sort.addColumn("DH_country");
  NOAA_sort.addColumn("DH_var",Table.INT);
  NOAA_sort.addColumn("MS_ID",Table.INT);
  NOAA_sort.addColumn("MS_country");
  NOAA_sort.addColumn("MS_var",Table.INT);
  NOAA_sort.addColumn("IN_ID",Table.INT);
  NOAA_sort.addColumn("IN_country");
  NOAA_sort.addColumn("IN_var",Table.INT);
  NOAA_sort.addColumn("DD_ID",Table.INT);
  NOAA_sort.addColumn("DD_country");
  NOAA_sort.addColumn("DD_var",Table.INT);
  NOAA_sort.addColumn("HT_ID",Table.INT);
  NOAA_sort.addColumn("HT_country");
  NOAA_sort.addColumn("HT_var",Table.INT);
  NOAA_sort.addColumn("HM_ID",Table.INT);
  NOAA_sort.addColumn("HM_country");
  NOAA_sort.addColumn("HM_var",Table.INT);
  
  for(int year = 0 ; year<year_total ; year++){
    NOAA_year = loadTable("NOAA_year["+year+"].csv","header");
    
    rank_EQ(NOAA_year,year);
    rank_general(NOAA_year,year);
  }
  
  sort_table(NOAA_total);
  
  saveTable(NOAA_sort,"data/NOAA_total.csv");
  println("PROCESS DONE");
}
