public with sharing class Modificadores {
  // Compartilhamento de direitos
  //with sharing
  //inherited sharing
  //without sharing (Default)

  //Modificadores de visibilidade dos atributos ou métodos
  //protected
  //public
  //global
  //private (Default)
    public Integer idade = 15;   

    public void mostrar(Integer idade){
      this.idade = idade;
      System.debug('idade: ' + this.idade);
    }
}