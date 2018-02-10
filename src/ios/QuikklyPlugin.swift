//
//  QuikklyPlugin.swift
//
//  Created by Rob Byrne on 09/02/2018.
//
//  Plugin entry point

import Quikkly

@objc(QuikklyPlugin) class QuikklyPlugin : CDVPlugin, QuikklyPluginDelegate {
  
    var command: CDVInvokedUrlCommand?
    
    override init() {
        self.command = nil
    }
    
    @objc(openScanner:)
    func openScanner(command: CDVInvokedUrlCommand) {
        self.command = command;
       
        Quikkly.apiKey = command.argument(at: 0) as? String
        self.viewController?.present(QuikklyPluginController(plugin: self), animated: true)
    }
    
    func sendCodes(codes: [UInt64]) {
        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: codes
        )

        self.commandDelegate!.send(
            pluginResult,
            callbackId: self.command?.callbackId
        )
    }
}

