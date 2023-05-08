public virtual class Pai {
    public void mostrar(){
        System.debug('Essa é a classe pai');
    }
    //POLIMORFISMO - OVERRIDE - Sobrescrever métodos - acontece somenta na herança
    public virtual void exibir(){
        System.debug('Esse é o exibir do Pai que está pronto para override no filho');
    }
    public virtual void praticarEsporte(){
        System.debug('Eu pratico esporte! Abaixo o esporte que prático:');
    }
}