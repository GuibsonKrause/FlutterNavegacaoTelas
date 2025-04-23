# 🚀 Desafio Flutter: Cadastro + Navegação entre Telas

## 🎯 Objetivo

Expandir o formulário de cadastro anterior com uma **nova tela de confirmação**, aplicando conceitos de **navegação entre telas no Flutter**.

---

## 🧱 O que será criado

1. Tela de **cadastro de usuário** (igual ao exercício anterior).
2. Nova tela de **confirmação**, que será exibida após o cadastro bem-sucedido.
3. A segunda tela deve exibir uma mensagem como:
   > "Usuário [NOME] cadastrado com sucesso!"

---

## ✅ Regras e Requisitos

- Utilizar `Navigator.push()` para navegar da tela de cadastro para a tela de confirmação.
- Passar o nome digitado pelo usuário para a próxima tela.
- Criar um novo widget chamado `ConfirmacaoScreen`, que recebe o nome por parâmetro.
- Ao clicar em "Cadastrar":
  - Validar o formulário.
  - Verificar se o checkbox "Aceito os termos de uso" está marcado.
  - Se estiver tudo certo, redirecionar para a tela de confirmação.
- Adicionar botão "Voltar" na tela de confirmação com `Navigator.pop()`.

---

## ✨ Bônus (opcional)

- Permitir voltar e **editar os dados** se algo estiver errado.
- Mostrar a idade também na tela de confirmação (adicione esse campo ao formulário se quiser).

---

## 🧩 Código Base

A estrutura do formulário já está pronta.  
Você deve implementar:

- A navegação com `Navigator.push`.
- A nova tela `ConfirmacaoScreen`.

---

## 📥 Instruções

- Crie o widget `ConfirmacaoScreen` embaixo do formulário.
- No método `_cadastrar()`, após validar, use:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ConfirmacaoScreen(nome: _nomeController.text),
  ),
);
```

---

## 🧠 Dica

- Use `StatelessWidget` na nova tela se os dados não forem alterados.
- Use `setState()` sempre que atualizar variáveis dentro do formulário.

---

👨‍💻 Mãos no código! Divirta-se praticando Flutter!
