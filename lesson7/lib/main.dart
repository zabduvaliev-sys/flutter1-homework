import 'package:flutter/material.dart';

void main() {
  runApp(const RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Регистрация',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  
void submitForm() {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Подтверждение'),
          content: const Text(
            'Вы уверены, что хотите зарегистрировать пользователя с введёнными данными?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(
                      name: nameController.text,
                      surname: surnameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      login: loginController.text,
                    ),
                  ),
                );
              },
              child: const Text('ОК'),
            ),
          ],
        );
      },
    );
  }
}


  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Обязательное поле';
    }
    if (!RegExp(r'^[a-zA-Zа-яА-ЯёЁ]+$').hasMatch(value)) {
      return 'Введите только буквы';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введите телефон';
    }
    if (!RegExp(r'^\+?[0-9]{9,15}$').hasMatch(value)) {
      return 'Введите 9–15 цифр, можно с + в начале';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введите email';
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  String? validateLogin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Введите логин';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]{4,20}$').hasMatch(value)) {
      return '4–20 символов: латинские буквы, цифры, _';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 8) {
      return 'Пароль должен содержать минимум 8 символов';
    }
    return null;
  }
String? validateConfirmPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Повторите пароль';
  }

  if (value != passwordController.text) {
    return 'Пароли не совпадают';
  }

  return null;
}
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                controller: nameController,
                label: 'Имя',
                validator: validateName,
              ),
              buildTextField(
                controller: surnameController,
                label: 'Фамилия',
                validator: validateName,
              ),
              buildTextField(
                controller: phoneController,
                label: 'Телефон',
                validator: validatePhone,
                keyboardType: TextInputType.phone,
              ),
              buildTextField(
                controller: emailController,
                label: 'Email',
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              buildTextField(
                controller: loginController,
                label: 'Логин',
                validator: validateLogin,
              ),
              buildTextField(
                controller: passwordController,
                label: 'Пароль',
                validator: validatePassword,
                obscureText: true,
              ),
              buildTextField(
  controller: confirmPasswordController,
  label: 'Повторите пароль',
  validator: validateConfirmPassword,
  obscureText: true,
),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: const Text('Зарегистрироваться'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ResultPage extends StatelessWidget {
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String login;

  const ResultPage({
    super.key,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.login,
  });

  Widget infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.lightBlue, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Данные пользователя'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),

            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.lightBlue,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            infoRow(Icons.person, 'Имя', name),
            infoRow(Icons.badge, 'Фамилия', surname),
            infoRow(Icons.phone, 'Телефон', phone),
            infoRow(Icons.email, 'Email', email),
            infoRow(Icons.account_circle, 'Логин', login),
          ],
        ),
      ),
    );
  }
}
