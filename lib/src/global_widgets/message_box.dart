
import 'package:flutter/cupertino.dart';

import '../config_files/text_config.dart';

class MessageBox extends StatelessWidget {
  final String? message;
  const MessageBox({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message?? "Please try again later" ,style: TextDesign().bodyTextSmall),
    );
  }
}
