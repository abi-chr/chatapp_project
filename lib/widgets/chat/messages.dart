// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots()
          .map<dynamic>((snapshot) {
        List<dynamic> docs = [];
        snapshot.docs.forEach((asyncdoc) async {
          final doc = await FirebaseFirestore.instance
              .collection("chat")
              .doc(asyncdoc.id)
              .get();
          docs.add(doc);
        });
        return docs;
      }),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final chatDocs = chatSnapshot.data;
        if (FirebaseAuth.instance.currentUser.uid.isNotEmpty) {
          // Map docs = Map();
          var foo = "";
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) => MessageBubble(
              chatDocs[index].id,
              chatDocs[index].id,
              chatDocs[index].id,
              true,
            ),
            // itemBuilder: (context, index) => MessageBubble(
            //     chatDocs[index]['text'],
            //     chatDocs[index]['username'],
            //     chatDocs[index]['userImage'],
            //     chatDocs[index]['userId'] ==
            //         FirebaseAuth.instance.currentUser.uid),
            // key: ValueKey(chatDocs[index].documentID),
          );
        }
        return const Text('You have no data');
      },
    );
  }
}
