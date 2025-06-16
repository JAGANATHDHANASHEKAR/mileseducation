import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class NotePadEditor extends StatefulWidget {
  const NotePadEditor({super.key, required this.onChanged, this.initialText});
  final ValueChanged<String> onChanged;
  final String? initialText;

  @override
  State<NotePadEditor> createState() => _NotePadEditorState();
}

class _NotePadEditorState extends State<NotePadEditor> {
  final HtmlEditorController _editorController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HtmlEditor(
        controller: _editorController,
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Enter text here...",
          autoAdjustHeight: true,
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          toolbarPosition: ToolbarPosition.belowEditor,
          defaultToolbarButtons: [
            FontButtons(),
            FontSettingButtons(),
            ListButtons(),
            OtherButtons(copy: false, paste: false),
          ],
        ),
        otherOptions: OtherOptions(height: 300),
        callbacks: Callbacks(
          onInit: () {
            if (widget.initialText != null && widget.initialText!.isNotEmpty) {
              _editorController.setText(widget.initialText!);
            }
          },
          onChangeContent: (String? changed) {
            if (changed != null) widget.onChanged(changed);
          },
        ),
      ),
    );
  }
}
