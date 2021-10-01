module main

import vweb

// expose a simple, minimal web server
// to use it for simple benchmarks, ensure to compile with all optimizations (for production) ...

const (
	// server = 'localhost'
	port = 8000
)

struct App {
    vweb.Context
}

fn main() {
	// println("Server listening on 'http://${server}:${port}' ...")
	vweb.run(new_app(), port)
}

// new_app creates and returns a new app instance
fn new_app() &App {
	mut app := &App{}

	// additional app instance startup only configuration
	// app.handle_static('.', false) // serve static content from current folder
	// app.handle_static('public', false) // serve static content from folder './public'
	// note that template files now can be in the same folder, or under 'templates/' ...

	return app
}

// before_request initialization just before any route call
pub fn (mut app App) before_request() {
}

// index serve some content on the root (index) route '/'
// note that this implementation doesn't requires a template page ...
pub fn (mut app App) index() vweb.Result {
	return app.json('{"Hello":"World"}')
}
