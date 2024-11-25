import 'package:eos_todolist/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import '/widgets/add_button.dart';
import '/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> toDoLists = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toDoLists.add("11111111");
    toDoLists.add("2222222222");
    toDoLists.add("3333333333");
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
        title: Text('EOS Todolist'),
        leading: Image.asset('assets/images/img.png'),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
        }, icon: Icon(Icons.settings_rounded))],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset('assets/images/img_1.png', fit: BoxFit.cover,)),
                ),
                SizedBox(width: 35),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '최민서',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('정해인과 결혼하는 방법을 알아내자!'),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFFA4C639).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: MediaQuery.of(context).size.width / 2 - 75,
                child: Container(
                  width: 150,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Color(0xFFA4C639).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "To do list",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80, left: 40, right: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height - 300,
                  child: ListView.builder(
                    itemCount: toDoLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoItem(
                        title: toDoLists[index],
                        onDelete: () {
                          setState(() {
                            toDoLists.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 50,
                child: AddButton(onPressed: _showAddToDoDialog),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 수정된 _showAddToDoDialog 메서드
  void _showAddToDoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '할 일 추가',
            style: TextStyle(color: Colors.black), // 제목 텍스트 색상 설정
          ),
          content: TextField(
            controller: _textController,
            style: TextStyle(color: Colors.black), // 활성화 시 텍스트 색상 검정
            decoration: InputDecoration(
              hintText: '할 일을 입력하세요',
              hintStyle: TextStyle(color: Colors.grey), // 비활성화 시 텍스트 색상 회색
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // 비활성화 시 테두리 회색
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black), // 활성화 시 테두리 검정
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog 닫기
              },
              child: Text(
                '취소',
                style: TextStyle(color: Colors.black), // "취소" 버튼 텍스트 색상 검정
              ),
            ),
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    toDoLists.add(_textController.text);
                    _textController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                '추가',
                style: TextStyle(color: Colors.black), // "추가" 버튼 텍스트 색상 검정
              ),
            ),
          ],
        );
      },
    );
  }
}
