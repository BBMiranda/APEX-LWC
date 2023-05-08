public class Desenvolvedor extends Funcionario {
	private Decimal bonus;
    public void setBonus(Decimal bonus){
        this.bonus = bonus;
    }
    public override Decimal pagamentoSalarioLiquido(Decimal salarioBruto){
        return super.pagamentoSalarioLiquido(salarioBruto)+this.bonus;
    }
}