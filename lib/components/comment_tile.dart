import 'package:flutter/material.dart';
import '../models/models.dart';


class CommentTile extends StatelessWidget {
  final Comment comment;
  const CommentTile({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          maxRadius: 20,
          backgroundImage: AssetImage('assets/blank-profile.png'),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.value,style: const TextStyle(fontSize: 16),),
              Text(
                comment.createdAt.substring(0,10),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
