@istest
private class LeadProcessorTest {
@testSetup
    static void setup(){
        List<Lead> lstOfLead = new List<Lead>();
        for(Integer i = 1; i <= 200; i++){
            Lead ld = new Lead(Company = 'Comp' + i ,LastName = 'LN'+i, LeadSource = 'Dreamforce', Status = 'Working - Contacted');
            lstOfLead.add(ld);
        }
        Insert lstOfLead;
    }
    
    static testmethod void testLeadProcessor(){
        Test.startTest();
        LeadProcessor ldPsr = new LeadProcessor();
        Id batchId = Database.executeBatch(ldPsr);
        Test.stopTest(); 
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}