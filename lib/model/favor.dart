class favor {
  final String tipo;
  final String estado;
  final String who;
  final String towho;

  const favor({
    this.estado,
    this.tipo,
    this.who,
    this.towho
  });

}
final favorsList = [
  new favor(tipo: "Transacción", estado: "a realizar", who: "luis", towho: "Martin"),
];

llenarfavs(){
  favorsList.clear();
  for (var i=1;i<5;i++){
    favorsList.add(new favor(tipo: "Transacción", estado: "realizada", who: "luis", towho: "Martin"));
  }
}


