import 'package:flutter/material.dart';
import 'registrasi.dart';

void main() {
  runApp(const MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                Color(0xFF6087D8),
                Color(0xFFFFFFFF), 
              ],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const SizedBox(height: 75.0),
                    Image.asset(
                      'assets/images/LogoParkwell.png',
                      width: 140,
                      height: 140,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121010),
                      ),
                    ),
                    // CARD LOGIN
                    Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  labelText: "Kata Sandi",
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText =
                                          !_obscureText; 
                                    });
                                  },
                                ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kata sandi tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24.0),
                              // SizedBox(
                              //   width: double.infinity,
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       if (_formKey.currentState!.validate()) {
                              //         // Proses login
                              //         ScaffoldMessenger.of(context)
                              //             .showSnackBar(
                              //           const SnackBar(
                              //             content: Text("Login berhasil!"),
                              //           ),
                              //         );
                              //       }
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 27.0),
                    ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                      ),
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "atau",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registrasi()),
                            );
                          },
                          child: const Text(
                            "Registrasi",
                            style: TextStyle(
                              fontSize: 19.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // Logo di ujung atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/PolobatamLogo.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/Indonesia.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
