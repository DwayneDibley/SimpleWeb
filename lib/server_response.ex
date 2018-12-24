defmodule ServerResponse do
  @moduledoc """
  This structure contains the reply data received from the server.
  version:    The HTTP version. e.g. "HTTP/1.1"
  result:     The HTTP Server result as an integer, e.g. 200
  result_txt: The HTTP response as a string, e.g. "OK"
  headers:    The headers from the response as a map of strings.
  body:       The body of the response as a string, typically the HTML document.
  """
  defstruct version: "",
            result: nil,
            result_txt: "",
            headers: "",
            body: ""

  @type t() :: %__MODULE__{
          version: String.t(),
          result: integer(),
          result_txt: String.t(),
          headers: Map.t(),
          body: String.t()
        }
end
