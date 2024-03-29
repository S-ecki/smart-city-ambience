import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/screens/eventDetailScreen/singleComment.dart';
import 'commentContainer.dart';

/**
 * 
 */
class CommentSection extends StatelessWidget {
  CommentSection({this.eventId, this.label});

  final String eventId;
  final String label;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReactionsState,
        Map<String, Map<String, List<String>>>>(
      converter: (store) => store.state.comments,
      builder: (context, Map<String, Map<String, List<String>>> comments) =>
          Card(
        shape: RoundedRectangleBorder(
        ),
        elevation: 2,
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: comments[eventId] != null
                        ? comments[eventId]
                            .entries
                            .map(
                              (entry) => entry.value
                                  .map(
                                    (comment) => CommentContainer(
                                      child: SingleComment(
                                        userName: entry.key,
                                        comment: comment,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                            .expand((item) => item)
                            .toList()
                        : [Text("Sei der erste!")],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
