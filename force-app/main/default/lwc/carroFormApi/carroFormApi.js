import { LightningElement, track } from 'lwc';
import calloutAPI from '@salesforce/apex/CarroAPIController.calloutAPI';
import myPNG_icon from '@salesforce/resourceUrl/lampPNG';

export default class CarroAPIExample extends LightningElement {
    
    lampPng = myPNG_icon;
    @track modelOptions = [];
    @track colorOptions = [];
    @track selectedModel = '';
    @track selectedColor = '';

    connectedCallback() {
        // Chamada à função do Apex para obter os dados da API
        calloutAPI({ endpoint: 'modelos/esportivo' })
            .then(result => {
                this.modelOptions = this.getOptionsFromData(result);
            })
            .catch(error => {
                console.error(error);
            });
    }

    getOptionsFromData(data) {
        return Object.keys(data).map(key => {
            return { label: key, value: key };
        });
    }

    handleModelChange(event) {
        this.selectedModel = event.target.value;
        this.selectedColor = '';
        if (this.selectedModel) {
            const endpoint = `modelos/esportivo/${this.selectedModel}`;
            calloutAPI({ endpoint })
                .then(result => {
                    this.colorOptions = this.getOptionsFromData(result);
                })
                .catch(error => {
                    console.error(error);
                });
        } else {
            this.colorOptions = [];
        }
    }

    handleColorChange(event) {
        this.selectedColor = event.target.value;
    }
}