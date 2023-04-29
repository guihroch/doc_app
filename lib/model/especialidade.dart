class Especialidade {
  final String? nome;
  final String? image;
  Especialidade({
    this.nome,
    this.image,
  });

  static List<Especialidade> listaEspecialidades = [
    Especialidade(nome: "Pediatria", image: "images/area1.png"),
    Especialidade(nome: "Cardiologia", image: "images/area2.png"),
    Especialidade(nome: "Psiquiatria", image: "images/area3.png"),
    Especialidade(nome: "Nefrologia", image: "images/area4.png"),
    Especialidade(nome: "Ortopedia", image: "images/area5.png"),
  ];
}
