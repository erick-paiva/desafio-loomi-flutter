import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login/login.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class Profile extends StatefulWidget {
  static const routeName = "profile";

  final void Function(String page) setCurrentPage;

  const Profile({Key? key, required this.setCurrentPage}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Perfil',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: CustomColors.black10,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 124,
              margin: EdgeInsets.only(left: 45, right: 45, top: 18, bottom: 26),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: CustomColors.gray100),
                  color: CustomColors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.network(
                            "https://chefbob.com.br/wp-content/uploads/2021/05/2021-05-12-como-deixar-os-gatos-mais-tranquilos.jpg",
                            fit: BoxFit.cover,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Eduardo Almeida",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: CustomColors.black10),
                        ),
                      ],
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 28),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: CustomColors.gray100),
                  color: CustomColors.white),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Login.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  minimumSize: Size(326, 55),
                ),
                child: Text(
                  "Fazer logout",
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
