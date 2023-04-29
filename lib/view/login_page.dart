import 'package:doctor_app/view/cadastro_page.dart';
import 'package:doctor_app/view/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 48, left: 16),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 48),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 16),
                child: Row(
                  children: [
                    const Text("Não possui conta?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroPage(),
                          ),
                        );
                      },
                      child: const Text("Cadastre-se!"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.length != 11) {
                      return "O cpf é inválido";
                    }
                  },
                  controller: _cpf,
                  decoration: InputDecoration(
                    labelText: "CPF",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "A senha é inválida";
                    }
                  },
                  controller: _senha,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Esqueceu sua senha?"),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[700]),
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          setState(() => isloading = true);
                          await Future.delayed(const Duration(seconds: 2));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                          setState(() => isloading = false);
                          //   _cpf.clear();
                          //    _senha.clear();
                        }
                      },
                      child: isloading
                          ? const Center(
                              child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )))
                          : const Text(
                              "Login",
                              style: TextStyle(fontSize: 16, letterSpacing: 1),
                            )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
