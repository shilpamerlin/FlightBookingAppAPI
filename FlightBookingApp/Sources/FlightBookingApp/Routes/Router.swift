//
//  Router.swift
//  FlightBookingApp
//
//  Created by Shilpa Joy on 2021-09-30.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

func setupRouter() -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uri: "/flights") { request, response in
        FlightListController().handleFlightListRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/details/{id}") { request, response in
        FlightDetailcontroller().handleFlightDetailRequest(request: request, response: response)
    }
    return routes
}
