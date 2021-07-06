global class MergeRecordController{

public Sobject firstAccount { get; set; }
public Sobject scoendAccount { get; set; }
public List<String> lstFieldName {get;set;}
public Map<String,String> mapLabelAPI {get;set;}
public Integer columnNumber {get;set;} 
public MergeRecordController(){
lstFieldName = new List<String>();
mapLabelAPI = new Map<String,String>();
firstAccount = new Account();
scoendAccount = new Account();
columnNumber= 4;
getFieldsInformation();
}

public void getFieldsInformation(){
Map<String, Schema.SobjectField> fieldMap = Schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap();   
for(String strFieldName: fieldMap.keySet()) {
    system.debug('API---'+strFieldName);
    system.debug('label---'+fieldMap.get(strFieldName).getDescribe().getLabel());
    system.debug('label---'+fieldMap.get(strFieldName).getDescribe().getType());
    String strFType = String.valueof(fieldMap.get(strFieldName).getDescribe().getType());
    String strFLabel = String.valueof(fieldMap.get(strFieldName).getDescribe().getLabel());
    if(!strFType.equalsIgnoreCase('reference') && !strFType.equalsIgnoreCase('id') && !strFType.equalsIgnoreCase('Jigsaw') && !strFLabel.equalsIgnoreCase('deleted')){
    mapLabelAPI.put(strFLabel,strFieldName);
    lstFieldName.add(strFLabel);
    }
 }
 }
 }