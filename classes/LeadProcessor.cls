global class LeadProcessor implements Database.Batchable <SObject> {
  global Database.QueryLocator start(Database.BatchableContext bc){
      return Database.getQueryLocator('SELECT Id,LeadSource FROM Lead');
    }
    
     global void execute(Database.BatchableContext bc, List<sObject> scope){
        List<Lead> lstOfUpdatedLead = new List<Lead>();
        List<Lead> lstOfLead = (List<Lead>)scope;
        for(Lead ld : lstOfLead){
              ld.LeadSource = 'Other';
              lstOfUpdatedLead.add(ld);
            update lstOfUpdatedLead;
        }
     }
     
     global void finish(database.BatchableContext BC) {

             AsyncApexJob a = [SELECT Id, Status, NumberofErrors,
     JobItemsProcessed, TotalJobItems, CreatedBy.Email
                         From AsyncApexJob WHERE Id =:BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Sharing Recalculation' + a.Status);
        mail.setPlainTextBody('test lead processing');

     }
}