import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/model/product_model.dart';

class ProductGridWidget extends StatelessWidget {
  final List<Products> state;
  const ProductGridWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        mainAxisExtent: 140,
      ),
      itemCount: state.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(.30))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    'assets/images/img_kiwi.png',
                    height: 60,
                  )),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state[index].name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('\$${state[index].price}/-'),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 30,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.transparent
                            ])),
                      ),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFF17479b),
                        ),
                        child: const Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
