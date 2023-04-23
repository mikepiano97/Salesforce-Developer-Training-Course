@isTest
public class CustomPaymentClassTest {
    // tạo mới payment và kiểm tra xem nếu thỏa mãn điều kiện, Trường Final Amount có bằng trường Amount hay không.
	@testSetup
    static void createPayment(){    
        Payment__c pm = new Payment__c();
        pm.Name = 'Test Payment Trigger Final Amount';
        pm.Status__c = 'Done';
        pm.Payment_date__c = System.today();
        pm.Amount__c = 25000;
        insert pm;
    }
    
    @isTest static void checkFinalAmountIsAmount(){
        Payment__c paymentCheck = [SELECT Name, Amount__c, Final_Amount__c FROM Payment__c WHERE Name = 'Test Payment Trigger Final Amount' LIMIT 1];
        Decimal finalAmount = paymentCheck.Final_Amount__c;
        System.assert(paymentCheck != null, 'Đã tồn tại 1 chú payment rồi nhé');
       	System.assertEquals(25000, finalAmount, 'Final Amount không bằng Amount rồi ông giáo ạ');
    }
}