// Can also be included with a regular script tag
import Typed from 'typed.js';

const type = () => {
  const header = document.querySelector('.header')
  if (header) {
    var options = {
      strings: ['Mon app de cocktails !!'],
      typeSpeed: 40
    };
    var typed = new Typed('.header', options);
  }
  
}



export { type }; 