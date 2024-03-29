part of 'change_user_detail_view.dart';

class ChangeUserDetail extends ConsumerStatefulWidget {
  const ChangeUserDetail({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

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
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const AutoSizeText(
                    'Kişisel Bilgilerinizi Değiştirin',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxFontSize: 30,
                    minFontSize: 20,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
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
                    mask: '###########',
                    filter: {"#": RegExp(r'[0-9]')},
                    inputType: TextInputType.phone,
                    topLabel: 'TELEFON*',
                    formFieldLabel: '0 (---) --- -- --',
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
        ],
      ),
    );
  }
}
