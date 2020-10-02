#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] 
extern crate rocket;

use rocket::config::{Config,Environment,LoggingLevel};

#[get("/")]
fn index() -> &'static str {
    "Hello, world!"
}

fn main() {
    let config = Config::build(Environment::Staging)
    .address("0.0.0.0")
    .log_level(LoggingLevel::Critical)
    .port(8080)
    .workers(128)
    .unwrap();

    rocket::custom(config).mount("/", routes![index]).launch();
}