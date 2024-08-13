// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProductDetailScreen extends GetView {
//   const ProductDetailScreen({super.key});



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('productName'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () {
//               // Action for editing the product
//               print('Edit product');
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: () {
//               // Show a confirmation dialog before deleting
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: const Text('Confirm Delete'),
//                     content: const Text(
//                         'Are you sure you want to delete this product?'),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(),
//                         child: const Text('Cancel'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Action for deleting the product
//                           print('Delete product');
//                           Navigator.of(context).pop();
//                         },
//                         child: const Text('Delete'),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product image
//             Container(
//               width: double.infinity,
//               height: 200,
//               decoration: BoxDecoration(
//                 // image: DecorationImage(
//                 //   image: NetworkImage(productImageUrl),
//                 //   fit: BoxFit.cover,
//                 // ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Product name
//             Text(
//               'productName',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             // Product description
//             Text(
//               'productDescription',
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
