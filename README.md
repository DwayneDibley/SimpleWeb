# SimpleWeb

A trivial HTTP client and server for testing web applications.

## Server:

A simple server capable of serving HTML, Javascript, CSS etc. 

To run it:

`{:ok, pid} = SimpleWebServer.start()`

it will serve on localhost:8080 from ./htdocs.

This can be configured, see server_config.ex for details.

## Client:

A simple web client for testing.

To run it:



```
iex(1)> SimpleWebClient.get("http://www.google.com/")

%ServerResponse{
  body: "<!doctype html><html itemscope=\"\" itemtype=\"http://schema.org/WebPage\" lang=\"de\">...,
  headers: %{
    "accept-ranges" => "none",
    "cache-control" => "private, max-age=0",
    "content-length" => "47750",
    "content-type" => "text/html; charset=ISO-8859-1",
    "date" => "Mon, 24 Dec 2018 08:28:35 GMT",
    "expires" => "-1",
    "p3p" => "CP=\"This is not a P3P policy! See g.co/p3phelp for more info.\"",
    "server" => "gws",
    "set-cookie" => ... 
    "vary" => "Accept-Encoding",
    "x-frame-options" => "SAMEORIGIN",
    "x-xss-protection" => "1; mode=block"
  },
  result: 200,
  result_txt: "OK",
  version: "HTTP/1.1"
}

iex(2)> 
```

