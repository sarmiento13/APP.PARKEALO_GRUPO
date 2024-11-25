import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/models/agency.dart';
import '../../../logic/providers/agency_provider.dart';

class UpdateScreen extends StatefulWidget {
  final Agency agency;

  const UpdateScreen({super.key, required this.agency});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final formKey = GlobalKey<FormState>();
  final rucController = TextEditingController();
  final companyNameController = TextEditingController();
  final addressController = TextEditingController();
  final referenceController = TextEditingController();
  final emailController = TextEditingController();
  final servicesController = TextEditingController();
  final descriptionController = TextEditingController();
  final cellPhoneNumberController = TextEditingController();
  final schedulesController = TextEditingController();
  final attentionTimeController = TextEditingController();
  final frontPageController = TextEditingController();
  final avatarController = TextEditingController();
  final locationController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void initState() {
    rucController.text = widget.agency.ruc;
    companyNameController.text = widget.agency.companyName;
    // addressController.text = widget.agency.address!;
    // referenceController.text = widget.agency.reference!;
    // emailController.text = widget.agency.email!;
    // servicesController.text = widget.agency.services!;
    // descriptionController.text = widget.agency.description!;
    // cellPhoneNumberController.text = widget.agency.cellPhoneNumber!;
    // schedulesController.text = widget.agency.schedules!;
    // attentionTimeController.text = widget.agency.attentionTime!;
    // frontPageController.text = widget.agency.frontPage!;
    // avatarController.text = widget.agency.avatar!;
    // locationController.text = widget.agency.location!;
    // categoryController.text = widget.agency.categoryId as String;
    super.initState();
  }

  @override
  void dispose() {
    rucController.dispose();
    companyNameController.dispose();
    addressController.dispose();
    referenceController.dispose();
    emailController.dispose();
    servicesController.dispose();
    descriptionController.dispose();
    cellPhoneNumberController.dispose();
    schedulesController.dispose();
    attentionTimeController.dispose();
    frontPageController.dispose();
    avatarController.dispose();
    locationController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void toggleForm() {
    if (formKey.currentState!.validate()) {
      print('Formulario válido');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Agencia modificado'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final agencyProvider = Provider.of<AgencyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
        actions: [
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                print('Formulario válido');
                final agency = Agency(
                  id: widget.agency.id,
                  ruc: rucController.text.trim(),
                  companyName: companyNameController.text.trim(),
                  address: addressController.text.trim(),
                  reference: referenceController.text.trim(),
                  email: emailController.text.trim(),
                  services: servicesController.text.trim(),
                  description: descriptionController.text.trim(),
                  cellPhoneNumber: cellPhoneNumberController.text.trim(),
                  schedules: schedulesController.text.trim(),
                  attentionTime: attentionTimeController.text.trim(),
                  location: locationController.text.trim(),
                  joinedDate: DateTime.now(),
                  categoryId: int.parse(categoryController.text.trim()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Agencia modifcado'),
                    duration: Duration(seconds: 2),
                  ),
                );
                context.pop();
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/onboarding/01.jpg',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    FilledButton.tonal(
                      onPressed: () {},
                      child: const Text('Subir portada'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: rucController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.assignment_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'RUC (*)',
                ),
                maxLength: 11,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un RUC';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: companyNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_balance_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Nombre empresa (*)',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre de empresa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Dirección',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: referenceController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.library_books_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Referencia',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Correo electrónico',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Por favor ingresa un correo electrónico';
                //   }
                //   String emailPattern =
                //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                //   RegExp regExp = RegExp(emailPattern);
                //   if (!regExp.hasMatch(value)) {
                //     return 'El formato de correo electrónico no es válido';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: servicesController,
                maxLines: 2,
                decoration: const InputDecoration(
                  icon: Icon(Icons.directions_bus_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Servicios',
                ),
                maxLength: 75,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: descriptionController,
                maxLines: 8,
                decoration: const InputDecoration(
                  icon: Icon(Icons.article_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
                maxLength: 300,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: cellPhoneNumberController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Número de celular',
                ),
                maxLength: 9,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: schedulesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_today_outlined),
                  labelText: 'Horarios',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: attentionTimeController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                  labelText: 'Atención',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Ubicación',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                  labelText: 'Categoria',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una categoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ClipOval(
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/onboarding/02.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    FilledButton.tonal(
                      onPressed: () {},
                      child: const Text('Subir avatar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
