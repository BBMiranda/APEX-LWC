public class FuncionarioS {
    private Decimal salarioBruto; 
    
    public void setSalarioBruto(Decimal salarioBruto){
        this.salarioBruto = salarioBruto;
    }

    public Decimal inss(){
        if(salarioBruto <= 1800){
            return (salarioBruto*9)/100;
        }else if(salarioBruto > 1800 && salarioBruto <=2500){
            return (salarioBruto*11)/100;
        }else if(salarioBruto > 2500 && salarioBruto <=3500){
            return (salarioBruto*13)/100;
        }else{
            return (salarioBruto*14)/100;
        }
    }

    //Desconto de 6% da passagem pelo salario bruto
    public Decimal passagem(){
        return salarioBruto*0.06;
    }
    
    
    public Decimal pagamentoSalarioLiquido(){
        return salarioBruto - inss() - passagem();
    }
}