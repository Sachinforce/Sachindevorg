@isTest
public class AccountProcessorTest {

    @isTest static void testCallout() {              
       Account acc = new Account(Name='Test');
        insert acc;
        Contact con = new Contact(FirstName ='Test',LastName='Cont',AccountId=acc.Id);
        insert con;
        List<Id> AccIds = new List<Id>();
        AccIds.add(acc.Id);
         Test.startTest();
           AccountProcessor.countContacts(AccIds);
         Test.stopTest();
        
    }
}