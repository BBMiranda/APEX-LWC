public class Filha extends Pai{
    public void exibe(){
        System.debug('Essa é a classe filho');
    }
    public override void exibir(){
        System.debug('Esse exibir é do filho, que está sobreescrevendo o exibir do pai por OVERRIDE');
    }
    public override void praticarEsporte(){
        super.praticarEsporte();
        System.debug('Ginástica!');
    }
}