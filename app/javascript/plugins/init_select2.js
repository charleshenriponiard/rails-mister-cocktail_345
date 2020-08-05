// ./src/plugins/init_select2.js

import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({ width: '100%', 
                          theme: "bootstrap4"
                        });
};

export { initSelect2 };