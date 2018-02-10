//
//  QuikklyPluginDelegate.swift
//
//  Created by Rob Byrne on 09/02/2018.
//
//  A protocol to carry the scanned codes back to the
//  caller.

protocol QuikklyPluginDelegate: class  {
    func sendCodes(codes:[UInt64])
}