//
//  QuikklyPluginController.swift
//
//  Created by Rob Byrne on 09/02/2018.
//
//  View controller to service delegate method from Quikkly
//  ScanViewController. The codes are packaged as an array
//  and sent back to QuikklyPlugin via a delegate
import UIKit
import Quikkly

class QuikklyPluginController: ScanViewController {
    
    weak var plugin: QuikklyPluginDelegate?
    
    override init() {
        super.init();
        
        self.title = "Scan"
    }
    
    convenience init(plugin: QuikklyPluginDelegate) {
        self.init();
        self.plugin = plugin
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scanView(_ scanView: ScanView, didDetectScannables scannables: [Scannable]) {
        var codes: [UInt64] = []
        // extract the code values
        for scannable in scannables {
            codes.append(scannable.value)
        }
        self.plugin?.sendCodes(codes: codes)
        self.dismiss(animated: true)
    }
}
