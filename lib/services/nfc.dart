import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class Nfc {
  var result;
  dynamic tagRead() async {
    var result1;
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final tech = Ndef.from(tag);
      var jsonString;
      final cachedMessage = tech?.cachedMessage;
      String? decodedPayload;
      Iterable.generate(cachedMessage!.records.length).forEach((i) {
        final record = cachedMessage.records[i];

        decodedPayload = utf8.decode(record.payload);
        jsonString = decodedPayload!.substring(3);
        var result1 = jsonDecode(jsonString);
        print(result["Subject"]);
      });
      NfcManager.instance.stopSession();
    });
  }

  void ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText(
            '{"Division":"D12B","Subject":"CSS","Date":"17-02-22"}'),
      ]);

      try {
        await ndef.write(message);
        result = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result = e;
        NfcManager.instance.stopSession(errorMessage: result.toString());
        return;
      }
    });
  }
}
