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
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final chatDocs = chatSnapshot.data.docs;
        if (FirebaseAuth.instance.currentUser.uid.isNotEmpty) {
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) => MessageBubble(
                chatDocs[index].data()['text'],
                chatDocs[index].data()['username'],
                chatDocs[index].data()['userImage'],
                chatDocs[index].data()['userId'] ==
                    FirebaseAuth.instance.currentUser.uid),
            // key: ValueKey(chatDocs[index].documentID),
          );
        }
        return const Text('You have no data');
      },
    );
  }
}
