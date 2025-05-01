import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({super.key});

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('PDF Generator'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.picture_as_pdf, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                'Fill the Form to Generate PDF',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              const SizedBox(height: 30),

              _buildTextField(controller: _nameController, label: 'Name'),
              const SizedBox(height: 20),
              _buildTextField(controller: _addressController, label: 'Address'),
              const SizedBox(height: 20),
              _buildTextField(controller: _ageController, label: 'Age', keyboardType: TextInputType.number),

              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.save),
                label: const Text('Generate PDF', style: TextStyle(fontSize: 18,color: Colors.white)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    makePdf();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Future<void> makePdf() async {
    final pdf = p.Document();

    pdf.addPage(
      p.Page(
        build: (p.Context context) => p.Padding(
          padding: const p.EdgeInsets.all(20),
          child: p.Column(
            crossAxisAlignment: p.CrossAxisAlignment.start,
            children: [
              p.Text('User Details', style: p.TextStyle(fontSize: 24, fontWeight: p.FontWeight.bold)),
              p.SizedBox(height: 20),
              p.Text('Name: ${_nameController.text}'),
              p.Text('Address: ${_addressController.text}'),
              p.Text('Age: ${_ageController.text}'),
            ],
          ),
        ),
      ),
    );

    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}/user_form.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    if (kDebugMode) print('PDF saved at $path');
    OpenFile.open(path);
  }
}
