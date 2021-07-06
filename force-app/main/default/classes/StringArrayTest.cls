global class StringArrayTest{

public StringArrayTest(){
//generateStringArray(5);
}

public static List<String> generateStringArray(Integer noofRecord){
   List<String> listString = new List<String>();
   try{
   for(Integer i=0;i<noofRecord;i++){
   listString.add('Test '+i);
  }
   return listString;
   }Catch(Exception exp){
       return null;
   }
}



}