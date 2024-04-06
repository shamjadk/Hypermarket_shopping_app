import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';

class CustomerTileWidget extends StatelessWidget {
  final CustomersModel model;
  const CustomerTileWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 115,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 7, spreadRadius: 1),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: AppTheme.appThemeColor),
                child: const Center(
                  child: Icon(Icons.person,size: 60,color: Colors.white,),
                ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 1,
            height: 100,
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
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width/2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model.name}',
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'ID: ${model.id}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Text(
                  '${model.street}, ${model.city}, ${model.state}',overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                RichText(
                    text: const TextSpan(
                        text: 'Due Amount:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                      TextSpan(
                          text: ' \$500', style: TextStyle(color: Colors.red))
                    ]))
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 10,
                  backgroundColor: AppTheme.appThemeColor,
                  child: Center(
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/icons/ic_whatsapp.png',
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
