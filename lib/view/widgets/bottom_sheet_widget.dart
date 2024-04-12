import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_events.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/core/utils/snack_bar_utils.dart';
import 'package:hypermarket_ecommerce/model/customers_model.dart';
import 'package:hypermarket_ecommerce/view/widgets/bottom_sheet_text_filed_widget.dart';
import 'package:hypermarket_ecommerce/view/widgets/elevtaed_button_widget.dart';

class BottomSheetWidget extends HookWidget {
  final bool isEdit;
  final CustomersModel? model;
  const BottomSheetWidget(this.model, {super.key, required this.isEdit});

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

    if (isEdit) {
      useEffect(() {
        customerNameController.text = model!.name!;
        mobileNumberController.text = model!.mobileNumber!;
        emailController.text = model!.email!;
        streetController.text = model!.street!;
        streetTwoController.text = model!.streetTwo!;
        cityController.text = model!.city!;
        pinCodeController.text = model!.pincode!.toString();
        countryController.text = model!.country!;
        stateController.text = model!.state!;
        return null;
      }, []);
    }

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
                    child: ElevatedButtonWidget(
                        onPressed: () {
                          if (isEdit) {
                            if (formKey.currentState!.validate()) {
                              context.read<CustomersApiBloc>().add(
                                    UpdateCustomerEvent(
                                        model: CustomersModel(
                                            id: null,
                                            name: customerNameController.text,
                                            mobileNumber:
                                                mobileNumberController.text,
                                            email: emailController.text,
                                            profilePic: null,
                                            street: streetController.text,
                                            streetTwo: streetTwoController.text,
                                            pincode: int.parse(
                                                pinCodeController.text),
                                            state: stateController.text,
                                            city: cityController.text,
                                            country: countryController.text),
                                        id: model!.id!),
                                  );
                              Navigator.pop(context);
                              Navigator.pop(context);
                              SnackBarUtils.showSnackBar(
                                  context, 'Updated customer');
                            } else {
                              log('Empty input');
                            }
                          } else {
                            if (formKey.currentState!.validate()) {
                              context.read<CustomersApiBloc>().add(
                                    AddCustomerEvent(
                                      CustomersModel(
                                          id: null,
                                          name: customerNameController.text,
                                          mobileNumber:
                                              mobileNumberController.text,
                                          email: emailController.text,
                                          profilePic: null,
                                          street: streetController.text,
                                          streetTwo: streetTwoController.text,
                                          pincode:
                                              int.parse(pinCodeController.text),
                                          state: stateController.text,
                                          city: cityController.text,
                                          country: countryController.text),
                                    ),
                                  );
                              Navigator.pop(context);
                              SnackBarUtils.showSnackBar(
                                  context, 'Added customer');
                            } else {
                              log('Empty input');
                            }
                          }
                        },
                        buttonName: 'Submit')),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
