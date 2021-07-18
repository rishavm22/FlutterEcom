class Orders {
  final String id;
  final double totalPrice;
  final int totalQuantity;
  final String status;

  Orders(
      {
        required this.id,
        required this.totalPrice,
        required this.totalQuantity,
        required this.status,
      });
}