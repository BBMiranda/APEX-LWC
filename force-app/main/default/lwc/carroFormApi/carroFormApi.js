import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import calloutAPI from '@salesforce/apex/CarroAPIController.calloutAPI';
import CAR_OBJECT from '@salesforce/schema/Carro__c';
import NAME_FIELD from '@salesforce/schema/Carro__c.Name';
import CAR_FIELD from '@salesforce/schema/Carro__c.Carro__c';
import MODEL_FIELD from '@salesforce/schema/Carro__c.Modelo__c';
import TYPE_FIELD from '@salesforce/schema/Carro__c.TipoPintura__c'
import COLOR_FIELD from '@salesforce/schema/Carro__c.Cor__c';

export default class CarroAPIExample extends LightningElement {
  // Variáveis de acompanhamento (track) para reatividade
  @track selectedName = '';
  @track modelOptions = [];
  @track carOptions = [];
  @track paintingOptions = [];
  @track colorOptions = [];
  @track selectedModel = '';
  @track selectedCar = '';
  @track selectedPainting = '';
  @track selectedColor = '';
<<<<<<< HEAD
=======

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  connectedCallback() {
    // Chamada inicial à API para obter opções de modelo de carro
    calloutAPI({ endpoint: 'modelos' })
      .then(result => {
          this.modelOptions = this.getOptionsFromData(result);
      })
      .catch(error => {
          console.error(error);
      });
  }
<<<<<<< HEAD
=======

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  // Método utilitário para converter dados em opções do combobox
  getOptionsFromData(data) {
      return Object.keys(data).map(key => {
          return { label: key, value: key };
      });
  }
<<<<<<< HEAD
=======

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  // Manipulador de evento para alteração do modelo de carro selecionado
  handleModelChange(event) {
    this.selectedModel = event.target.value;
    this.selectedCar = '';
<<<<<<< HEAD
    this.selectedPainting = '';
    this.selectedColor = '';
    
    if (this.selectedModel) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/${this.selectedPainting}`;
      calloutAPI({ endpoint })
        .then(result => {
          this.carOptions = this.getOptionsFromData(result);
          console.log(result);
        })
        .catch(error => {
          console.error(error);
=======

    if (this.selectedModel) {
      const endpoint = `modelos/${this.selectedModel}`;

      // Chamada à API para obter opções de carros com base no modelo selecionado
      calloutAPI({ endpoint })
        .then(result => {
            this.carOptions = this.getOptionsFromData(result);
            console.log(result);
        })
        .catch(error => {
            console.error(error);
>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
        });
    } else {
      this.carOptions = [];
    }
<<<<<<< HEAD
  }
=======
  }

  // Manipulador de evento para alteração do nome do cliente
  handleNameChange(event) {
    this.selectedName = event.target.value;
  }

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  // Manipulador de evento para alteração do carro selecionado
  handleCarChange(event) {
    this.selectedCar = event.target.value;
    this.selectedPainting = '';
<<<<<<< HEAD
    this.selectedColor = '';
    
    if (this.selectedModel && this.selectedCar) {
      const endpoint = `modelos/${this.selectedModel}/${this.selectedCar}/cores/${this.selectedPainting}`;
      calloutAPI({ endpoint })
        .then(result => {
          this.paintingOptions = this.getOptionsFromData(result);
          console.log(result);
        })
        .catch(error => {
          console.error(error);
=======

    if (this.selectedCar) {
      const endpoint = `modelos/esportivo/${this.selectedCar}/cores`;

      // Chamada à API para obter opções de pintura com base no carro selecionado
      calloutAPI({ endpoint })
        .then(result => {
            this.paintingOptions = this.getOptionsFromData(result);
            console.log(result);
        })
        .catch(error => {
            console.error(error);
>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
        });
    } else {
      this.paintingOptions = [];
    }
<<<<<<< HEAD
  }
=======
  } 

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
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
        })
        .catch(error => {
          console.error(error);
        });
    } else {
      this.colorOptions = [];
    }
  }
<<<<<<< HEAD
=======

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  // Manipulador de evento para alteração da cor selecionada
  handleColorChange(event) {
    this.selectedColor = event.target.value;
  }
<<<<<<< HEAD
   // Manipulador de evento para alteração do nome do cliente
  handleNameChange(event) {
    this.selectedName = event.target.value;
  }
  // Manipulador de evento para envio do formulário
  handleSubmit(event) {
    if (!this.selectedName || !this.selectedModel || !this.selectedCar || !this.selectedPainting || !this.selectedColor) {
=======

  // Manipulador de evento para envio do formulário
  handleSubmit(event) {
    if (!this.selectedName || !this.selectedModel || !this.selectedCar || !this.selectedPainting /* || !this.selectedColor */) {
>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
      // Exibe uma mensagem de erro se alguma opção não estiver selecionada
      const event = new ShowToastEvent({
        title: 'Erro',
        message: 'Por favor, preencha todas as opções antes de salvar.',
        variant: 'error',
      });
      this.dispatchEvent(event);
      return;
    }  
<<<<<<< HEAD
=======

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
    const fields = {};
    fields[NAME_FIELD.fieldApiName] = this.selectedName;
    fields[MODEL_FIELD.fieldApiName] = this.selectedModel;
    fields[CAR_FIELD.fieldApiName] = this.selectedCar;
    fields[TYPE_FIELD.fieldApiName] = this.selectedPainting;
    fields[COLOR_FIELD.fieldApiName] = this.selectedColor;
<<<<<<< HEAD
    const recordInput = { apiName: CAR_OBJECT.objectApiName, fields };
=======

    const recordInput = { apiName: CAR_OBJECT.objectApiName, fields };

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
    // Criação de registro usando o serviço createRecord do Lightning Data Service
    createRecord(recordInput)
      .then(result => {
          console.log('Registro salvo com sucesso!');
          this.carName = '';
      })
      .catch(error => {
          console.error(error);
      });
<<<<<<< HEAD
    this.showToast();
  }
=======

    this.showToast();
  }

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  // Exibição de toast de sucesso
  showToast(){
    const event = new ShowToastEvent({
      title: 'Sucesso',
      message: 'O registro foi salvo com sucesso!',
      variant: 'success',
    });
<<<<<<< HEAD
    this.dispatchEvent(event);
  }
=======

    this.dispatchEvent(event);
  }

>>>>>>> 35457bdfe6d3af0e6bbdb14844074cf66018028c
  // Manipulador de evento para limpar o formulário
  handleClear(event) {        
    this.selectedName = '';
    this.selectedModel = '';
    this.selectedCar = '';
    this.selectedPainting = '';
    this.selectedColor = '';
  }
}
