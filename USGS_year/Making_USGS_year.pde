// Making USGS year(sort)
// ERROR :: 2011.01.01-2011.06.30.csv does not exist or could not be read

Table[] originTable = new Table[2];
Table yearTable;
int year = 0;

void setup(){
  yearTable = new Table();
  for(int year = 0 ; year <= 17 ; year++){
    originTable[0] = loadTable(str(2000+year)+".01.01-"+str(2000+year)+".06.30.csv");
    originTable[1] = loadTable(str(2000+year)+".07.01-"+str(2000+year)+".12.31.csv");
  
    yearTable = originTable[0];
    for(TableRow row : originTable[1].rows()){
      TableRow addRow = yearTable.addRow();
      addRow = row;
    }
    saveTable(yearTable,"data/USGS_year["+year+"].csv");
    println("Saved! "+str(2000+year)+"...!");
  }
}
