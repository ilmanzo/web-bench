extern crate tiny_http;

use tiny_http::{Response, Server};

fn main() {
    let server = Server::http("0.0.0.0:8080").unwrap();

    for request in server.incoming_requests() {
        // println!(
        //     "received request! method: {:?}, url: {:?}, headers: {:?}",
        //     request.method(),
        //     request.url(),
        //     request.headers()
        // );

        let response = Response::from_string("hello world");
        request.respond(response);
    }
}
