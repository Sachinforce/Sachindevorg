@isTest
public class LeadProcessorTest {
    Public static testMethod void testscheduledRoasterBatch(){
	List<Lead> lstLead = new List<Lead>();
	for(Integer i=0;i<10;i++){
		Lead obj = new Lead();
		obj.FirstName = 'Test'+i;
		obj.LastName = 'Record'+i;
		obj.Email = 'test'+i+'@gmail.com';
        obj.Company = 'testing';
		lstLead.add(obj);
	}
	insert lstLead;
   
	Test.StartTest();
	Database.executeBatch(new LeadProcessor());
	Test.stopTest();
	}	
    	
}