import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/widgets/section_title.dart';

class ProductsView extends StatefulWidget {
  final List<Product> sectionProducts;
  final String section;
  const ProductsView({super.key, required this.sectionProducts, required this.section});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 50,),
        Center(child: SectionTitle(title: widget.section)),
        // start with a column of rows that represents how products will be viewed
        Column(
          // from 0 until half the products number
          children: List.generate(widget.sectionProducts.length~/2, (colIndex) {
            // create a row
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // 0 and 1 only
              children: List.generate(2, (rowIndex){
                // this equation is calculated based on the following pattern :
                // column 0 will have rows 0,1
                // column 1 will have rows 2,3
                // column 2 will have rows 4,5 .. etc
                // we notice if column is x the rows will be 2x and 2x+1
                rowIndex = rowIndex == 0 ? 2*colIndex : (2*colIndex)+1;
                return ProductCard(product: widget.sectionProducts[rowIndex]);
              }),
            );
          }),
        ),
        const SizedBox(height: 50,),
        ],
      );
  }
}