import 'package:design_resposivo/models/data.dart' as data;
import 'package:design_resposivo/widgets/email_widget.dart';
import 'package:flutter/material.dart';

class ReplyListView extends StatelessWidget {
  const ReplyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(right: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          ...List.generate(data.replies.length, (index) {
            return Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 8.0),
              child: EmailWidget(
                email: data.replies[index],
                isPreview: false,
                isThreaded: true,
                showHeadline: index == 0,
              ),
            );
          }),
        ],
      ),
    );
  }
}
