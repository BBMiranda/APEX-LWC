public with sharing class TempConverterWithConstructor {
	
    private Decimal celsius;
    public TempConverterWithConstructor(){
        System.debug('Olá mundo');
    }
    
    public TempConverterWithConstructor(String msg){
        System.debug(msg);
    }
}