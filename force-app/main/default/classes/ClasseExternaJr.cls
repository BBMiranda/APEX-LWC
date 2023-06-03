public with sharing class ClasseExternaJr {
  private integer numeroExterno;
  public ClasseExternaJr(Integer num){
    this.numeroExterno = num;
  }
  public void exibirNumeroExterno(){
    System.debug('Numero externo: ' + this.numeroExterno);
  }
  public class classeInterna{
    private ClasseExternaJr externa;
    public classeInterna(ClasseExternaJr externa){
    this.externa = externa;
    }
    public void exibirNumeroAdvindoClasseExterna(){
      System.debug('Exibição do atributo da Outer Class pela Inner Class: ' + this.externa.numeroExterno);
    }
  }
}