@isTest
public class DailyLeadProcessorTest {
    Public static testMethod void testscheduledRoasterBatch(){
	List<Lead> lstLead = new List<Lead>();
	for(Integer i=0;i<200;i++){
		Lead obj = new Lead();
		obj.FirstName = 'Test'+i;
		obj.LastName = 'Record'+i;
		obj.Email = 'test'+i+'@gmail.com';
        obj.Company = 'testing';
		lstLead.add(obj);
	}
	insert lstLead;
   
	Test.StartTest();
	 String sch = '0 0 23 * * ?';
    system.schedule('Test check', sch, new DailyLeadProcessor());
	Test.stopTest();
	}
	}