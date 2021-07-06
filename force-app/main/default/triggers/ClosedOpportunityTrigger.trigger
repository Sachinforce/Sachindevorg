trigger ClosedOpportunityTrigger on Opportunity (After insert,After Update) {
    
    List<Task> lstTask = new List<Task>();
    for(Opportunity objOpp : Trigger.New){
        if(objOpp.StageName  == 'Closed Won'){
            task objTask = new task();
            objTask.WhatId = objOpp.Id;
            objTask.Subject = 'Follow Up Test Task';
            lstTask.add(objTask);
        }
    }
    insert lstTask;

}