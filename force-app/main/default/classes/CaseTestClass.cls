@isTest
public class CaseTestClass {
	@testSetup 
    static void setup(){
        List<Case> listCase = new List<Case>();
        for (Integer i=0; i<200; i++){
            Case c = new Case();
            c.Status = 'New';
            c.Origin = 'Phone';
            c.Subject = 'Test Case Subject Mike '+ String.valueOf(i);
            listCase.add(c);
        }
        insert listCase;
    }
    
    @isTest
    static void testNumberCase(){
        Integer numberCase = [SELECT COUNT() FROM Case];
        System.debug(numberCase);
        System.assertEquals(200, numberCase);
    }
}