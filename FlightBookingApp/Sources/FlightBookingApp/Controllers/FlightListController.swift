//
//  FlightListController.swift
//  FlightBookingApp
//
//  Created by Shilpa Joy on 2021-09-30.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class FlightListController {
    
    func handleFlightListRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            try response.setBody(json: getFlightList())
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
            
        }
    }
}
