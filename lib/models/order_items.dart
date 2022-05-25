class OrderItem {
  final String orderNo;
  final String itemNo;
  final double unitCost;
  final int quantity;

  const OrderItem(
      {required this.orderNo,
      required this.itemNo,
      required this.unitCost,
      required this.quantity});

  Map<String, dynamic> tojSon() => {
        'orderNo': orderNo,
        'itemNo': itemNo,
        'unitCost': unitCost,
        'quantity': quantity
      };
}
