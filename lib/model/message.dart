class message {
  final String usuario;
  final String contenido;

  const message({
    this.usuario,
    this.contenido
  });
}
final messages = [];
obtener(){
  for (var i=1;i<5;i++){
    messages.add(new message(usuario: "yo", contenido: "hola"));
  }
}