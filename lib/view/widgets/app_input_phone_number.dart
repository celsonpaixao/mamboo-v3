import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mamaboo_v3/styles/app_stytles.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';

class CoutryTypeNumber {
  final String label;
  final String imageuRL;
  final String placeSquima;
  final int maxLength;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  CoutryTypeNumber(
      {required this.label,
      required this.imageuRL,
      required this.placeSquima,
      this.controller,
      this.validator,
      this.onChanged,
      required this.maxLength});

  // Sobrescrever o equals e hashCode para comparar com base no 'label'
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoutryTypeNumber && other.label == label;
  }

  @override
  int get hashCode => label.hashCode;
}

// Formatter personalizado para diferentes formatações por país
class PhoneNumberFormatter extends TextInputFormatter {
  final String countryLabel;

  PhoneNumberFormatter({required this.countryLabel});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text
        .replaceAll(RegExp(r'\D'), ''); // Remove tudo que não for dígito
    String formattedText = '';

    switch (countryLabel) {
      case 'AO':
        formattedText = _applyPattern(newText, [3, 3, 3]);
        break;
      case 'BR':
        formattedText = _applyPattern(newText, [2, 5, 4]);
        break;
      case 'US':
        formattedText = _applyPattern(newText, [3, 3, 4]);
        break;
      case 'TZ':
        formattedText = _applyPattern(newText, [3, 3, 4]);
        break;
      default:
        formattedText = newText;
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _applyPattern(String text, List<int> pattern) {
    int index = 0;
    StringBuffer formatted = StringBuffer();

    for (int part in pattern) {
      if (index + part > text.length) {
        formatted.write(text.substring(index));
        break;
      }
      formatted.write(text.substring(index, index + part));
      index += part;

      if (index < text.length) {
        formatted.write(' ');
      }
    }

    return formatted.toString();
  }
}

class AppInputPhoneNumber extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  const AppInputPhoneNumber({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<AppInputPhoneNumber> createState() => _AppInputPhoneNumberState();
}

class _AppInputPhoneNumberState extends State<AppInputPhoneNumber> {
  final List<CoutryTypeNumber> _countryCodes = [
    CoutryTypeNumber(
        label: 'AO',
        imageuRL: 'assets/Flag_of_Angola.svg.png',
        placeSquima: '(+244) 923 456 789',
        maxLength: 9),
    CoutryTypeNumber(
      label: 'TZ',
      imageuRL: 'assets/Flag_of_Tanzania.svg.png',
      placeSquima: '(+255) 092 345 6789',
      maxLength: 10,
    ),
  ];

  CoutryTypeNumber _selectedCountryCode = CoutryTypeNumber(
      label: 'AO',
      imageuRL: 'assets/Flag_of_Angola.svg.png',
      placeSquima: '(+244) 923 456 789',
      maxLength: 9);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          text: "Telefone",
          style: AppTextStyle.h4_bold,
        ),
        const AppVerticalSpacing(
          values: 10,
        ),
        TextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          maxLength: _selectedCountryCode.maxLength ?? 10,
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) {
            return null; // Remove a exibição do contador
          },
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.all(12),
            fillColor: Colors.white.withOpacity(0.3),
            border: borderTyle,
            errorBorder: borderTyle,
            enabledBorder: borderTyle,
            focusedBorder: borderTyle,
            disabledBorder: borderTyle,
            focusedErrorBorder: borderTyle,

            prefixIcon: _buildSelectorCuntry(),
            prefixIconConstraints: const BoxConstraints(minWidth: 89),
            // Placeholder dinâmico com base no país selecionado
            hintText: _selectedCountryCode.placeSquima ?? 'Enter phone number',
            hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSelectorCuntry() {
    return Container(
      width: 89,
      height: 35,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: DropdownButton<CoutryTypeNumber>(
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black,
          size: 14,
        ),
        borderRadius: BorderRadius.circular(8),
        focusColor: Colors.white.withOpacity(0.8),
        dropdownColor: Colors.white.withOpacity(0.9),
        value: _selectedCountryCode,
        onChanged: (CoutryTypeNumber? newValue) {
          setState(() {
            _selectedCountryCode = newValue!;
          });
        },
        items: _countryCodes.map<DropdownMenuItem<CoutryTypeNumber>>(
            (CoutryTypeNumber country) {
          return DropdownMenuItem<CoutryTypeNumber>(
            value: country,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(country.imageuRL),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(country.label),
              ],
            ),
          );
        }).toList(),
        underline: const SizedBox(), // Remove a linha padrão do Dropdown
      ),
    );
  }
}
