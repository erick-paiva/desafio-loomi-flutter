import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/profile_response.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/login_page/login_page.dart';
import 'package:loomi_flutter_boilerplate/src/utils/authentication.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';
import 'package:loomi_flutter_boilerplate/src/utils/helpers/assets_helper.dart';

class Profile extends StatefulWidget {
  static const routeName = "profile";
  final ProfileResponse? profileUser;

  final void Function(String page) setCurrentPage;

  const Profile({Key? key, required this.setCurrentPage, this.profileUser})
      : super(key: key);

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
              margin: EdgeInsets.only(left: 30, right: 30, top: 18, bottom: 26),
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
                            widget.profileUser?.avatar ?? "",
                            fit: BoxFit.cover,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          widget.profileUser?.name ?? "",
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
              margin: EdgeInsets.only(bottom: 28, left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: CustomColors.gray100),
                  color: CustomColors.white),
              child: ElevatedButton(
                onPressed: () {
                  Authentication.logout();
                  Navigator.pushNamed(context, LoginPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  minimumSize: Size(double.infinity, 55),
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
