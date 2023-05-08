public class Vendedor extends Funcionario {
	private Decimal comissao;
    private Decimal totalDeVendas;
    public void setComissao(Decimal percentualComissao){
        this.comissao = (percentualComissao/100)*this.totalDeVendas;
    }
    public void setTotalDeVendas(Decimal vendas){
        this.totalDeVendas = vendas;
    }    
    public override Decimal pagamentoSalarioLiquido(Decimal salarioBruto){
        return super.pagamentoSalarioLiquido(salarioBruto)+this.comissao;
    }
}