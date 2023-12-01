import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_down_project/components/delete_button.dart';
import 'package:my_down_project/components/like_button.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;
  final String time;
  final String postId;
  final List<String> likes;
  const WallPost({
    super.key,
    required this.message,
    required this.user,
    required this.time,
    required this.postId,
    required this.likes,
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser;
  bool isLiked = false;

  //comment text controller

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser?.email);
  }

  //toggle like
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //Access the document is Firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      //if the post is now liked, add the user's email to the likes field
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser?.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser?.email])
      });
    }
  }

  //show a dialog box for adding comment

  void deletePost() {
    //show a dialog box asking for confirmation before deleting the post
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Deletar Post"),
        content:
            const Text("Você tem creteza que deseja deletar essa postagem?"),
        actions: [
          // CANCEL BUTTON
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          // DELETE BUTTON
          TextButton(
            onPressed: () async {
              // delete the comments from firestore first
              // (if you only delete the post, the comments will still be stored in firestore) then delete the post
              final commentDocs = await FirebaseFirestore.instance
                  .collection("User Posts")
                  .doc(widget.postId)
                  .collection("Comments")
                  .get();

              for (var doc in commentDocs.docs) {
                await FirebaseFirestore.instance
                    .collection("User Posts")
                    .doc(widget.postId)
                    .collection("Comments")
                    .doc(doc.id)
                    .delete();
              }

              //then delete the post
              FirebaseFirestore.instance
                  .collection('User Posts')
                  .doc(widget.postId)
                  .delete()
                  .then((value) => ('Postagem excluída'))
                  .catchError((error) => ('Falha ao excluir: $error'));

              //dismiss the dialog
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text("Excluir"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //wallpost

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //message
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.user,
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.message),

                // DELETE BUTTON
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        Text(
          widget.time,
          style: TextStyle(color: Colors.grey[400]),
        ),
        const SizedBox(height: 20),
        //buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //like
            Column(
              children: [
                // like button
                LikeButton(
                  isLiked: isLiked,
                  onTap: toggleLike,
                ),
                const SizedBox(height: 5),

                //like count
                Text(
                  widget.likes.length.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                if (widget.user == currentUser!.email)
                  DeleteButton(onTap: deletePost),
              ],
            ),

            //comment
          ],
        ),
      ]),
    );
  }
}
