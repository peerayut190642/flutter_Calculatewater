import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'แอพคำนวณค่าน้ำปะปา ',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            backgroundColor: Color.fromARGB(255, 173, 210, 252),
          ),
          body: HOME(),
        ));
  }
}

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HOME> with SingleTickerProviderStateMixin {
  TextEditingController q = TextEditingController();
  TextEditingController p = TextEditingController();
  TextEditingController result = TextEditingController();
  late AnimationController _controller;
  int calculate = 0;

  @override
  void initState() {
    super.initState();
    result.text = "อัตราค่าไฟ x หน่วย จำนวนยูนิต x บาท ราคาสุทธิ x บาท";

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Column(children: [
        Image.asset(
          'images/i1.jpg',
          width: 300,
        ),
        Text(
          "คำนวณค่าน้ำ",
          style: TextStyle(fontSize: 35),
        ),
        SizedBox(height: 10),
        TextField(
            controller: q,
            decoration: InputDecoration(
                labelText: "อัตราน้ำ", border: OutlineInputBorder())),
        SizedBox(height: 25),
        TextField(
            controller: p,
            decoration: InputDecoration(
                labelText: "ราคาต่อหน่วย", border: OutlineInputBorder())),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
          onPressed: () {
            var cal = int.parse(q.text) * int.parse(p.text);
            print("จำนวน ${q.text} ");
            print("ราคาต่อหน่วย ${p.text} บาท");
            print("ราคาสุทธิ ${cal} บาท");

            setState(() {
              result.text =
              "จำนวนสินค้า${q.text} x ชิ้น ราคาต่อหน่วย${p.text} x บาท ราคาสุทธิ  ${cal} x บาท";
              calculate= int.parse(q.text) * int.parse(p.text);;

            });
          },
          child: Text('คำนวณ'),
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 28, 4, 160)),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0)),
              textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
        ),
        Text("ค่าน้ำทั้งหมดคือ: $calculate บาท" ,style: TextStyle(fontSize: 30),)
      ],
      ),
      ),
    );
  }
}