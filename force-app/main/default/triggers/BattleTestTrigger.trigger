trigger BattleTestTrigger on Battle_Station__c (before insert,before update,after insert, after update) {
if(Trigger.IsBefore && Trigger.IsInsert){
  system.debug('@@@ Before Insert @@@'+Trigger.new[0].Test_Package_Field__c);

}else if(Trigger.IsBefore && Trigger.IsUpdate){
  system.debug('@@@ Before Update @@@'+Trigger.new[0].Test_Package_Field__c);

}else if(Trigger.IsAfter && Trigger.IsInsert){

   system.debug('@@@ After Insert @@@'+Trigger.new[0].Test_Package_Field__c);

}else if(Trigger.IsAfter && Trigger.IsUpdate){
  system.debug('@@@ after update @@@'+Trigger.new[0].Test_Package_Field__c);

}
}