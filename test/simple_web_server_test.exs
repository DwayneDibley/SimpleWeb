defmodule SimpleWebServerTest do
  use ExUnit.Case
  doctest SimpleWebServer

  @doc """
  Start the server with default settings.
  Retrieve the config.
  Stop the server.
  """
  test "test 1: Server start Stop" do
    {:ok, pid} = SimpleWebServer.start(%ServerConfig{})

    reply = SimpleWebServer.info(pid)

    assert reply[:mime_types] == [
             {'js', 'application/javascript'},
             {'css', 'text/css'},
             {'htm', 'text/html'},
             {'html', 'text/html'}
           ]

    assert reply[:server_name] == 'httpd_test'

    assert reply[:bind_address] == {127, 0, 0, 1}
    assert(reply[:port] == 8080)
    assert reply[:modules] == [:mod_alias, :mod_get, :mod_log]
    assert(reply[:server_root] == '.')

    assert reply[:document_root] == 'htdocs'

    SimpleWebServer.stop(pid)
    # Give the server time to stop before the next test
    :timer.sleep(1000)
  end

  @doc """
  Start a server with default settings.
  Retrieve the index.html document.
  Check the reply.
  Stop the server.
  """
  test "test 2: Client request" do
    {:ok, pid} = SimpleWebServer.start()

    reply = SimpleWebClient.get("http://localhost:8080/index.html")
    # IO.puts("xxx = #{inspect(reply)}")
    assert reply.version == "HTTP/1.1"
    assert reply.result == 200
    assert reply.result_txt == "OK"

    SimpleWebServer.stop(pid)
    # Give the server time to stop before the next test
    :timer.sleep(1000)
  end
end
