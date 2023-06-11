import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import calloutAPI from '@salesforce/apex/CarroAPIController.calloutAPI';
import CAR_OBJECT from '@salesforce/schema/Carro__c';
import NAME_FIELD from '@salesforce/schema/Carro__c.Name';
import CAR_FIELD from '@salesforce/schema/Carro__c.Carro__c';
import MODEL_FIELD from '@salesforce/schema/Carro__c.Modelo__c';
import TYPE_FIELD from '@salesforce/schema/Carro__c.TipoPintura__c'
import COLOR_FIELD from '@salesforce/schema/Carro__c.Cor__c';

export default class carroFormApi extends NavigationMixin(LightningElement) {
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
    calloutAPI({ endpoint: 'modelos' })
      .then(result => {
          this.modelOptions = this.getOptionsFromData(result);
      })
      .catch(error => {
          console.error(error);
      });
  }
<<<<<<< HEAD
  // Método utilitário para converter dados em opções do combobox
=======
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
  getOptionsFromData(data) {
      return Object.keys(data).map(key => {
          return { label: key, value: key };
      });
  }
<<<<<<< HEAD
  // Manipulador de evento para alteração do modelo de carro selecionado
  handleModelChange(event) {
    this.selectedModel = event.target.value;
    this.selectedCar = '';
    this.selectedPainting = '';
    this.selectedColor = '';
    
    if (this.selectedModel) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/${this.selectedPainting}`;
=======
  getOptionsFromDataList(data) {
    const labelMapping = {
      solidas: 'Sólidas',
      metalicas: 'Metálicas'
    };
  
    return Object.entries(data).map(([key, value]) => ({
      label: labelMapping[key] || value,
      value: key
    }));
  }
  handleModelChange(event) {
    this.selectedModel = event.target.value;
    
    if (this.selectedModel) {
      const endpoint = `modelos/${this.selectedModel}`;
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
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
<<<<<<< HEAD
  // Manipulador de evento para alteração do carro selecionado
  handleCarChange(event) {
    this.selectedCar = event.target.value;
    this.selectedPainting = '';
    this.selectedColor = '';
    
    if (this.selectedModel && this.selectedCar) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/cores/${this.selectedPainting}`;
      calloutAPI({ endpoint })
        .then(result => {
          this.paintingOptions = this.getOptionsFromData(result);
=======
  handleCarChange(event) {
    this.selectedCar = event.target.value;
    
    if (this.selectedModel && this.selectedCar) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/cores`;
      calloutAPI({ endpoint })
        .then(result => {
          this.paintingOptions = this.getOptionsFromDataList(result);
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
          console.log(result);
        })
        .catch(error => {
          console.error(error);
        });
    } else {
      this.paintingOptions = [];
    }
  }
<<<<<<< HEAD
  // Manipulador de evento para alteração do tipo de pintura selecionado
  handlePaintingChange(event) {
    this.selectedPainting = event.target.value;
    this.selectedColor = '';
    
    if (this.selectedModel && this.selectedCar && this.selectedPainting) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/cores/${this.selectedPainting}`;
      calloutAPI({ endpoint })
        .then(result => {
          this.colorOptions = this.getOptionsFromData(result);
          console.log(result);
=======
  handlePaintingChange(event) {
    this.selectedPainting = event.target.value;
  
    if (this.selectedModel && this.selectedCar && this.selectedPainting) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/cores`;
      calloutAPI({ endpoint })
        .then(result => {
          if (typeof result === 'object' && result[this.selectedPainting]) {
            this.colorOptions = result[this.selectedPainting].map(color => ({
            label: color,
            value: color
            }));
          } else {
            this.colorOptions = [];
          }
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
        })
        .catch(error => {
          console.error(error);
        });
    } else {
      this.colorOptions = [];
    }
  }
<<<<<<< HEAD
  // Manipulador de evento para alteração da cor selecionada
  handleColorChange(event) {
    this.selectedColor = event.target.value;
  }
   // Manipulador de evento para alteração do nome do cliente
  handleNameChange(event) {
    this.selectedName = event.target.value;
  }
  // Manipulador de evento para envio do formulário
  handleSubmit(event) {
    if (!this.selectedName || !this.selectedModel || !this.selectedCar || !this.selectedPainting || !this.selectedColor) {
      // Exibe uma mensagem de erro se alguma opção não estiver selecionada
=======
  handleColorChange(event) {
    this.selectedColor = event.target.value;
  }
  handleNameChange(event) {
    this.selectedName = event.target.value;
  }
  handleSubmit() {
    if (!this.selectedName || !this.selectedModel || !this.selectedCar || !this.selectedPainting || !this.selectedColor) {
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
      const event = new ShowToastEvent({
        title: 'Erro',
        message: 'Por favor, preencha todas as opções antes de salvar.',
        variant: 'error',
      });
      this.dispatchEvent(event);
      return;
    }  
    const fields = {};
    fields[NAME_FIELD.fieldApiName] = this.selectedName;
    fields[MODEL_FIELD.fieldApiName] = this.selectedModel;
    fields[CAR_FIELD.fieldApiName] = this.selectedCar;
    fields[TYPE_FIELD.fieldApiName] = this.selectedPainting;
    fields[COLOR_FIELD.fieldApiName] = this.selectedColor;
    const recordInput = { apiName: CAR_OBJECT.objectApiName, fields };
<<<<<<< HEAD
    // Criação de registro usando o serviço createRecord do Lightning Data Service
=======
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
    createRecord(recordInput)
      .then(result => {
          console.log(result);
      })
      .catch(error => {
          console.error(error);
      });
    this.showToast();
  }
<<<<<<< HEAD
  // Exibição de toast de sucesso
=======
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
  showToast(){
    const event = new ShowToastEvent({
      title: 'Sucesso',
      message: 'O registro foi salvo com sucesso!',
      variant: 'success',
    });
    this.dispatchEvent(event);
  }
<<<<<<< HEAD
  // Manipulador de evento para limpar o formulário
  handleClear(event) {        
=======
  handleClear() {        
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
    this.selectedName = '';
    this.selectedModel = '';
    this.selectedCar = '';
    this.selectedPainting = '';
    this.selectedColor = '';
  }
<<<<<<< HEAD
=======
  navegarCarros(){
    this[NavigationMixin.Navigate]({
        type: 'standard__objectPage',
        attributes:{
            objectApiName: 'Carro__c',
            actionName: 'home'
        }
    });
  }
>>>>>>> f845c1e1a04d2c176366ded9bd4e553418129617
}