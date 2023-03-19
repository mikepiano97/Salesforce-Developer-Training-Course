trigger createNewTaskForSpecialPaymentMethod on Payment__c (after insert) {
	List<Task> listTasks = new List<Task>(); 
    for (Payment__c payment : Trigger.new){
        if(payment.Payment_Method__c == 'Chuyển khoản' && payment.Payment_Date__c != null){
            Task newTask = new Task();
            newTask.WhatId = payment.Id;
            newTask.Subject = 'Verify payment' + payment.Name;
            newTask.Priority = 'High';
            newTask.OwnerId = payment.OwnerId;
            newTask.ActivityDate = payment.Payment_Date__c.addDays(1);
            newTask.Status = 'Not Started';
            listTasks.add(newTask);
        } else {
            payment.Payment_Date__c.addError('Plz check again this field, bro. I need it for creating a new task');
        }
    }
    insert listTasks;
}