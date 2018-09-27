
// 해당 연도의 지진발생 횟수를 세는 함수
void rank_EQ(Table NOAA_year,int year){
  int EQ_total = 0;  
  Table EQ_cnt = new Table();
  
  EQ_cnt.addColumn("ID",Table.INT);
  EQ_cnt.addColumn("CNTRY");
  EQ_cnt.addColumn("CNT",Table.INT);
  
  for(int i=0 ; i<cntryName_rowCount ; i++){
    TableRow newRow = EQ_cnt.addRow();
    newRow.setInt("ID",i+1);
  }
  
  for(TableRow row : NOAA_year.rows()){
    String country = row.getString("country");
    TableRow cntryRow = country_name.findRow(country,"country");
    int idx = cntryRow.getInt("index");
        
    TableRow indexRow = EQ_cnt.findRow(str(idx),"ID");
    indexRow.setInt("CNT",indexRow.getInt("CNT")+1);
    indexRow.setString("CNTRY",country);
    EQ_total += 1;
  }
  if(EQ_total != NOAA_year.getRowCount()){ // 혹시 수가 안 맞는 오류가 있는지를 확인
    println(str(2000+year)+" is on ERROR");
  }
  EQ_cnt.sort("CNT");
  
  // NOAA_ranking[i].addColumn("EQ_ID",Table.INT);
  // NOAA_ranking[i].addColumn("EQ_country");
  // NOAA_ranking[i].addColumn("EQ_var",Table.INT);
  
  for(int i=cntryName_rowCount-1 ; i>=0 ; i--){
    TableRow newRow;
    int ID = EQ_cnt.getInt(i,"ID");
    if(year == 0){
      newRow = NOAA_total.addRow(); //할 때마다 새롭게 추가하지 말고 처음만 확인해야 함 & sorting은 나중에
      newRow.setInt("EQ_ID",ID);
      newRow.setString("EQ_country",(country_name.findRow(str(ID),"index").getString("country")));
      newRow.setInt("EQ_var",EQ_cnt.getInt(i,"CNT"));
    }
    else{
      TableRow countryRow = country_name.findRow(str(ID),"index");
      newRow = NOAA_total.findRow((countryRow.getString("country")),"EQ_country");
      newRow.setInt("EQ_var",EQ_cnt.getInt(i,"CNT")+newRow.getInt("EQ_var"));
    }
  }
}
