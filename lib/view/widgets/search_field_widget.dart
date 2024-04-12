import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypermarket_ecommerce/controller/bloc/customer_bloc/customer_api_bloc.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';
import 'package:hypermarket_ecommerce/view/widgets/bottom_sheet_widget.dart';

class SearchFieldWidget extends StatelessWidget {
  final bool? isCustomer;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const SearchFieldWidget(
      {super.key,
      required this.isCustomer,
      required this.onChanged,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorColor: AppTheme.appThemeColor,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
                  const BorderSide(color: AppTheme.appThemeColor, width: 2)),
          suffixIcon: isCustomer == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.qr_code_scanner_outlined),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BlocProvider<CustomersApiBloc>(
                                  create: (context) => CustomersApiBloc(),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: const BottomSheetWidget(
                                        null,
                                        isEdit: false,
                                      )));
                            },
                          );
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Color(0xFF17479b),
                          child: Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.qr_code_scanner_outlined),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Fruits'),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}
