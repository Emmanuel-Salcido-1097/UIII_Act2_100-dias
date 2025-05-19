// animatedlist_model.dart

class User {
  final String name;
  final String username;
  final String image;

  User({
    required this.name,
    required this.username,
    required this.image,
  });
}

List<User> users = [
  User(
    name: 'Banco de México',
    username: '@México',
    image: "https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/bancomexico.jpg",
  ),
  User(
    name: 'Banco de España',
    username: '@España',
    image: "https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/bancoespa%C3%B1a.jpg",
  ),
  User(
    name: 'Banco de Roma',
    username: '@Roma',
    image: "https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/bancoroma.jpg",
  ),
  User(
    name: 'Banco de Perú',
    username: '@Perú',
    image: "https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/bancoperu.jpg",
  ),
  User(
    name: 'Banco de Londres',
    username: '@Londres',
    image: "https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/bancolondres.jpg",
  ),
  User(
    name: 'Banco de Estados Unidos',
    username: '@EstadosUnidos',
    image: "https://raw.githubusercontent.com/Emmanuel-Salcido-1097/P8MisImagenes6I/refs/heads/main/bancoestadosunidos.jpg",
  )
];
