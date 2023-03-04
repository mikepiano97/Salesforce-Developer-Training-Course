public abstract class CustomPayment {
    Id paymentId; 
    protected Decimal paymentAmount; // protected keyword express the Encapsulation
    Decimal currentBalance; 
    Date paymentDate; 
    public static User owner; 
    String paymentMethod; //  cash, internet banking, credit card
    String paymentStatus; // new, pending, confirming, done...

    public abstract ShowPaymentMethod(String paymentMethod){
        // no body code here
    }

    public abstract NotiPaymentStatusToUser(String paymentStatus, Date paymentDate){
        // no body code here
    }

    public abstract NotiPaymentStatusToUser(String paymentStatus){
        // no body code here
    }
}