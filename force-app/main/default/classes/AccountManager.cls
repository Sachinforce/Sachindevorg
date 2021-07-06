@RestResource(UrlMapping='/Accounts/*')
global class AccountManager {
    
    @HttpGet
    global Static Account getAccount(){
        RestRequest request = RestContext.request;
        String AccId = '';
        String returnName ='';
        for(String obj : request.requestURI.split('/')){
            if(obj.startsWith('001'))
              AccId = obj;  
        }
        system.debug('----caseId----'+AccId);
        ResultData objAccountData = new ResultData();
        List<Account> AccountData = [Select Id,Name,(Select Id,Name From Contacts) From Account Where Id =:AccId];
       /* for(Account objAccount : [Select Id,Name from Account Where Id =:caseId[6]]){
           objAccountData.Id=objAccount.Id;
            objAccountData.Name=objAccount.Name;
        }
        List<Contact> objContact = [Select Id,Name,AccountId,Account.Name from Contact Where AccountId =:caseId[6]];
        objAccountData.Contactlst = objContact;*/
        return AccountData[0];
    }
     public class ResultData{
        public Id Id;
        public String Name;
        public List<Contact> Contactlst;
        
    }
    


}