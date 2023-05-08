import { LightningElement } from 'lwc';

export default class Calculadora extends LightningElement {
  priNumero = '';
  segNumero = '';
  total = '';
  operacao = '';
  igual = '';
  mostraResultado = false;
  mensagem = '';

  //o método abaixo, atribui o valor do primeiro número inserido no campo de input, à variável priNumero
  priNumeroChange(event){
    this.priNumero = event.target.value;
  }
  //o método abaixo, atribui o valor do segundo número inserido no campo de input, à variável priNumero
  segNumeroChange(event){
    this.segNumero = event.target.value;
  }

  somar(event){
    this.operacao = '+';
    this.total = '';
    this.mensagem = 'está sendo somado com';
  }

  subtrair(event){
    this.operacao = '-';
    this.total = '';
    this.mensagem = 'está sendo subtraído de';
  }

  multiplicar(event){
    this.operacao = 'x';
    this.total = '';
    this.mensagem = 'está sendo multiplicado por';
  }

  dividir(event){
    this.operacao = '/';
    this.total = '';
    this.mensagem = 'está sendo dividido por';
  }

  limpar(event){
    this.priNumero = '';
    this.segNumero = '';
    this.total = '';
    this.operacao = '';
    this.igual = '';
    this.mostraResultado = false;
    this.mensagem = '';
  }

  mostrarResultado(){
    if(this.priNumero != '' && this.segNumero != '' && this.operacao != ''){
      this.mostraResultado = true;
    }
  }

  resolver(event){
    this.igual = '=';
    this.mensagem = '';
    switch (this.operacao){
      case '+':
        this.total = Number(this.priNumero) + Number(this.segNumero);
        break;
      case '-':
        this.total = Number(this.priNumero) - Number(this.segNumero);
        break;
      case 'x':
        this.total = Number(this.priNumero) * Number(this.segNumero);
        break;
      case '/':
        this.total = this.segNumero==0?'O denominador não pode ser zero':(Number(this.priNumero)/Number(this.segNumero)).toFixed(2);
        // this.total = this.segNumero==0?alert('O denominador não pode ser zero'):(Number(this.priNumero)/Number(this.segNumero)).toFixed(2);
        break;
      
    }
    this.mostrarResultado();
  }
}