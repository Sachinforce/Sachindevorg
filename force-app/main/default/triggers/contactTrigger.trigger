Trigger contactTrigger on Contact (After Insert, After Update, After Delete){
Set<Id> AccountSet = new Set<Id>();
Map<Id,String> AccountContactEmail = new Map<Id, String>();
Map<Id,String> contactDeleteMap = new Map<Id,String>();



for(Contact conObj : Trigger.new){
if(Trigger.IsUpdate){
if(Trigger.oldMap.get(conObj.Id).Email != conObj.Email){
AccountSet.add(conObj.AccountId);

}

}else {
AccountSet.add(conObj.AccountId);
if(Trigger.IsDelete){
contactDeleteMap.put(conObj.Id,conObj.Email);

}
}

}
List<Account> AccountList = new List<Account>();


for(Contact conObj : Trigger.new){
if(AccountContactEmail.containsKey(conObj.AccountId)){
String emails = AccountContactEmail.get(conObj.AccountId);
emails = contactDeleteMap.containsKey(conObj.Id)?emails:emails+','+conObj.Email;
AccountContactEmail.put(conObj.AccountId,emails);

}else if(!contactDeleteMap.containsKey(conObj.Id)){
 
AccountContactEmail.put(conObj.AccountId,conObj.Email);
}

}

for(Account accObj : [Select Id, ContactEmail__c From Account Where Id IN : AccountSet]){
accobj.ContactEmail__c = AccountContactEmail.get(accObj.Id);
accountList.add(accObj);

}

if(accountList.size()>0){
 Update accountList;
}



}