module main

import json
import picoev
import picohttpparser as hp

// expose a simple, minimal web server using vlang picoev
// use it for simple benchmarks, ensure to compile with all optimizations (for production) ...

const (
	server = 'localhost'
	port = 8000
	message_string = 'Hello, World!'
	hello_world_json = '{"Hello":"World"}'
)

struct Message {
	// message string
	hello string
}

[inline]
fn json_response() string {
	msg := Message{
		// message: message_string
		hello: 'World'
	}
	return json.encode(msg)
}

[inline]
fn hello_response() string {
	return message_string
}

fn callback(data voidptr, req hp.Request, mut res hp.Response) {
	if hp.cmpn(req.method, 'GET ', 4) {
		if hp.cmp(req.path, '/') {
			res.http_ok()
			res.header_server()
			res.header_date()
			res.plain()
			res.body(hello_world_json)
		} else if hp.cmp(req.path, '/text') {
			res.http_ok()
			res.header_server()
			res.header_date()
			res.plain()
			res.body(hello_response())
		} else if hp.cmp(req.path, '/json') {
			res.http_ok()
			res.header_server()
			res.header_date()
			res.json()
			res.body(json_response())
		} else {
			res.http_404()
		}
	} else {
		res.http_405()
	}
	defer {
		// moved at the end
		res.end()
	}
}

fn main() {
	println("Server listening on 'http://${server}:${port}' ...")
	picoev.new(port: port, cb: &callback).serve()
}
