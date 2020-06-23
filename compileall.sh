nim c --opt:speed helloweb.nim && mv helloweb helloweb-nim
fpc -O3 helloweb.pas && mv helloweb helloweb-pas
v -prod -o ./helloweb-v hello-web.v
go build -o ./helloweb-go -ldflags="-s -w" hello-web.go
crystal build hello-web.cr -o ./hello-web-crystal --release --no-debug
