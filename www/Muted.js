var exec = require('cordova/exec');

/**
 *
 */
var Muted =  {

  /**
   *
   */
  isMuted: function(handler) {
    success_handler = null;
    failure_handler = null;

    if (handler != null && typeof handler.onSuccess == "function") {
        success_handler = handler.onSuccess;
    }

    if (handler != null && typeof handler.onFailure == "function") {
        failure_handler = handler.onFailure;
    }

    exec(success_handler, failure_handler, "Muted", "isMuted", []);
  }

};

module.export = Muted;
