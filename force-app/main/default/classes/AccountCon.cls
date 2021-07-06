public class AccountCon{  
  public Account accObj{get;set;}  
  public AccountCon(){  
  accObj = [SELECT id,Name FROM Account LIMIT 1];  
  }  
 }