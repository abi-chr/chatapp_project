import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  // const MessageBubble({Key key}) : super(key: key);
  MessageBubble(
    this.message,
    this.isUser,
    // {this.key}
  );

  // final Key key;
  final String message;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isUser
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft:
                  !isUser ? Radius.circular(0.0) : Radius.circular(12.0),
              bottomRight:
                  isUser ? Radius.circular(0.0) : Radius.circular(12.0),
            ),
          ),
          width: 140.0,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isUser
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
