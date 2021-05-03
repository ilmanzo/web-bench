module main

import vweb

// expose a simple, minimal web server
// to use it for simple benchmarks, ensure to compile with all optimizations (for production) ...

const (
	// server = 'localhost'
	port = 8000
)

struct App {
    vweb.Context // using embedded struct
}

fn main() {
	// println("Server listening on 'http://${server}:${port}' ...")
    vweb.run<App>(port)
}

// init_server initialization of webapp
pub fn (mut app App) init_server() {
	// app.handle_static('.') // serve static content from current folder
	// app.handle_static('public') // serve static content from folder './public'
	// note that template files now can be in the same folder, or under 'templates/' ...
}

// before_request initialization just before any route call
pub fn (mut app App) before_request() {
}

// index serve some content on the root (index) route '/'
// note that this implementation doesn't requires a template page ...
pub fn (mut app App) index() vweb.Result {
	return app.json('{"Hello":"World"}')
}
