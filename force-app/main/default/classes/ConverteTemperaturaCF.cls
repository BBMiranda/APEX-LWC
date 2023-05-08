public with sharing class ConverteTemperaturaCF {
	
    public Decimal tempKelvin;
    public static Decimal tempCelsius;
    
    public static Decimal converteTemp(){
        return tempCelsius * 1.8 + 32;
    }
    
    public Decimal ConverteTempKC(){
        return this.tempKelvin-273.15;
    }
    
    public static Decimal ConverteCToF(Decimal c){
        return c*1.8 +32;
    }
}