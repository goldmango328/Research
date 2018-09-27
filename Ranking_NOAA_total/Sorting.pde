void sort_table(Table origin_table){
   origin_table.sort("EQ_var");
   
   for(int i = cntryName_rowCount-1 ; i>=0 ; i--){
     TableRow newRow = NOAA_sort.addRow();
     TableRow row = origin_table.getRow(i);
     newRow.setInt("EQ_ID",row.getInt("EQ_ID"));
     newRow.setString("EQ_country",row.getString("EQ_country"));
     newRow.setInt("EQ_var",row.getInt("EQ_var"));
   }
   
   for(int i = 0 ; i < save_property.length ; i++){
     origin_table.sort(save_property[i]+"_var");
     
     for(int j = cntryName_rowCount-1 ; j>=0  ; j--){
       TableRow sortRow = NOAA_sort.getRow(cntryName_rowCount-1-j);
       TableRow originRow = origin_table.getRow(j);
       sortRow.setInt(save_property[i]+"_ID", originRow.getInt(save_property[i]+"_ID"));
       sortRow.setString(save_property[i]+"_country",originRow.getString(save_property[i]+"_country"));
       sortRow.setInt(save_property[i]+"_var", originRow.getInt(save_property[i]+"_var"));
     }
   }
}
