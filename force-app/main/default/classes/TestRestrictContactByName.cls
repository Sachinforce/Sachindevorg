@isTest
public class TestRestrictContactByName{
     
    static testMethod void TestRestrictContactByNameMethod(){
        Contact Cont = new Contact();
        Cont.LastName = 'INVALIDNAME';
        Database.UpsertResult result = Database.Upsert(Cont, false);
        system.assert(!result.isSuccess());
       
    }
    
}