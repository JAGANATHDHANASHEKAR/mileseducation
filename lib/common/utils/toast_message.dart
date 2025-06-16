import 'package:flutter/material.dart';
import '../utils/common_text_style.dart';
import '../utils/constrants.dart';
// import 'package:flutter_tts/flutter_tts.dart';

showToast(BuildContext context, msg) {
  final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10.0),
      backgroundColor: Colors.red.shade50,
      content: Row(
        children: [
          const Icon(Icons.warning_amber_outlined, color: Colors.red, size: 20),
          const SizedBox(width: 5.0),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Text(
              msg,
              style: CommonStyle.RedText16w500(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.red.shade700, // Dark color for the outline
          width: 1.0, // Width of the border
        ),
      ));
  // ignore: avoid_single_cascade_in_expression_statements
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // 🔊 Speak the error message
  // speakMessage(msg);
}

showToastSucess(BuildContext context, msg) {
  final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10.0),
      backgroundColor: Colors.green.shade50,
      content: Row(
        children: [
          const Icon(Icons.task_alt_outlined, color: Colors.green, size: 20),
          const SizedBox(width: 5.0),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Text(
              msg,
              style: CommonStyle.greenText16w500(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.green.shade700, // Dark color for the outline
          width: 1.0, // Width of the border
        ),
      ));
  // ignore: avoid_single_cascade_in_expression_statements
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // 🔊 Speak the success message
  // speakMessage(msg);
}

// // final FlutterTts flutterTts = FlutterTts();
// Future<void> speakMessage(String message) async {
//   await flutterTts.setLanguage("en-UK");
//   // // await flutterTts.setLanguage("ta-IN"); // Tamil - India
//   // // await flutterTts.setLanguage("kn-IN"); // Kannada - India
//   await flutterTts.setPitch(1);
//   await flutterTts.speak("Chetta $message");
//   // //   // English
//   // await flutterTts.setLanguage("en-IN"); // Indian English
//   // await flutterTts.setPitch(0.9); // Slightly deeper tone
//   // await flutterTts.setSpeechRate(0.4); // Slow and clear
//   // await flutterTts.speak(
//   //     "Attention please. Train number 12623, arriving at platform number 3. Please stand behind the yellow line. Thank you.");

//   // // Hindi
//   // await flutterTts.setLanguage("hi-IN"); // Hindi
//   // await flutterTts.setPitch(0.9); // Slightly deeper tone
//   // await flutterTts.setSpeechRate(0.4); // Slow and clear
//   // await flutterTts.speak(
//   //     "कृपया ध्यान दें। ट्रेन नंबर 12623, प्लेटफॉर्म नंबर 3 पर आ रही है। कृपया पीले रेखा के पीछे खड़े रहें। धन्यवाद।");

//   // // Tamil
//   // await flutterTts.setLanguage("ta-IN"); // Tamil
//   // await flutterTts.setPitch(0.9); // Slightly deeper tone
//   // await flutterTts.setSpeechRate(0.4); // Slow and clear
//   // await flutterTts.speak(
//   //     "தயவுசெய்து கவனிக்கவும். ரயில் எண் 12623, தண்டரச்கோட்டை தளத்தில் 3-ஆம் தளம் வந்துகொண்டு இருக்கின்றது. தயவுசெய்து மஞ்சள் கோடின் பின்னால் நிற்கவும். நன்றி.");

//   // // Kannada
//   // await flutterTts.setLanguage("kn-IN"); // Kannada
//   // await flutterTts.setPitch(0.9); // Slightly deeper tone
//   // await flutterTts.setSpeechRate(0.4); // Slow and clear
//   // await flutterTts.speak(
//   //     "ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ರೈಲು ಸಂಖ್ಯೆ 12623, ಪ್ಲ್ಯಾಟ್‌ಫಾರ್ಮ್ ಸಂಖ್ಯೆ 3 ಕ್ಕೆ ಬರುತ್ತಿದೆ. ದಯವಿಟ್ಟು ಹಳದಿ ರೇಖೆಯ ಹಿಂದಿರುಗಿ ನಿಲ್ಲಿ. ಧನ್ಯವಾದಗಳು.");

//   // // Malayalam
//   // await flutterTts.setLanguage("ml-IN"); // Malayalam
//   // await flutterTts.setPitch(0.9); // Slightly deeper tone
//   // await flutterTts.setSpeechRate(0.4); // Slow and clear
//   // await flutterTts.speak(
//   //     "ദയവായി ശ്രദ്ധിക്കുക. ട്രെയിന്‍ നമ്പര്‍ 12623, പ്ലാറ്റ്‌ഫോം നമ്പര്‍ 3-ല്‍ എത്തുന്നു. ദയവായി മഞ്ഞ വരി പിന്നില്‍ നിന്നാണ് നില്‍ക്കുക. നന്ദി.");
// }

showsnackBarRedBgText(BuildContext context, msg) {
  final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(10.0),
      backgroundColor: redColor,
      content: Text(
        msg,
        style: CommonStyle.WhiteText14w400(),
        textAlign: TextAlign.center,
      ));
  // ignore: avoid_single_cascade_in_expression_statements
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
