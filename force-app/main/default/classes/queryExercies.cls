public with sharing class queryExercies {
    public queryExercies() {
        // 1. SELECT Id, CustomerPriority__c FROM Account WHERE CustomerPriority__c = 'Medium'
        // 2. SELECT SUM(Amount), COUNT(Id) FROM Opportunity WHERE StageName = 'Closed Won'
        // 3. SELECT COUNT(Id) FROM Opportunity WHERE AccountId = '0015j00000c9H6IAAU' AND StageName = 'Closed Won'
        // 4. SELECT Id, Name, AccountNumber, Type, (SELECT Name, Email, MobilePhone, AccountId FROM Contacts) FROM Account
        // 5. SELECT Id, Name, AccountNumber, (SELECT CaseNumber, Subject, Status FROM Cases) FROM Account
        // 6. FIND {.com} IN All Fields RETURNING Lead(Name, Phone, Email), Contact(Name, Phone, Email)
        // 7. FIND {Pyramid} IN All Fields RETURNING Account(Id, Name), Opportunity(Id, Name)
    }
}