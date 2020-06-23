# web-bench
writing a simple 'hello word' webserver in many languages

## featuring

- [crystal](https://crystal-lang.org/)
- [go](https://golang.org/)
- [nim](https://nim-lang.org/)
- [pascal (freepascal)](https://www.freepascal.org/)
- [v](https://vlang.io/)

## testing 

    ab -n 100000 -c 100 http://localhost:8080/

or better

    wrk -t10 -c400 -d10s --latency http://127.0.0.1:8080/


## contributions are welcome!
