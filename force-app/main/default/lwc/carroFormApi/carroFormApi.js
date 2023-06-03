import { LightningElement, track } from 'lwc';
import calloutAPI from '@salesforce/apex/CarroAPIController.calloutAPI';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import CAR_OBJECT from '@salesforce/schema/Carro__c';
import NAME_FIELD from '@salesforce/schema/Carro__c.Name';
import CAR_FIELD from '@salesforce/schema/Carro__c.Carro__c';
import MODEL_FIELD from '@salesforce/schema/Carro__c.Modelo__c';
import TYPE_FIELD from '@salesforce/schema/Carro__c.TipoPintura__c'
import COLOR_FIELD from '@salesforce/schema/Carro__c.Cor__c';

export default class CarroAPIExample extends LightningElement {
    
  // Variáveis rastreadas para armazenar o estado dos campos e opções selecionados
  @track selectedName = '';
  @track modelOptions = [];
  @track carOptions = [];
  @track paintingOptions = [];
  @track colorOptions = [];
  
  @track selectedModel = '';
  @track selectedCar = '';
  @track selectedPainting = '';
  @track selectedColor = '';
    
  connectedCallback() {
    // Chamada à função do Apex para obter os dados da API
    calloutAPI({ endpoint: 'modelos' })
      .then(result => {
          this.modelOptions = this.getOptionsFromData(result);
      })
      .catch(error => {
          console.error(error);
      });
  }

  // Função para obter opções de seleção a partir dos dados recebidos
  getOptionsFromData(data) {
      return Object.keys(data).map(key => {
          return { label: key, value: key };
      });
  }

  // Manipulador de evento para alteração do modelo selecionado
  handleModelChange(event) {
    this.selectedModel = event.target.value;
    this.selectedCar = '';

    if (this.selectedModel) {
      const endpoint = `modelos/${this.selectedModel}`;
      calloutAPI({ endpoint })
        .then(result => {
            this.carOptions = this.getOptionsFromData(result);
            console.log(result);
        })
        .catch(error => {
            console.error(error);
        });
    } else {
      this.carOptions = [];
    }
  }

  // Manipulador de evento para alteração do nome do cliente
  handleNameChange(event) {
    this.selectedName = event.target.value;
  }

  // Manipulador de evento para alteração do carro selecionado
  handleCarChange(event) {
    this.selectedCar = event.target.value;
    this.selectedPainting = '';

    if (this.selectedCar) {
      const endpoint = `modelos/esportivo/${this.selectedCar}/cores`;
      calloutAPI({ endpoint })
        .then(result => {
            this.paintingOptions = this.getOptionsFromData(result);
            console.log('Testando o Resultado: ' , result);
        })
        .catch(error => {
            console.error(error);
        });
    } else {
      this.paintingOptions = [];
    }
  } 

  // Manipulador de evento para alteração do tipo de pintura selecionado
  handlePaintingChange(event) {
    this.selectedPainting = event.target.value;
  }

  // Manipulador de evento para alteração da cor selecionada
  handleColorChange(event) {
    this.selectedColor = event.target.value;
  }

  // Manipulador de evento para o botão Salvar do formulário
  handleSubmit(event) {
    const fields = {};
    fields[NAME_FIELD.fieldApiName] = this.selectedName;
    fields[MODEL_FIELD.fieldApiName] = this.selectedModel;
    fields[CAR_FIELD.fieldApiName] = this.selectedCar;
    fields[TYPE_FIELD.fieldApiName] = this.selectedPainting;
    fields[COLOR_FIELD.fieldApiName] = this.selectedColor;

    const recordInput = { apiName: CAR_OBJECT.objectApiName, fields };
    createRecord(recordInput)
        .then(result => {
            // Lógica de tratamento após salvar com sucesso
            console.log('Registro salvo com sucesso!');
            this.carName = '';
        })
        .catch(error => {
            // Lógica de tratamento de erro
            console.error(error);
        })
    this.showToast();
  }

  // Manipulador de evento para exibir o toast
  showToast(){
    const event = new ShowToastEvent({
      title: 'Formulário Carro',
      message: 'Salvo com Sucesso',
      variant: 'success',
    })
    this.dispatchEvent(event);
  }

  // Manipulador de evento para o botão Limpar formulário
  handleClear(event) {        
    this.selectedName = '';
    this.selectedModel = '';
    this.selectedCar = '';
    this.selectedPainting = '';
    this.selectedColor = '';
  }
}
