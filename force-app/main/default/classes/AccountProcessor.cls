public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> AccIds){
        List<Account> listAccount = new List<Account>();
        for(AggregateResult CountContact : [Select AccountId Accid,count(Id) conCount From Contact Where AccountId IN :AccIds Group By AccountId]){
          Account acc = new Account();
            acc.Id = (Id) CountContact.get('Accid');
            acc.Number_of_Contacts__c = (Integer) CountContact.get('conCount');
            listAccount.add(acc);
        }
        update listAccount;
    }

}