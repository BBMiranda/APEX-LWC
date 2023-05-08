public with sharing class Exibe {
	
    public void exibirMensagem(){
        System.debug('Olá Mundo');
    }
    public void exibirMensagem(String word){
        System.debug('Palavra: ' + word + ' -  assinatura diferente por passagem de argumento!');
    }
    public void exibirMensagem(String word, String frase){
        System.debug('Palavra: ' + word + ' -  assinatura diferente por passagem de argumento!' + frase + 'assinatura diferente por passagem de argumento!' );
    }
}