@isTest
public class TestOpportunityChangeTrigger {
    @isTest
    public static void test() {
        Test.enableChangeDataCapture();
        insert new Opportunity(
            Name = 'Sell 100 Widgets',
            StageName = 'Prospecting',
            CloseDate = Date.today().addMonths(3)
        );
        Test.getEventBus().deliver();

        Task[] taskList = [SELECT Id,Subject FROM Task]; 
        System.assertEquals(0, taskList.size(),
                            'Unexpected task found');

        Opportunity oppt = [SELECT Id, Name, StageName, isWon, CloseDate from Opportunity][0];
        oppt.StageName = 'Closed Won';
        update oppt;
        Test.getEventBus().deliver();
        
        taskList = [SELECT Id,Subject FROM Task]; 
        System.assertEquals(1, taskList.size(),
                            'The change event trigger did not create the expected task.');        
        string start = 'Follow up on won opportunities';
        System.assertEquals(start, taskList[0].Subject.substring(0, start.length()),
                            'The task subject is wrong.');        
    }
}