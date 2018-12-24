defmodule SimpleWebClient do
  @moduledoc """
  Simple web client.
  """

  @doc """
  Get the given URL.

  # SimpleWebClient.get("http://www.google.com/")
  """
  def get(url) do
    _ret = :inets.start()

    case :httpc.request(to_charlist(url)) do
      {:ok, {{version, result, reasonPhrase}, headers, body}} ->
        rep = %ServerResponse{
          version: to_string(version),
          result: result,
          result_txt: to_string(reasonPhrase),
          headers: prepHeaders(headers),
          body: to_string(body)
        }

        rep

      err ->
        {:error, err}
    end
  end

  @doc """
  Change the headers from a list of charlists to a map of strings.
  """
  def prepHeaders(headers) do
    for {k, v} <- headers do
      {to_string(k), to_string(v)}
    end
    |> Enum.into(%{})
  end
end
