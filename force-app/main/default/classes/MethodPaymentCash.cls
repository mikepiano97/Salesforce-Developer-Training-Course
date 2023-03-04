public class MethodPaymentCash extends CustomPayment{
    override String paymentMethod = 'Cash';
    public override ShowPaymentMethod(String paymentMethod) {
            System.debug('Client made payment by: ' + paymentMethod);
    }
}