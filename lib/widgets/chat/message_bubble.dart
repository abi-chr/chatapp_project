import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  // const MessageBubble({Key key}) : super(key: key);
  MessageBubble(
    this.message,
    this.username,
    this.userImage,
    this.isUser,
    // {this.key}
  );

  // final Key key;
  final String message;
  final String username;
  final String userImage;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12.0),
                  topRight: const Radius.circular(12.0),
                  bottomLeft: !isUser
                      ? const Radius.circular(0.0)
                      : const Radius.circular(12.0),
                  bottomRight: isUser
                      ? const Radius.circular(0.0)
                      : const Radius.circular(12.0),
                ),
              ),
              width: 140.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 8.0,
              ),
              child: Column(
                crossAxisAlignment:
                    isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isUser
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Colors.purple,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isUser
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Colors.purple,
                    ),
                    textAlign: isUser ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -15,
          left: isUser ? null : 130,
          right: isUser ? 130 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
    );
  }
}
