@isTest
public class AccountOperationsTest {
    @isTest static void testAccountHasDefaultDescription() {       
        // Perform test - edited fourth time - test if this change exists
        Test.startTest();
        Account acc = new Account(Name='New Test Account4');
        Database.SaveResult result = Database.insert(acc);
        Test.stopTest();
        // Verify the demo
        //Adding a new comment this is testing2
        
        // test test test
        Account savedAcc = [SELECT Description FROM Account WHERE Id = :result.getId()];
        System.assertEquals('Default description', savedAcc.Description);
    }
}