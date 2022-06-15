part of 'change_user_detail_view.dart';

class ChangeUserDetail extends ConsumerStatefulWidget {
  const ChangeUserDetail({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeUserDetailState();
}

class _ChangeUserDetailState extends ConsumerState<ChangeUserDetail> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _isReadOnly = false;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomForm(
                controller: ref.read(changeUserRiverpod).firstname,
                isReadOnly: _isReadOnly,
                inputType: TextInputType.name,
                topLabel: 'İSİM*',
                formFieldLabel: '',
                maxAlan: 1,
              ),
              CustomForm(
                controller: ref.read(changeUserRiverpod).lastname,
                isReadOnly: _isReadOnly,
                inputType: TextInputType.name,
                topLabel: 'SOYİSİM*',
                formFieldLabel: '',
                maxAlan: 1,
              ),
              CustomForm(
                controller: ref.read(changeUserRiverpod).telephone,
                isReadOnly: _isReadOnly,
                inputType: TextInputType.phone,
                topLabel: 'TELEFON*',
                formFieldLabel: '',
                maxAlan: 1,
              ),
              CustomForm(
                controller: ref.read(changeUserRiverpod).email,
                isReadOnly: _isReadOnly,
                inputType: TextInputType.emailAddress,
                topLabel: 'E-POSTA*',
                formFieldLabel: '',
                maxAlan: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(changeUserRiverpod).changeUser();
                  } else {}
                },
                child: const Text('GÜNCELLE'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
