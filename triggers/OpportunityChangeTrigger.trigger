trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
	List<Task> tasks = new List<Task>();
    boolean won = false;
    for (OpportunityChangeEvent event : Trigger.new) {
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        if (header.changetype == 'UPDATE' && event.IsWon) {
            Task t = new Task(
                Subject = 'Follow up on won opportunities: ' + header.recordIds,
                WhatId = header.recordIds[0],
                OwnerId = header.commituser
            );

            Tasks.add(t);
            won = true;
        }
        
        if (won) {
            insert Tasks;
        }
    }
}