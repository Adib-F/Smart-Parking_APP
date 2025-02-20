import 'package:flutter/material.dart';
import 'login.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  // State untuk pengguna
  final TextEditingController _identitasController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _platController = TextEditingController();
  String? _selectedKendaraan;
  String? _selectedjenisPengguna;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6087D8),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
          ),
          // Scrollable Form
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(height: 85.0),
                  Image.asset(
                    'assets/images/LogoParkwell.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16.0),
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
                            const Text(
                              "Registrasi",
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF121010),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: _identitasController,
                              decoration: InputDecoration(
                                labelText: "NIM/NIDN/NIP/NIK",
                                prefixIcon: const Icon(Icons.badge),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Identitas tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Jenis Pengguna",
                                prefixIcon: const Icon(Icons.list),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              value: _selectedjenisPengguna,
                              items: ['Mahasiswa', 'Pegawai']
                                  .map(
                                    (jenisPengguna) => DropdownMenuItem<String>(
                                      value: jenisPengguna,
                                      child: Text(jenisPengguna),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedjenisPengguna = newValue;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Jenis Pengguna";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
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
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: _noHpController,
                              decoration: InputDecoration(
                                labelText: "Nomor Telepon",
                                prefixIcon: const Icon(Icons.phone),
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
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: _namaController,
                              decoration: InputDecoration(
                                labelText: "Nama Lengkap",
                                prefixIcon: const Icon(Icons.person),
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
                            const SizedBox(height: 10.0),
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
                            const SizedBox(height: 10.0),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Pilih Kendaraan",
                                prefixIcon: const Icon(Icons.directions_car),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              value: _selectedKendaraan,
                              items: ['Motor', 'Mobil']
                                  .map(
                                    (kendaraan) => DropdownMenuItem<String>(
                                      value: kendaraan,
                                      child: Text(kendaraan),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedKendaraan = newValue;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Pilih kendaraan";
                                }
                                return null;
                              },
                            ),                            
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: _platController,
                              decoration: InputDecoration(
                                labelText: "Plat Kendaraan",
                                prefixIcon:
                                    const Icon(Icons.confirmation_number),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Plat Kendaraan tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
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
                        "Daftar",
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
                                  builder: (context) => Login()),
                            );
                          },
                          child: const Text(
                            "Masuk",
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
          // Logo Header
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
                    'assets/images/Indonesia.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/PolobatamLogo.png',
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
