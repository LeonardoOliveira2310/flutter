import 'package:design_resposivo/models/data.dart' as data;
import 'package:design_resposivo/models/models.dart';
import 'package:design_resposivo/widgets/email_widget.dart';
import 'package:design_resposivo/widgets/search_bar.dart' as search_bar;
import 'package:flutter/material.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          search_bar.SearchBar(currentUser: currentUser),
          const SizedBox(height: 8.0),
          ...List.generate(data.emails.length, (index) {
            return Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 8.0),
              child: EmailWidget(
                email: data.emails[index],
                onSelected: onSelected != null
                    ? () {
                        onSelected!(index);
                      }
                    : null,
                isSelected: selectedIndex == index,
              ),
            );
          }),
        ],
      ),
    );
  }
}
