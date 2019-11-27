global class OwnerReassignmentBatch implements Database.Batchable<SObject>,Database.Stateful {
    global String query;
	global String email;
	global Id toUserId;
	global Id fromUserId;

	global Database.querylocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope){
		List<Account> accns = new List<Account>();
        for(sObject s : scope)
            {Account a = (Account)s;
            if(a.OwnerId==fromUserId) {
                a.OwnerId=toUserId;
                accns.add(a);
            }
        }
		update accns;
	}

	global void finish(Database.BatchableContext BC){
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setToAddresses(new String[] {email});
		mail.setReplyTo('batch@acme.com');
		mail.setSenderDisplayName('Batch Processing');
		mail.setSubject('Batch Process Completed');
		mail.setPlainTextBody('Batch Process has completed');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}
}