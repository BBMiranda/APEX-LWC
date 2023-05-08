public with sharing class Basal {
  public static Decimal var = 0;
 //Dentro do vetor de double, temos o fator de atividade
  public static Double [] a = new Double[]{1.2,1.375,1.55,1.725,1.9};
  //esse método tem a função de retornar o valor calculado da caloria basal do homem
  private static Decimal calculoBasalHomem(Integer condicao, Decimal peso, Decimal altura, Integer idade) {
      return a[condicao] * (var + (13.7 * peso) + (5 * altura*100) - (6.8 * idade));
  }
 //esse método tem a função de retornar o valor calculado da caloria basal da mulher
  private static Decimal calculoBasalMulher(Integer condicao, Decimal peso, Decimal altura, Integer idade) {
      return a[condicao] * (655 + (9.6 * peso) + (1.8 * altura*100) - (4.7 * idade));
  }

  @AuraEnabled(cacheable=true)
  public static Decimal calculaCaloriaBasal(String condicao, String nome, String genero, Decimal peso, Decimal altura, Integer idade){
    Decimal basal;
    Integer cond = Integer.valueOf(condicao);
    switch on genero{
        when 'h'{
            basal = calculoBasalHomem(cond, peso, altura, idade);
        }
        when 'm'{
            basal = calculoBasalMulher(cond, peso, altura, idade);
        }
    }
    return basal.setScale(0);
  }  

  @AuraEnabled
  public static List<Basal__c> criarRegistro(String condicao, String nome, String genero, Decimal peso, Decimal altura, Integer idade, Decimal calorias){
    
    List<Basal__c> basalList = new List<Basal__c>();

    if ( nome != NULL) {
      Basal__c Obj = new Basal__c();
      Obj.Condicao__c = condicao;
      Obj.Name = nome;
      Obj.Genero__c = genero;
      Obj.Peso__c = peso;
      Obj.Altura__c = altura;
      Obj.Idade__c = idade;
      Obj.Calorias__c = calorias;
      basalList.add(Obj);
    }

    if(!basalList.isEmpty()){
      System.debug('basalList:' + basalList);
      insert basalList;
      return basalList;
    }
    return NULL;
  }
}