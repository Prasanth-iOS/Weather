//
//  HTTPURLResponse+StatusCode.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
