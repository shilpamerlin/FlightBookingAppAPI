import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

//1. create http server by assiging a port and start, server will be listening at port 8080
//2. Create directory , data, controller, route - actual app has different routers
    // a. create dummy data, create own JSON data in the form of dictionary
    // b. Creating the server means go to controller and add logic for returning the data
//3. Add/connect routes to it, routes are URIs which client will be using to request services
    // a. Set up routes and return it
    // b. Add these routes to the server
// remove listening port lsof -n -i4TCP:8080

let server = HTTPServer()
server.serverPort = 8080
server.addRoutes(setupRouter())

do {
    try server.start()
} catch {
    print("Error starting server\(error)")
}
