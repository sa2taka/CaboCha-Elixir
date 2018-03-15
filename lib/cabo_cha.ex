defmodule CaboCha do
  @moduledoc """
  Elixir bindings for CaboCha, a Japanese dependency structure analyzer.
  """

  def parse(str, read_from_file \\ false) do
    command = case read_from_file do
      true ->
        "cabocha -f1 #{str}"
      _ ->
        """
        cat <<EOS.e42197de978c41367f46aa6429ed5c8e | cabocha -f3
        #{str}
        EOS.e42197de978c41367f46aa6429ed5c8e
        """
    end

    [{"sentence", [], result}] = command
    |> String.to_charlist
    |> :os.cmd
    |> List.to_string
    |> String.trim
    |> Floki.find("sentence")

    result
    |> Enum.map(fn {_, chunk_info, toks} ->
      chunk = Enum.reduce(chunk_info, %{}, fn({key, value}, acc) ->
        case key do
          "score" ->
            Map.put(acc, key, String.to_float(value))
          "rel" ->
            Map.put(acc, key, value)
          _ ->
            Map.put(acc, key, String.to_integer(value))
        end

      end)
      toks = create_toks(toks)
      %{"chunk" => chunk, "toks" => toks}
    end)
  end

  defp create_toks(toks) do
    toks
    |> Enum.map(fn {_, [{_, id}, {_, feature}], [surface]} ->
      %{"id" => String.to_integer(id)}
      |> Map.merge(%{"surface" => surface})
      |> Map.merge(parse_feature(feature))
    end)
  end

  defp parse_feature(feature) do
    Regex.named_captures(~r/
          ^
          (?:
            (?<pos>[^,]+),
            \*?(?<pos1>[^,]*),
            \*?(?<pos2>[^,]*),
            \*?(?<pos3>[^,]*),
            \*?(?<conjugation_form>[^,]*),
            \*?(?<conjugation>[^,]*),
            (?<base>[^,]*)
            (?:
              ,(?<yomi>[^,]*)
              ,(?<pronunciation>[^,]*)
            )?
          )?
          $
          /x, feature)
  end
end
