public class AccountHandler {
    
    
    public static Account insertNewAccount(String AccountName){
        try{
            Account accObj = new Account();
            accObj.Name = AccountName;
            insert accObj;
            return accObj;
            
        }catch(Exception exp){
            return null;
        }
        
    }
    public static void insertAccount(Integer value){
        Integer n = 1;
        //create a list to add our accounts
        List<Account> addAccounts = new List<Account>();
        
        while(n <= value){
            //display the current counter value
            System.debug('Counter Value before Incrementing ' + n);
            
            //create a new account
            Account store = new Account();
            store.Name = 'Acme Inc' + n;
            store.AccountNumber = 'A000' + n;
            addAccounts.add(store);
            
            System.debug(addAccounts);
            
            //increment the counter
            n = n + 1;
            System.debug('Counter Value after incrementing ' + n);
        }
        
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        
        //insert all of the accounts in the list
        insert addAccounts;
    }

}