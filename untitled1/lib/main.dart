import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
    debugShowCheckedModeBanner: false, // لإزالة علامة Debug
  ));
}

class  LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // المتغيرات لتخزين القيم
  String name = '';
  String email = '';
  String phone = '';
  String idNumber = '';
  String licenseNumber = '';

  // شاشة الترحيب
  void _navigateToWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الدخول"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // الاسم
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم';
                    }
                    return null;
                  },
                  onSaved: (value) => name = value!,
                ),
                SizedBox(height: 10),

                // البريد الإلكتروني
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'البريد الإلكتروني',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@')) {
                      return 'الرجاء إدخال بريد إلكتروني صحيح';
                    }
                    return null;
                  },
                  onSaved: (value) => email = value!,
                ),
                SizedBox(height: 10),

                // رقم الهاتف
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    return null;
                  },
                  onSaved: (value) => phone = value!,
                ),
                SizedBox(height: 10),

                // رقم الهوية الوطنية
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'رقم الهوية الوطنية',
                    prefixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الهوية الوطنية';
                    }
                    return null;
                  },
                  onSaved: (value) => idNumber = value!,
                ),
                SizedBox(height: 10),

                // رقم ترخيص البلدية
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'رقم ترخيص البلدية',
                    prefixIcon: Icon(Icons.business),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم ترخيص البلدية';
                    }
                    return null;
                  },
                  onSaved: (value) => licenseNumber = value!,
                ),
                SizedBox(height: 20),

                // زر الإرسال
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _navigateToWelcomePage(); // الانتقال للصفحة التالية
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// صفحة الترحيب
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'عمرو خالد المشدلي',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
      ),
    );
  }
}