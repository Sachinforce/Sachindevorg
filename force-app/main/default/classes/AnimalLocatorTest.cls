@isTest
global class AnimalLocatorTest {
    
    public static testMethod void methodFirst(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Test.StartTest();
         
          String NameAnimal = AnimalLocator.getAnimalNameById(1);
        System.assert(NameAnimal == 'chicken');
        Test.stopTest();
    }

}