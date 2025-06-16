import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:mileseducation/common/configuration/enum.dart';
import 'package:mileseducation/common/constants/commonstring.dart';
import 'package:mileseducation/common/themes/commonButton.dart';
import 'package:mileseducation/common/utils/common_function.dart';
import 'package:mileseducation/common/utils/common_text_style.dart';
import 'package:mileseducation/common/utils/constrants.dart';
import 'package:mileseducation/common/utils/custom_divider.dart';
import 'package:mileseducation/common/utils/page_route.dart';
import 'package:mileseducation/common/widget/notepad_edtior.dart';
import 'package:mileseducation/view/home_screen/api/homepage_api_provider.dart';
import 'package:mileseducation/view/home_screen/model/add_model.dart';

class HomeScreenPage extends ConsumerStatefulWidget {
  const HomeScreenPage({super.key});

  @override
  _HomeScreenPagePageState createState() => _HomeScreenPagePageState();
}

class _HomeScreenPagePageState extends ConsumerState<HomeScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homePageStatus).fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notesNotifier = ref.watch(homePageStatus);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "📋 ${CommonString.myNotes}",
                    style: CommonStyle.BlackText18w600(),
                  ),
                  CommonButton(
                    fontColor: whiteColor,
                    color: mainColor,
                    onPressed: () {
                      showNoteDialog(context, false, ref);
                    },
                    icon: const Icon(Icons.add, color: whiteColor),
                    textarea: CommonString.add,
                  ),
                ],
              ),
              CustomDivider.ThinDivider(),

              /// Notes List
              Expanded(
                child: notesNotifier.homePageStatus == Status.loading
                    ? const Center(child: CircularProgressIndicator())
                    : notesNotifier.homePageStatus == Status.networkError
                    ? noInternet(notesNotifier.fetchNotes)
                    : notesNotifier.notes.isEmpty
                    ? nodataFounddata()
                    : ListView.builder(
                        itemCount: notesNotifier.notes.length,
                        itemBuilder: (context, index) {
                          final note = notesNotifier.notes[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              title: Text(
                                note.dateTime,
                                style: CommonStyle.BlackText12w500(),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: HtmlWidget(
                                  note.description,
                                  textStyle: CommonStyle.BlackText10w400(),
                                ),
                              ),
                              trailing: PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    showNoteDialog(
                                      context,
                                      true,
                                      ref,
                                      note: note,
                                    );
                                  } else if (value == 'delete') {
                                    ref
                                        .read(homePageStatus)
                                        .deleteNote(note.id);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Text(CommonString.edit),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Text(CommonString.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNoteDialog(
    BuildContext context,
    bool update,
    WidgetRef ref, {
    Note? note,
  }) {
    final descriptionController = TextEditingController(
      text: note?.description ?? '',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 12,
            left: 12,
            right: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 8,
                  decoration: BoxDecoration(
                    color: darkGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              NotePadEditor(
                initialText: descriptionController.text,
                onChanged: (val) {
                  descriptionController.text = val;
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonButton(
                    onPressed: () {
                      descriptionController.clear();
                      navigatePop(context);
                    },
                    textarea: CommonString.discard,
                    color: whiteColor,
                    fontColor: blackColor,
                  ),
                  const SizedBox(width: 12),
                  CommonButton(
                    onPressed: () async {
                      final String formattedDateTime = DateFormat(
                        'dd-MM-yyyy hh:mm a',
                      ).format(DateTime.now());

                      if (note == null) {
                        await ref
                            .read(homePageStatus)
                            .addNote(
                              formattedDateTime,
                              descriptionController.text,
                            );
                      } else {
                        await ref
                            .read(homePageStatus)
                            .updateNote(
                              note.id,
                              formattedDateTime,
                              descriptionController.text,
                            );
                      }

                      navigatePop(context);
                    },
                    textarea: CommonString.save,
                    color: mainColor,
                    fontColor: whiteColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
