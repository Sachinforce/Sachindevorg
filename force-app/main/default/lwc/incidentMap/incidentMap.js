import {
  LightningElement,
  wire,
  api,
  track
} from 'lwc';
import {
  getRecord
} from 'lightning/uiRecordApi';

const FIELDS = [
  // 'Case.Incident_Location__c',
  'Case.Incident_Location__Latitude__s',
  'Case.Incident_Location__Longitude__s'
];

export default class LightningExampleMapSingleMarker extends LightningElement {
  @api recordId;
  @track mapMarkers;
  @track error;
  @wire(getRecord, {
    recordId: '$recordId',
    fields  : FIELDS
  }) wiredMarker({
    error,
    data
  }) {
    if (data) {
      debugger;
      this.mapMarkers = [{
          location: {
            'Latitude' : data["fields"]["Incident_Location__Latitude__s"]["value"],
            'Longitude': data["fields"]["Incident_Location__Longitude__s"]["value"]
          }
        }

      ];
      this.error = undefined;
    } else if (error) {
      this.error      = error;
      this.mapMarkers = undefined;
    }
  }

}