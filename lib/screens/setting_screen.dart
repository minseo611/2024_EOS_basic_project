import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String name = "최민서";
  String shortBio = "정해인과 결혼하는 방법을 알아내자!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("프로필 설정"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [

            Container(
              width: 140,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/images/minseo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [

                  _buildListTile(
                    title: "이름",
                    trailingText: name,
                    onTap: _editName,
                  ),
                  const SizedBox(height: 10),

                  _buildListTile(
                    title: "한 줄 소개",
                    trailingText: shortBio,
                    onTap: _editBio,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildListTile({
    required String title,
    required String trailingText,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trailingText,
            style: const TextStyle(color: Colors.grey),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: onTap,
    );
  }


  void _editName() {
    TextEditingController _nameController = TextEditingController();
    _nameController.text = name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("이름 변경"),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: "새로운 이름을 입력하세요",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("취소", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  name = _nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text("저장", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }


  void _editBio() {
    TextEditingController _bioController = TextEditingController();
    _bioController.text = shortBio;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("한 줄 소개 변경"),
          content: TextField(
            controller: _bioController,
            decoration: const InputDecoration(
              hintText: "새로운 한 줄 소개를 입력하세요",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("취소", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  shortBio = _bioController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text("저장", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
