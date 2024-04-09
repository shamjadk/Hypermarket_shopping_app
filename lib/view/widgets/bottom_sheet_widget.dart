import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_events.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';
import 'package:hypermarket_ecommerce/view/widgets/bottom_sheet_text_filed_widget.dart';

class BottomSheetWidget extends HookWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final customerNameController = useTextEditingController();
    final mobileNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final streetController = useTextEditingController();
    final streetTwoController = useTextEditingController();
    final cityController = useTextEditingController();
    final pinCodeController = useTextEditingController();
    final countryController = useTextEditingController();
    final stateController = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add Customer',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              AppTheme.appThemeColor.withOpacity(.3),
                          child: const Icon(
                            Icons.close,
                            size: 18,
                            color: AppTheme.appThemeColor,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                BottomSheettextFieldWidget(
                    controller: customerNameController,
                    hintText: 'Customer Name'),
                const SizedBox(
                  height: 8,
                ),
                BottomSheettextFieldWidget(
                    controller: mobileNumberController,
                    hintText: 'Mobile Number'),
                const SizedBox(
                  height: 8,
                ),
                BottomSheettextFieldWidget(
                    controller: emailController, hintText: 'Email'),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Add Customer',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BottomSheettextFieldWidget(
                          controller: streetController, hintText: 'Street'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: BottomSheettextFieldWidget(
                          controller: streetTwoController,
                          hintText: 'Street 2'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BottomSheettextFieldWidget(
                          controller: cityController, hintText: 'City'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: BottomSheettextFieldWidget(
                          controller: pinCodeController, hintText: 'PIN code'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BottomSheettextFieldWidget(
                          controller: countryController, hintText: 'Country'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: BottomSheettextFieldWidget(
                          controller: stateController, hintText: 'State'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppTheme.appThemeColor),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<CustomersApiBloc>().add(AddCustomerEvent(
                              CustomersModel(
                                  id: 10,
                                  name: customerNameController.text,
                                  mobileNumber: mobileNumberController.text,
                                  email: emailController.text,
                                  profilePic: null,
                                  street: streetController.text,
                                  streetTwo: streetTwoController.text,
                                  pincode: int.parse(pinCodeController.text),
                                  state: stateController.text,
                                  city: cityController.text)));
                        } else {
                          log('Empty input');
                        }
                      },
                      child: const Text('Submit')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
