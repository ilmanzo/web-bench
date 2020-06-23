module main

import vweb

// expose a simple, minimal web server
// to use it for simple benchmarks, ensure to compile with all optimizations (for production) ...

const (
	// server = 'localhost'
	port = 8000
)

struct App {
pub mut:
    vweb vweb.Context
}

fn main() {
	// println("Server listening on 'http://${server}:${port}' ...")
    vweb.run<App>(port)
}

// initialization of webapp
pub fn (mut app App) init_once() {
	// app.vweb.handle_static('.') // serve static content from current folder
	// app.vweb.handle_static('public') // serve static content from folder './public'
	// note that template files now can be in the same folder, or under 'templates/' ...
}

// initialization before any action
pub fn (mut app App) init() {
}

// serve some content on the root (index) route '/'
// note that this implementation doesn't requires a template page ...
fn (mut app App) index() {
	app.vweb.json('{"Hello":"World"}')
}

