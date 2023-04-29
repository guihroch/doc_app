class Medico {
  String? pacientes;
  String? experiencia;
  String? nome;
  String? especialidade;
  String? image;
  String? plano;
  Medico({
    this.pacientes,
    this.experiencia,
    this.plano,
    this.image,
    this.nome,
    this.especialidade,
  });

  static List<Medico> listaMedicos = [
    Medico(
        nome: "Dr.Pedro Ramos",
        especialidade: "Cardiologista",
        image: "images/medico1.png",
        plano: "UNIMED"),
    Medico(
        nome: "Dr.Gabriel Silva",
        especialidade: "Neurologista",
        image: "images/medico2.png",
        plano: "SAMP"),
    Medico(
        nome: "Dr.Sandro Martins",
        especialidade: "Nefrologista",
        image: "images/medico3.webp",
        plano: "UNIMED"),
    Medico(
        nome: "Dra.Viviane Costa",
        especialidade: "Pediatra",
        image: "images/medica5.webp",
        plano: "SAMP"),
  ];

  static List<Medico> medicosDisponiveis = [
    Medico(
      nome: "Dra.Ana Julia",
      especialidade: "Clinico Geral",
      image: "images/disponivel1.png",
      experiencia: "5 anos",
      pacientes: "734",
    ),
    Medico(
        nome: "Dra.Gabriella Araujo",
        especialidade: "Clinico Geral",
        image: "images/disponivel2.png",
        experiencia: "8 anos",
        pacientes: "1056"),
    Medico(
        nome: "Dra.Juan Magno",
        especialidade: "Pneumologista",
        image: "images/disponivel3.png",
        experiencia: "14 anos",
        pacientes: "743"),
    Medico(
        nome: "Dra.Angelo Dias",
        especialidade: "Nefrologista",
        image: "images/disponivel4.png",
        experiencia: "10 anos",
        pacientes: "800"),
  ];
}
