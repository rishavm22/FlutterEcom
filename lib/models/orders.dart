class Orders {
  final String id;
  final String? customerId;
  final String? deliveryBoyId;
  final double totalPrice;
  final int totalQuantity;
  final String status;

  Orders(
      {
        required this.id,
        this.customerId,
        this.deliveryBoyId,
        required this.totalPrice,
        required this.totalQuantity,
        required this.status,
      });
}