import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../styles/style_helper.dart';
import 'helper_widget.dart';

Widget textfieldIcon({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required TextEditingController controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15, color: AppColors.txtGrey),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            border: BorderStyles.border,
            enabledBorder: BorderStyles.enableBorder,
            focusedBorder: BorderStyles.focusBorder,
            errorBorder: BorderStyles.errorBorder,
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return isRequired;
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget textfieldPassword({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required bool obsecure,
  required TextEditingController controller,
  required GestureTapCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15, color: AppColors.txtGrey),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            suffixIcon: InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Icon(
                  obsecure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 24,
                  color: AppColors.txtGrey,
                ),
              ),
              onTap: () {
                onTap();
              },
            ),
            border: BorderStyles.border,
            enabledBorder: BorderStyles.enableBorder,
            focusedBorder: BorderStyles.focusBorder,
            errorBorder: BorderStyles.errorBorder,
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return isRequired;
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget textfieldUnderline({
  required String labelText,
  String hintText = '',
  String isRequired = '',
  TextCapitalization capitalization = TextCapitalization.none,
  TextInputType inputType = TextInputType.text,
  required TextEditingController controller,
  bool readOnly = false,
}) {
  return TextFormField(
    controller: controller,
    textCapitalization: capitalization,
    keyboardType: inputType,
    readOnly: readOnly,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      label: isRequired != ''
          ? RichText(
              text: TextSpan(
                text: labelText,
                style: const TextStyle(color: AppColors.txtGrey),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          : Text(labelText),
      labelStyle: const TextStyle(color: AppColors.txtGrey, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade300),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return isRequired;
        }
      }
      return null;
    },
  );
}

// Selected Field
Widget selectedFiled({
  required String labelText,
  String hintText = '',
  String isRequired = '',
  required TextEditingController controller,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  return TextFormField(
    onTap: () {
      FocusScope.of(context).unfocus();
      onTap();
    },
    controller: controller,
    readOnly: true,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      label: isRequired != ''
          ? RichText(
              text: TextSpan(
                text: labelText,
                style: const TextStyle(color: AppColors.txtGrey),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          : Text(labelText),
      labelStyle: const TextStyle(color: AppColors.txtGrey, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.txtGrey),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return isRequired;
        }
      }
      return null;
    },
  );
}

// SearchBox Decoration
InputDecoration searchBoxDecoration = const InputDecoration(
  hintText: "Cari kata kunci...",
  hintStyle: TextStyle(fontSize: 14),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.form),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.form),
  ),
);

Widget textarea({
  String hintText = '',
  String isRequired = '',
  TextCapitalization textCapitalization = TextCapitalization.none,
  required TextEditingController controller,
  required int minLines,
}) {
  return TextFormField(
    minLines: minLines,
    keyboardType: TextInputType.multiline,
    textCapitalization: textCapitalization,
    maxLines: null,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.txtGrey),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: AppColors.form, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: AppColors.form, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: AppColors.form, width: 1),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return isRequired;
        }
      }
      return null;
    },
  );
}

Widget searchAppbar(
    {required TextEditingController controller, required onchanged}) {
  return TextField(
    controller: controller,
    onChanged: onchanged,
    decoration: const InputDecoration(
      hintText: 'ketik kata kunci...',
      hintStyle: TextStyle(
        color: AppColors.txtGrey,
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
      border: InputBorder.none,
    ),
    style: const TextStyle(
      color: Colors.black38,
    ),
  );
}

Widget textfieldSelect({
  String label = '',
  String hintText = '',
  String isRequired = '',
  required TextEditingController controller,
  required VoidCallback onTap,
}) {
  return TextFormField(
    controller: controller,
    readOnly: true,
    onTap: () {
      onTap();
    },
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      label: isRequired != ''
          ? RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(color: AppColors.txtGrey),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          : Text(label),
      labelStyle: const TextStyle(color: AppColors.txtGrey, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      hintStyle: const TextStyle(fontSize: 15, color: AppColors.txtGrey),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.form),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return isRequired;
        }
      }
      return null;
    },
  );
}

// Datepicker
Future<String> datePicker({
  required BuildContext context,
  String title = "Pilih Tanggal",
  required VoidCallback onPressed,
  String txtButton = "Pilih",
}) async {
  String _date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext builder) {
      return Material(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          height: SizeConfig.screenHeight * 0.50,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(title),
                // titleModal(title),
                const SizedBox(height: 20),
                Expanded(
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        _date = DateFormat('yyyy-MM-dd').format(value);
                      },
                      initialDateTime: DateTime.now(),
                      minimumYear: 2019,
                      maximumDate: DateTime.now(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Button(
                    txtButton: txtButton,
                    color: AppColors.primary,
                    onPressed: () {
                      onPressed();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

  return _date;
}
