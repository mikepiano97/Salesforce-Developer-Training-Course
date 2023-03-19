trigger UpdateFinalAmount on Payment__c (before insert, before update) {
    for(Payment__c payment : Trigger.new){
        if(payment.Status__c == 'Done'){
            payment.Final_Amount__c = payment.Amount__c;
        }
    }
}