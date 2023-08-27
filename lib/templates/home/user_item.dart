import 'dart:developer';

import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem(
      {required List? photo,
      required String firstName,
      required String lastName,
      required String phone,
      super.key})
      : _photo = photo,
        _firstName = firstName,
        _lastName = lastName,
        _phone = phone;

  final List? _photo;
  final String _firstName;
  final String _lastName;
  final String _phone;

  @override
  Widget build(BuildContext context) {
    log('****************$_photo');
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(''
                      // _photo == null || _photo!.isEmpty
                      //   ? 'https://www.seekpng.com/png/detail/966-9665317_placeholder-image-person-jpg.png'
                      //   : _photo?.first()
                      ),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Text(
                    '$_firstName $_lastName',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _phone,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
