public class NotiPaymentStatusToUser extends CustomPayment{
    // "extends" keyword show the Inheritance
    public override void NotiPaymentStatusToUser(String paymentStatus) {
        if (paymentStatus == 'Done') {
            System.debug('Client have already made payment!');    
        }
    }

    public NotiPaymentStatusToUser(String paymentStatus, Date paymentDate){
        if (paymentStatus == 'Done') {
            System.debug('Client have already made payment in ' + paymentDate);    
        }
    }

    // 2 method above express the Polymorphism


}