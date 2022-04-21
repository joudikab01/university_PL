import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/comment_tile.dart';
import '../providers/products_manager.dart';
import '../models/models.dart';

class CommentsListView extends StatelessWidget {
  final List<Comment> comments;
  const CommentsListView({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: comments.length,
            itemBuilder: (context,index){
              final comment=comments[index];
              return CommentTile(comment: comment,);
            },
            separatorBuilder: (context , index){
              return const SizedBox(height: 16,);
            },
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
