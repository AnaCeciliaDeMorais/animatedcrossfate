<h1 align="center">🖼️ Comparador Antes/Depois com AnimatedCrossFade</h1>
<img alt="Status" src="https://img.shields.io/badge/Status-Concluido-blue">

Este projeto demonstra a criação de um **comparador de imagens "antes e depois"** usando Flutter e o widget `AnimatedCrossFade`. A ideia é alternar suavemente entre duas imagens de um produto com animação, permitindo ao usuário visualizar a diferença de forma agradável.

---

## 🚀 Funcionalidades

- Alterna entre duas imagens (antes e depois).
- Animação suave com `AnimatedCrossFade`.
- Botão para alternar entre os estados.
- Imagens declaradas corretamente no `pubspec.yaml`.

---

## 🛠️ Tecnologias Utilizadas

- Flutter
- Dart
- `AnimatedCrossFade`
- `StatefulWidget`

---

## Diferença entre `AnimatedCrossFade` e `AnimatedSwitcher`

No Flutter, tanto `AnimatedCrossFade` quanto `AnimatedSwitcher` são usados para criar animações de transição entre widgets, mas eles têm propósitos e comportamentos diferentes:

### 🌀 Quando usar `AnimatedCrossFade`
- Use `AnimatedCrossFade` **quando você quiser alternar suavemente entre dois widgets específicos**.
- Ele **pré-carrega** os dois widgets e faz uma **animação de fade (transparência)** entre eles.
- Ideal quando **você já conhece os dois estados** que precisam ser animados.
- Exemplo de uso: alternar entre uma imagem expandida e uma imagem recolhida.

```dart
AnimatedCrossFade(
  firstChild: Text('Mostrar menos'),
  secondChild: Text('Mostrar mais'),
  crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
  duration: Duration(milliseconds: 300),
)
```

---

### 🧩 Quando usar `AnimatedSwitcher`

- Use `AnimatedSwitcher` quando o widget inteiro pode mudar dinamicamente e você quer uma transição animada entre qualquer conteúdo.
- O `AnimatedSwitcher` **detecta quando o `child` muda** e faz a animação de entrada/saída automaticamente.
- Ideal quando o **número ou o tipo de widgets pode variar** durante o tempo de execução.

**Exemplo de uso:** mudar o número de um contador animado ou trocar entre vários widgets de forma dinâmica.

```dart
AnimatedSwitcher(
  duration: Duration(milliseconds: 300),
  child: Text(
    '$_counter',
    key: ValueKey<int>(_counter),
    style: TextStyle(fontSize: 48),
  ),
)
```

---

### 📌 Resumo Rápido

| Situação | Use |
|:---|:---|
| Alternar entre dois widgets fixos | `AnimatedCrossFade` |
| Trocar dinamicamente qualquer widget | `AnimatedSwitcher` |
