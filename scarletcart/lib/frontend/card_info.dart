import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for input formatters

// No main() function or MyApp widget here

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>(); // Optional: for form validation
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvcController = TextEditingController();

  // --- Define colors (keep these or manage them via your app's theme) ---
  final Color lightGreenBackground = const Color(0xFFF0FFF6);
  final Color darkerGreenAccent = const Color(0xFFE0F8E7);
  final Color primaryGreen = const Color(0xFF6CC48E);
  final Color darkGreenText = const Color(0xFF174A2C);
  final Color labelTextColor = const Color(0xFF6A8A7A);
  final Color inputTextColor = Colors.black87;
  final Color summaryTextColor = const Color(0xFF4F6D60);
  // --- End Color Definitions ---

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _expDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access theme data if defined in your MaterialApp
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;
    final appBarTheme = theme.appBarTheme;

    return Scaffold(
      // Use theme background or fallback
      backgroundColor: theme.scaffoldBackgroundColor ?? lightGreenBackground,
      appBar: AppBar(
        // Use theme settings or fallbacks
        backgroundColor: appBarTheme.backgroundColor ?? lightGreenBackground,
        elevation: appBarTheme.elevation ?? 0,
        scrolledUnderElevation: appBarTheme.scrolledUnderElevation ?? 0.0,
        iconTheme: appBarTheme.iconTheme ?? IconThemeData(color: darkGreenText),
        titleTextStyle: appBarTheme.titleTextStyle ??
            TextStyle(
              color: darkGreenText,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'YourAppFont', // Replace if needed
            ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios, size: 20), // Or Icons.arrow_back
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text('Add Card'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: darkGreenText.withOpacity(0.3),
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      context: context, // Pass context to use theme
                      controller: _cardHolderNameController,
                      label: 'CARD HOLDER NAME',
                      hint: 'John Smith',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 25),
                    _buildTextField(
                      context: context,
                      controller: _cardNumberController,
                      label: 'CARD NUMBER',
                      hint: '0000 0000 0000 0000',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildTextField(
                            context: context,
                            controller: _expDateController,
                            label: 'EXP DATE',
                            hint: 'MM/YY',
                            keyboardType: TextInputType.datetime,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              ExpiryDateInputFormatter(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildTextField(
                            context: context,
                            controller: _cvcController,
                            label: 'CVC',
                            hint: '123',
                            keyboardType: TextInputType.number,
                            isObscure: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          _buildSummaryAndPaymentSection(context), // Pass context
        ],
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context, // Accept context
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool isObscure = false,
    List<TextInputFormatter>? inputFormatters,
  }) {
    // Use theme for label style or fallback
    final textTheme = Theme.of(context).textTheme;
    final effectiveLabelStyle =
        Theme.of(context).inputDecorationTheme.labelStyle ??
            TextStyle(
                color: labelTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: effectiveLabelStyle),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObscure,
          inputFormatters: inputFormatters,
          style: TextStyle(
              color: inputTextColor,
              fontSize:
                  16), // Or textTheme.bodyLarge?.copyWith(color: inputTextColor)
          // Use InputDecoration defined in theme, but override hintText/Style
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
            // Content padding etc. inherited from theme or can be set here
            // border: UnderlineInputBorder(...) // Inherited from theme
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSummaryAndPaymentSection(BuildContext context) {
    // Accept context
    final theme = Theme.of(context); // Access theme for button styling etc.
    final buttonTheme = theme.elevatedButtonTheme.style;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
          color: darkerGreenAccent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: darkGreenText.withOpacity(0.4),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSummaryRow('Subtotal', '\$35.96'),
          const SizedBox(height: 8),
          _buildSummaryRow('Delivery', '\$2.00'),
          const SizedBox(height: 8),
          _buildSummaryRow('Total', '\$37.96', isTotal: true),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Processing Payment...',
                    )),
              );
            },
            // Use theme button style or fallback
            style: buttonTheme?.copyWith(
                  // Start with theme style
                  backgroundColor: MaterialStateProperty.all(primaryGreen),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                  elevation: MaterialStateProperty.all(2),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    // fontFamily: 'YourAppFont', // Should be inherited from theme
                  )),
                ) ??
                ElevatedButton.styleFrom(
                  // Fallback style
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    // fontFamily: 'YourAppFont',
                  ),
                ),
            child: const Text('Make Payment'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    // Potentially use Theme.of(context).textTheme here too
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: summaryTextColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
            color: isTotal ? darkGreenText : summaryTextColor,
          ),
        ),
      ],
    );
  }
}

// --- Custom Input Formatters (Keep these) ---

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double space
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset < oldValue.selection.baseOffset) {
      if (oldValue.text.endsWith('/') && !newValue.text.endsWith('/')) {
        if (text.length > 1) {
          text = text.substring(0, text.length - 1);
        }
      }
      return newValue.copyWith(
          text: text, selection: TextSelection.collapsed(offset: text.length));
    }

    if (text.length == 2 && !text.contains('/')) {
      text += '/';
    } else if (text.length == 3 && !text.endsWith('/')) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }
    if (text.length > 5) {
      text = text.substring(0, 5);
    }

    return newValue.copyWith(
        text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}
