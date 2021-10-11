# web-bench
writing a simple 'hello word' webserver in many languages

## featuring

- [crystal](https://crystal-lang.org/)
- [go](https://golang.org/)
- [nim](https://nim-lang.org/)
- [pascal (freepascal)](https://www.freepascal.org/)
- [php](https://www.php.net/)
- [rust](https://www.rust-lang.org/)
- [v](https://vlang.io/)

## compile and setup

See bash script `compileall.sh`.
For some examples latest [Docker](https://www.docker.com/) is needed to build and run.

## testing 

Using 'Apacke Bench' (part of Apache httpd server), 8 threads for a total of 100.000 requests:
```
    ab -n 100000 -c 8 http://localhost:8080/
```
or with 'wrk', 8 threads and 320 connections for a 10 seconds of tests:
```
    wrk -t8 -c320 -d10s --latency http://127.0.0.1:8080/
```

## contributions are welcome

Fork the repo and submit a PR.

----
