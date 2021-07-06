@isTest
public class TestVerifyDate{
     
    static testMethod void TestVerifyDateMethod(){
        Date date1 = System.Today();
        Date returnDate = VerifyDate.CheckDates(date1,date1.addDays(15));
        system.assertEquals(date1.addDays(15),returnDate);
       
    }
    static testMethod void TestVerifyDateMethod2(){
        Date date1 = System.Today();
        Date returnDate = VerifyDate.CheckDates(date1.addDays(15),date1);
        //system.assertEquals(date1,returnDate);
       
    }
}