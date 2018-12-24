defmodule ServerConfig do
  @moduledoc """
  Server configuration struct:
  server_name:    The name of the server.
  bind_address:   The local port that the server will bind to.
  server_root:    The base directory for the server data.
  document_root:  Where the server will look for documents to serve.
  mime_types:     A list of mime types to use when serving files (by file extension)
  error_log:      Where to write error logs. If no leading "/" the server root
                  is pre-pended.
  transfer_log:   Where to write transfer logs. If no leading "/" the server
                  root is pre-pended.

  """
  defstruct server_name: "httpd_test",
            port: 8080,
            bind_address: "localhost",
            server_root: ".",
            document_root: "htdocs",
            mime_types: [
              {'html', 'text/html'},
              {'htm', 'text/html'},
              {'js', 'application/javascript'},
              {'css', 'text/css'}
            ],
            modules: [:mod_alias, :mod_get, :mod_log],
            error_log: 'log/error_log.txt',
            transfer_log: 'log/transfer_log.txt'

  @type t() :: %__MODULE__{
          server_name: String.t(),
          port: integer(),
          bind_address: String.t(),
          server_root: String.t(),
          document_root: String.t(),
          mime_types: List.t(),
          modules: List.t(),
          error_log: String.t(),
          transfer_log: String.t()
        }
end
