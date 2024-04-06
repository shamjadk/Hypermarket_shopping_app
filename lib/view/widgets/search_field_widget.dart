import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        decoration: InputDecoration(
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
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
                            // showModalBottomSheet(
                            //   context: context,
                            //   builder: (context) {
                            //     return const ShowModelWidget();
                            //   },
                            // );
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
            hintText: 'Search',
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
      ),
    );
  }
}
