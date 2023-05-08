public with sharing class EliminaRepeticoesNaLista {

  public static List<String> elimina(List<String> lista, String word){  
    System.debug('Indices encontrados: '+indicesEncontrados(lista, word));
    System.debug('Tamanho lista índices encontrados: '+indicesEncontrados(lista, word).size());
    for(Integer i=0;i<lista.size();i++){
        for(Integer j=1;j<indicesEncontrados(lista, word).size();j++){
            System.debug('Lista de índices onde foi encontrada a palavra '+word+': '+indicesEncontrados(lista, word));
            System.debug('Indice i: '+i+' - Valor j: '+indicesEncontrados(lista, word)[j]);
            if(i==indicesEncontrados(lista, word)[j]){
                lista.remove(i);
                System.debug('Índice cujo valor foi removido: '+i);
            }
        }
    }
    return lista;
  }

  public static List<Integer> indicesEncontrados(List<String> lista, String word){
      List<Integer> indicesEncontrados = new List<Integer>();
      for(Integer i=0;i<lista.size();i++){
          if(lista[i].equals(word)){
              indicesEncontrados.add(i);
          }
      }
      return indicesEncontrados;
  }


}