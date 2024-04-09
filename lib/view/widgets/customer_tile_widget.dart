import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';

class CustomerTileWidget extends StatelessWidget {
  final CustomersModel model;
  const CustomerTileWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.appThemeColor),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Customerdetails(
                fieldKey: 'Name',
                fieldValue: model.name!,
              ),
              Customerdetails(
                fieldKey: 'ID',
                fieldValue: model.id!.toString(),
              ),
              Customerdetails(
                fieldKey: 'Mobile',
                fieldValue: model.mobileNumber ?? 'Null',
              ),
              Customerdetails(
                fieldKey: 'Email',
                fieldValue: model.email ?? 'Null',
              ),
              Customerdetails(
                fieldKey: 'Street',
                fieldValue: model.street!,
              ),
              Customerdetails(
                fieldKey: 'Street 2',
                fieldValue: model.streetTwo!,
              ),
              Customerdetails(
                fieldKey: 'PIN code',
                fieldValue: model.pincode!.toString(),
              ),
              Customerdetails(
                fieldKey: 'City',
                fieldValue: model.city!,
              ),
              Customerdetails(
                fieldKey: 'State',
                fieldValue: model.state!,
              ),
            ],
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
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
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.appThemeColor),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 1,
              height: 60,
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
              width: MediaQuery.sizeOf(context).width / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${model.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Text(
                    'ID: ${model.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                  Text(
                    '${model.street}, ${model.city}, ${model.state}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                  RichText(
                      text: const TextSpan(
                          text: 'Due Amount:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12),
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
      ),
    );
  }
}

class Customerdetails extends StatelessWidget {
  final String fieldKey;
  final String fieldValue;
  const Customerdetails(
      {super.key, required this.fieldKey, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldKey,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            fieldValue,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey.shade700),
          )
        ],
      ),
    );
  }
}
