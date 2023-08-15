import 'package:flutter/material.dart';
import 'package:pert3/models/item_model.dart';

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({super.key});

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  final _titleEditingController = TextEditingController();

  final _descriptionEditingController = TextEditingController();

  final _priceEditingController = TextEditingController();

  bool _titleValidation = false;
  bool _descriptionValidation = false;
  bool _priceValidation = false;

  @override
  void dispose() {
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
    _priceEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create your new item",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _titleEditingController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.continueAction,
            decoration: InputDecoration(
                hintText: "Item title",
                errorText: _titleValidation ? "Title can't be empty" : null),
          ),
          TextField(
              controller: _descriptionEditingController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.continueAction,
              decoration: InputDecoration(
                  hintText: "Item description",
                  errorText: _descriptionValidation
                      ? "Description can't be empty"
                      : null)),
          TextField(
            controller: _priceEditingController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: "Item price",
                errorText: _priceValidation ? "Price can't be empty" : null),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _titleValidation = _titleEditingController.text.isEmpty;
                  _descriptionValidation =
                      _descriptionEditingController.text.isEmpty;
                  _priceValidation = _priceEditingController.text.isEmpty;
                });
                if (!_titleValidation &&
                    !_descriptionValidation &&
                    !_priceValidation) {
                  var model = ItemModel(
                      _titleEditingController.text,
                      _descriptionEditingController.text,
                      int.parse(_priceEditingController.text));
                  Navigator.pop(context, model);
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
