import { LightningElement, wire } from 'lwc';
import calculaCalBasal from '@salesforce/apex/Basal.calculaCaloriaBasal';
import criarRegistro from '@salesforce/apex/Basal.criarRegistro';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';


export default class CalculaBasal extends NavigationMixin(LightningElement){
  
  accountIds;
  indice;
  fatores = [
              {label: 'Sedentário', value: '0'},
              {label: 'Levemente ativo', value: '1'},
              {label: 'Moderadamente ativo', value: '2'},
              {label: 'Altamente ativo', value: '3'},
              {label: 'Atleta', value: '4'}
            ]

  selecionaFator(event){
    this.indice = event.detail.value;
    console.log(this.indice);
  }

  genero;
  generos = [
              {label: 'Masculino', value: 'h'},
              {label: 'Feminino', value: 'm'},
            ]
  selecionaGenero(event){
    this.genero = event.detail.value;
    console.log(this.genero);
  }

  nome;
  peso;
  altura;
  idade;

  atribuiNome(event){
    this.nome = event.target.value;
    console.log(this.nome);
  }

  atribuiPeso(event){
    this.peso = event.target.value;
    console.log(this.peso);
  }
  atribuiAltura(event){
    this.altura = event.target.value;
    console.log(this.altura);
  }
  atribuiIdade(event){
    this.idade = event.target.value;
    console.log(this.idade);
  }

  /* @wire(calculaCalBasal, {condicao: '$indice', genero: '$genero', peso: '$peso', altura:'$altura', idade:'$idade'})
  resultadoCalculo; */

  /* calcular(event){
    this.resultadoCalculo.data = event.target.value;
    //alert('Calculo Basal: ' + this.resultadoCalculo.data);
  } */

  resultadoCalculo;
  errorDetails;

  calcular(event){
    calculaCalBasal({condicao: this.indice, nome: this.nome, genero: this.genero, peso: this.peso, altura: this.altura, idade: this.idade})
    .then(result => {
      this.resultadoCalculo = result;
    })
    .catch(error =>{
      this.errorDetails = error;
    })
  }

  calorias = ('O valor basal diário é de: ');

  salvarRegistro(){
    
    criarRegistro({condicao: this.indice, nome: this.nome, genero: this.genero, peso: this.peso, altura: this.altura, idade: this.idade, calorias: this.resultadoCalculo})
    .then(result => {
      //console.log("resultado: " + JSON.stringify(result));
    })
    .catch(error =>{
      //console.error("erro: " + JSON.stringify(error));
    })
    this.showToast();
  }
  // Evento Toast
  showToast(){
    const event = new ShowToastEvent({
      title: 'Cálculo Basal',
      message: 'Salvo com Sucesso',
      variant: 'success',
    })
    this.dispatchEvent(event);
  }
  // Navegar 
  navegarHomeBasal(){
    this[NavigationMixin.Navigate]({
        type: 'standard__objectPage',
        attributes:{
            objectApiName: 'Basal__c',
            actionName: 'home'
        }
    })
  }
}