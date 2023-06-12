import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class ProfileController {
  TextEditingController name = TextEditingController();
  MaskedTextController telefone = MaskedTextController(mask: '(00) 00000-0000');
}
