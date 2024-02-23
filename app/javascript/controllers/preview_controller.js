import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
  static targets = ["name", "description", "price", "photo", "inputPhoto"];

  connect() {
    console.log("connected");
    this.updateHtml();
    this.displayHtml();
    this.addEventListeners();
    console.log(this.rawHtml);
  }

  addEventListeners() {
    const variables = this.getVariables();
    variables.forEach((variable) => {
      const input = document.querySelector(`[data-preview-target="${variable}"]`);
      if (input) {
        input.addEventListener('keyup', () => {
          this.updateHtml();
          this.displayHtml();
        });
      }
    });
  }

    get rawHtml() {
      let element = document.querySelector('[data-controller="preview"]');
      let rawHtml = element.getAttribute('data-preview-raw-html');
      console.log(rawHtml);
      return rawHtml; // return the raw HTML string from the attribute
    }

  getVariables() {
    let html = this.rawHtml;
    let variables = [];
    if (html) {
      variables = (html.match(/{{{(\w+)}}}/g) || []).map(match => match.slice(3, -3));
    }
    return variables;
  }

  displayHtml() {
    const rawHtml = this.data.get('previewRawHtml');
    const previewElement = document.querySelector('[data-preview="preview"]');
    if (previewElement) {
      previewElement.innerHTML = rawHtml;
    }
  }

  updateHtml() {
    let html = this.rawHtml;
    let variables = this.getVariables();
    if (variables) {
      variables.forEach((variable) => {
        const input = document.querySelector(`[data-preview-target="${variable}"]`);
        if (input) {
          html = html.replace(new RegExp(`{{{${variable}}}}`, 'g'), input.value);
        }
      });
    }

    this.data.set('previewRawHtml', html);
    this.displayPhoto();
  }

  displayPhoto() {
    const input = this.inputPhotoTarget;
    console.log(input);
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.readAsDataURL(input.files[0])
      reader.onload = (e) => {
        console.log(this.photoTarget);
        this.photoTarget.src = e.target.result;
      };
    }
  }
}
