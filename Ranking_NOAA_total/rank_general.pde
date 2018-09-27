
// ranking general properties
String[] property = {"deaths","missing","injuries","damage_millions_dollars","house_destroyed","house_damaged"};
String[] save_property = {"DH","MS","IN","DD","HT","HM"};

void rank_general(Table table,int year){
  Table property_cnt = new Table();
  int property_total = 0;
  
  property_cnt.addColumn("ID",Table.INT);
  property_cnt.addColumn("CNTRY");
  property_cnt.addColumn("CNT",Table.INT);
  
  for(int i=0 ; i < property.length ; i++){
    // clear Table
    property_cnt.clearRows();
    property_total = 0;
    
    // set table ID
    for(int j=0 ; j < cntryName_rowCount ; j++){
      TableRow row = property_cnt.addRow();
      row.setInt("ID",j+1);
    }
    
    for(TableRow row : table.rows()){
      String country = row.getString("country");
      TableRow cntryRow = country_name.findRow(country,"country");
      int idx = cntryRow.getInt("index");
           
      TableRow indexRow = property_cnt.findRow(str(idx),"ID");
      indexRow.setInt("CNT",indexRow.getInt("CNT")+row.getInt(property[i]));
      indexRow.setString("CNTRY",country);
      property_total += 1;     
    }
    if(property_total != NOAA_year.getRowCount()){ // 혹시 수가 안 맞는 오류가 있는지를 확인
      println(str(2000+year)+" is on ERROR");
      println("pt: "+property_total+" NOAA: "+NOAA_year.getRowCount());
    }
    
    for(int j=cntryName_rowCount-1 ; j>=0 ; j--){
      TableRow newRow;
      int ID = property_cnt.getInt(j,"ID");
      if(year==0){
        newRow = NOAA_total.getRow(cntryName_rowCount-1-j);
        newRow.setInt(save_property[i]+"_ID",ID);
        newRow.setString(save_property[i]+"_country",(country_name.findRow(str(ID),"index").getString("country")));
        newRow.setInt(save_property[i]+"_var",property_cnt.getInt(j,"CNT"));
      }
      else{
        newRow = NOAA_total.findRow((country_name.findRow(str(ID),"index").getString("country")),save_property[i]+"_country");
        newRow.setInt(save_property[i]+"_ID",ID);
        newRow.setInt(save_property[i]+"_var",property_cnt.getInt(j,"CNT")+newRow.getInt(save_property[i]+"_var"));
      }
    }
    
    // println("Saved "+save_property[i]+"!");
  }
}
