trigger throwErrorWhenStatusChange on Payment__c (before update) {
    for(Payment__c payment : Trigger.new){
        if (Trigger.oldMap.get(payment.Id).Status__c == 'Done'){
            payment.Status__c.addError('Can not transfer from Done to other Status bro!');
        }
    }   
}