trigger OrderEventTrigger on Order_Event__e (after insert) {
   User myUser = [SELECT Id FROM User WHERE Name='Sachin Verma' LIMIT 1];
   List<Task> lstTask = new List<Task>();
   for(Order_Event__e  obj : trigger.new){
    if(obj.Has_Shipped__c == true){
        Task taskObj = new Task();
        taskObj.Priority='Medium';
        taskObj.Subject = 'Follow up on shipped order ' + obj.Order_Number__c;
        taskObj.OwnerId = myUser.Id;
        lstTask.add(taskObj);
    
    }
   }
   insert lstTask;

}