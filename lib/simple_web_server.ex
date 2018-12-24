defmodule SimpleWebServer do
  @moduledoc """
  A simple web server using the Erlang httpd module.
  """

  @doc """
  Start a simple web server. Start is supplied with a ServerConfig struct.

  Default Configuration:
  The ServerConfig struct contains sensible defaults to start the server on
  localhost port 8080, with the server root in the start directory. The web pages
  are stored in the <server_root>/<htdocs> directory. Logging is done to The
  <server_root>/<log> directory.

  If the start is sucessful, {:ok, PID} is returned, otherwise {:error, error_message}
  is returned.
  """
  def start(conf \\ %ServerConfig{}) do
    _ret = :inets.start()

    case :inets.start(:httpd, [
           {:port, conf.port},
           {:server_name, to_charlist(conf.server_name)},
           {:server_root, to_charlist(conf.server_root)},
           {:document_root, to_charlist(conf.document_root)},
           {:bind_address, to_charlist(conf.bind_address)},
           {:mime_types, conf.mime_types},
           {:modules, conf.modules},
           {:error_log, to_charlist(conf.error_log)},
           {:transfer_log, to_charlist(conf.transfer_log)}
         ]) do
      {:ok, pid} ->
        {:ok, pid}

      err ->
        {:error, err}
    end
  end

  @doc """
  Return the server info. This is a list of key value pairs containing the
  configuration. e.g:
      [
      mime_types: [{'htm', 'text/html'}, {'html', 'text/html'}],
      server_name: 'httpd_test',
      bind_address: {127, 0, 0, 1},
      server_root: '.',
      port: 4849,
      document_root: './htdocs'
    ]

    If the server is not running, {:error, "Process is not alive."} is returned.
  """
  def info(pid) do
    case Process.alive?(pid) do
      true -> :httpd.info(pid)
      false -> {:error, "Process is not alive."}
    end
  end

  @doc """
  Stop the server.
  """
  def stop(pid) do
    :inets.stop(:httpd, pid)
  end
end
