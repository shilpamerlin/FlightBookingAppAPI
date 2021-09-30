//
//  FlightDetailController.swift
//  FlightBookingApp
//
//  Created by Shilpa Joy on 2021-09-30.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class FlightDetailcontroller {
    
    func handleFlightDetailRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            //fetching id from request
            guard let flightId: Int = Int(request.urlVariables["id"] ?? "") else {
                response.setBody(string: "ID is missing")
                    .completed(status: .badRequest)
                return
            }
            // if we get id use FlightDetailData and filter it for particular id and return the response
            let flightDetails = getFlightDetailsData().filter { details in
                if let id = details["id"] as? Int {
                    return id == flightId
                }
                return false
            }
            try response.setBody(json: flightDetails)
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
            
        }
    }
}
