public class NewCaseListController{

 public NewCaseListController(){
 
 }
 
 public List<Case> getNewCases(){
    List<Case> lstCase =[Select Id,CaseNumber From Case];
    return lstCase;
 }


}