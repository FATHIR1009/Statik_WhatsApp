import 'package:flutter/material.dart';

// membuat model chat,blue print chat
class Message{
  final String chat;
  final bool isMe;

  Message({required this.chat, required this.isMe});
}

class DetailChat extends StatefulWidget {
  const DetailChat({super.key});

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  // tambahkan controller
  TextEditingController textPesan = TextEditingController();

  final List<Message> _pesan = [
    Message(chat: 'woi bang', isMe: true),
    Message(chat: 'apa bang', isMe: false),
  ];

  // membuat fungsi tombol kirim
  void KirimPesan() {
    if(textPesan.text.trim().isEmpty) {
      return;
    }

    setState(() { // untuk perubahan
      _pesan.add(Message(chat: textPesan.text, isMe: true));
    });

    textPesan.clear();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _pesan.add(Message(chat: 'apa si bangggggggg berisik tau!!!', isMe: false));
      });
    });
  }

  @override
  void dispose() {
    textPesan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)
        ),
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
            Text('teman')
          ],
        ),
        actions: [
          IconButton(
          onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.video_camera_back_sharp),
        ),
        IconButton(
          onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.phone),
        ),
        IconButton(
          onPressed: (){
              Navigator.pop(context);
          },
          icon: Icon(Icons.more_vert),
        ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _pesan.length,
              itemBuilder: (context, index) {
                final psn = _pesan[index];
                return  Align(
                  alignment:  psn.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 5
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 181, 228, 184),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(psn.chat),
                  ),
                );
              }
            )
            ),
            Padding(padding: EdgeInsetsGeometry.all(10),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: textPesan,
                  decoration: InputDecoration(
                    hintText: "Ketik pesan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                )),
                IconButton(onPressed: KirimPesan, icon: Icon(Icons.send)
                )
              ],
            ))
        ],
      ),
    );
  }
}