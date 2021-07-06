@isTest
public class AddPrimaryContactTest {
    Public static testMethod void testscheduledRoasterBatch(){
	List<Account> lstAccount = new List<Account>();
	for(Integer i=0;i<100;i++){
		Account obj = new Account();
		obj.Name = 'Test'+i;
        if(i<=50)
			obj.BillingState = 'NY';
        else
          obj.BillingState = 'CA';  
		lstAccount.add(obj);
	}
   insert lstAccount;
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Cont';
        con.Email = 'test@gmail.com';
        insert con;
        AddPrimaryContact objA = new AddPrimaryContact(con, 'CA');
        Test.startTest();
         System.enqueueJob(objA);
        Test.stopTest();
}
}