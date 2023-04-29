import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _criarNome = TextEditingController();
  final TextEditingController _criarCpf = TextEditingController();
  final TextEditingController _criarSenha = TextEditingController();
  final TextEditingController _confirmarSenha = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 48, left: 16),
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(fontSize: 48),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 2),
                child: Row(
                  children: [
                    const Text("Já possui cadastro?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Login!"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _criarNome,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nome completo é obrigatório.";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Nome Completo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _criarCpf,
                  validator: (value) {
                    if (value!.length != 11) {
                      return "CPF inválido.";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "CPF",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _criarSenha,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Senha deve conter pelo menos 6 caracteres.";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _confirmarSenha,
                  validator: (value) {
                    if (_confirmarSenha.text != _criarSenha.text) {
                      return "As senhas devem ser iguais.";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Confirmar Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue[700]),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => isLoading = true);
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() => isLoading = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Cadastro Realizado Com Sucesso!',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center),
                            duration: Duration(seconds: 1),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: isLoading
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
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
