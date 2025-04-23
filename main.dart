import 'package:flutter/material.dart';

void main() {
  runApp(CadastroApp());
}

class CadastroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuário',
      home: Scaffold(
        appBar: AppBar(title: Text('Cadastro')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CadastroForm(),
        ),
      ),
    );
  }
}

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  bool _aceitaTermos = false;

  void _cadastrar() {
    if (_formKey.currentState!.validate() && _aceitaTermos) {
      // TODO: Redirecionar para a tela de confirmação com Navigator.push
      // e passar o nome do usuário para a próxima tela
    } else if (!_aceitaTermos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Você precisa aceitar os termos de uso')),
      );
    }
  }

  void _limparCampos() {
    _formKey.currentState!.reset();
    _nomeController.clear();
    _emailController.clear();
    _senhaController.clear();
    _confirmaSenhaController.clear();
    setState(() {
      _aceitaTermos = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome completo'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo obrigatório';
              if (value.length < 3) return 'Digite pelo menos 3 letras';
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'E-mail'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo obrigatório';
              if (!value.contains('@') || !value.contains('.')) return 'E-mail inválido';
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _senhaController,
            decoration: InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo obrigatório';
              if (value.length < 6) return 'Mínimo de 6 caracteres';
              if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Inclua uma letra maiúscula';
              if (!RegExp(r'[0-9]').hasMatch(value)) return 'Inclua um número';
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _confirmaSenhaController,
            decoration: InputDecoration(labelText: 'Confirmar senha'),
            obscureText: true,
            validator: (value) {
              if (value != _senhaController.text) return 'As senhas não coincidem';
              return null;
            },
          ),
          SizedBox(height: 16),
          CheckboxListTile(
            title: Text('Aceito os termos de uso'),
            value: _aceitaTermos,
            onChanged: (value) {
              setState(() {
                _aceitaTermos = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _cadastrar,
                child: Text('Cadastrar'),
              ),
              OutlinedButton(
                onPressed: _limparCampos,
                child: Text('Limpar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// TODO: Criar a tela ConfirmacaoScreen que recebe o nome e exibe a mensagem