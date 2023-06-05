public with sharing class ClasseExternalJr2 {
    public void exibirNumeroInternoDaClasseInterna(ClasseInterna objInnerClass){
      Integer numeroInterno = objInnerClass.getNumeroInterno();
      System.debug('Numero interno da classe interna: ' + numeroInterno);
    }

    public class classeInterna{
      private Integer numeroInterno;
      public classeInterna(Integer num){
        this.numeroInterno = num;
      }
      public Integer getNumeroInterno(){
        return this.numeroInterno;
      }
    }
}