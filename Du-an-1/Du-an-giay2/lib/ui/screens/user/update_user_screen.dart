import 'package:coffee_shop_test/data/models/user.dart';
import 'package:coffee_shop_test/data/viewmodels/user_viewmodels.dart';
import 'package:coffee_shop_test/ui/screens/login/login_screen.dart';
import 'package:coffee_shop_test/ui/screens/user/widgets/edit_user_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class UpdateUserScreen extends StatefulWidget {
  final String token;
  const UpdateUserScreen({super.key, required this.token});

  @override
  State<UpdateUserScreen> createState() => _EditUserState();
}

class _EditUserState extends State<UpdateUserScreen> {
  late Future<Map<String, dynamic>> fetchData;
  UserViewModel userViewModel = UserViewModel();
  final txtFullNameController = TextEditingController();
  final txtNameController = TextEditingController();
  final txtEmailController = TextEditingController();
  final txtGenderController = TextEditingController();
  final txtBirthController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<Map<String, dynamic>> getUserData() async {
    final result = await userViewModel.userProfile(widget.token);
    return {"user": result};
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData = getUserData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context, true);
            }, icon: Icon(Icons.arrow_back)),
            Text(
              "Change Name",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: fetchData,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              // TODO: Handle this case.
              throw UnimplementedError();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              final userData = snapshot.data!["user"]["user"]["data"];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.black87
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                "assets/images/avatar.png",
                                width: 60,
                                height: 60,
                              ),
                            ),
                            TextButton(
                              onPressed: () async{
                                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                if(image != null){
                                  final fileName = image.name;
                                  print(fileName);
                                }
                              },
                              child: Text(
                                "Change Profile Pricture",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Information",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Full name",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${userData["fullname"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              EditUserIconbutton(
                                hander: () async {
                                  final user = User(
                                    fullname: txtFullNameController.text,
                                  );
                                  await userViewModel.putUserUpdate(userData["id"], widget.token, user);

                                  final userDataUpdate = await userViewModel
                                      .putUserUpdate(
                                        userData["id"],
                                        widget.token,
                                        user,
                                      );
                                  if (userDataUpdate["data"]["status"] == 200) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Cập nhật thành công!"),
                                      ),
                                    );
                                  }
                                  fetchData = getUserData();
                                  setState(() {});
                                },
                                txtController: txtFullNameController,
                                title: "Full name",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${userData["name"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              EditUserIconbutton(
                                hander: () async {
                                  final user = User(
                                    name: txtNameController.text,
                                  );
                                  await userViewModel.putUserUpdate(userData["id"], widget.token, user);

                                  final userDataUpdate = await userViewModel
                                      .putUserUpdate(
                                    userData["id"],
                                    widget.token,
                                    user,
                                  );
                                  if (userDataUpdate["data"]["status"] == 200) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Cập nhật thành công!"),
                                      ),
                                    );
                                  }
                                  fetchData = getUserData();
                                  setState(() {});
                                },
                                txtController: txtNameController,
                                title: 'Name',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Personal Information",
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "UserId",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${userData["id"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconsax.copy,
                                  size: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "E-mail",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "${userData["email"]}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              EditUserIconbutton(
                                hander: () async {
                                  final user = User(
                                    email: txtEmailController.text,
                                  );

                                  final userDataUpdate = await userViewModel
                                      .putUserUpdate(
                                    userData["id"],
                                    widget.token,
                                    user,
                                  );
                                  print(userDataUpdate);
                                  if (userDataUpdate["data"]["status"] == 200) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Cập nhật thành công!"),
                                      ),
                                    );
                                  }
                                  fetchData = getUserData();
                                  setState(() {});
                                },
                                txtController: txtEmailController, title: 'E-mail',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Phone Number",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 50,),
                              Text(
                                "${userData["phone"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gender",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${userData["gender"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              EditUserIconbutton(
                                hander: () async {
                                  final user = User(
                                    fullname: txtFullNameController.text,
                                  );
                                  await userViewModel.putUserUpdate(userData["id"], widget.token, user);

                                  final userDataUpdate = await userViewModel
                                      .putUserUpdate(
                                    userData["id"],
                                    widget.token,
                                    user,
                                  );
                                  if (userDataUpdate["data"]["status"] == 200) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Cập nhật thành công!"),
                                      ),
                                    );
                                  }
                                  fetchData = getUserData();
                                  setState(() {});
                                },
                                txtController: txtGenderController, title: 'Gender',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date of Birth",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${userData["birth"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              EditUserIconbutton(
                                hander: () async {
                                  final user = User(
                                    birth: txtBirthController.text,
                                  );
                                  await userViewModel.putUserUpdate(userData["id"], widget.token, user);
                                  final userDataUpdate = await userViewModel
                                      .putUserUpdate(
                                    userData["id"],
                                    widget.token,
                                    user,
                                  );
                                  if (userDataUpdate["data"]["status"] == 200) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Cập nhật thành công!"),
                                      ),
                                    );
                                  }
                                  fetchData = getUserData();
                                  setState(() {});
                                },
                                txtController: txtBirthController, title: 'Date of birth',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(height: 30),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }, child: Text(
                      "Close Account",
                      style: const TextStyle(fontSize: 15, color: Colors.red),
                    ),)
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

/**/
