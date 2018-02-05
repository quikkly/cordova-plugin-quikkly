@objc(Quikkly) 
class Quikkly : CDVPlugin {
  func openScanner(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let msg = command.arguments[0] as? String ?? ""

    if msg.characters.count > 0 {
      /* UIAlertController is iOS 8 or newer only. */
      let toastController: UIAlertController = 
        UIAlertController(
          title: "", 
          message: msg, 
          preferredStyle: .alert
        )

        self.viewController?.present(
        toastController, 
        animated: true, 
        completion: nil
      )

      let duration = Double(NSEC_PER_SEC) * 3.0
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // your code here
        toastController.dismiss(
            animated: true,
            completion: nil
        )
      }
        
      pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: msg
      )
    }

    self.commandDelegate!.send(
      pluginResult, 
      callbackId: command.callbackId
    )
  }
}
