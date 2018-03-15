defmodule CaboCha do
  @moduledoc """
  Elixir bindings for CaboCha, a Japanese dependency structure analyzer.

  Parse function resturns a list of map.
  The map's keys meaning is a follows.

  - `chunk`: 文節(Chunk) -- This is map which includes follows.
    + `id`: 文節id(Chunk id)
    + `link`: 係り先の文節id(Linked chunk id)
    + `rel`: 不明(Unknown)
    + `head`: 主辞の形態素id(Head morpheme id)
    + `func`: 機能語の形態素id(Function word morpheme id)
    + `score`: 係り関係のスコア(Relational score)
  - `morphs`: 分節の中の単語の形態素のリスト(List of morpheme in chunk) -- The list have few maps which includes follows.
    + `id`: 形態素id(Morpheme id)
    + `surface`: 表層系(Surface)
    + `pos`: 品詞(Part of speech)
    + `pos1`: 品詞細分類1(Part of speech subcategory1)
    + `pos2`: 品詞細分類2(Part of speech subcategory2)
    + `pos3`: 品詞細分類3(Part of speech subcategory3)
    + `conjugation_form`: 活用形(Conjugation form)
    + `conjugation`: 活用形(conjucation)
    + `base`: 基本形・原型(Lexical form)
    + `yomi`: 読み(Reading)
    + `pronunciation`: 発音(Pronunciation)
  """

  @doc """
  Parse given string and returns CaboCha's list.

  If read_from_file is true, The file is parsed using str as the filename

  ## Examples

  ```elixir
  iex> CaboCha.parse("太郎は花子が読んでいる本を次郎に渡した")
  [
    %{
      "chunk" => %{
        "func" => 1,
        "head" => 0,
        "id" => 0,
        "link" => 5,
        "rel" => "D",
        "score" => -0.742128
      },
      "morphs" => [
        %{
          "base" => "太郎",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 0,
          "pos" => "名詞",
          "pos1" => "固有名詞",
          "pos2" => "人名",
          "pos3" => "名",
          "pronunciation" => "タロー",
          "surface" => "太郎",
          "yomi" => "タロウ"
        },
        %{
          "base" => "は",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 1,
          "pos" => "助詞",
          "pos1" => "係助詞",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "ワ",
          "surface" => "は",
          "yomi" => "ハ"
        }
      ]
    },
    %{
      "chunk" => %{
        "func" => 3,
        "head" => 2,
        "id" => 1,
        "link" => 2,
        "rel" => "D",
        "score" => 1.700175
      },
      "morphs" => [
        %{
          "base" => "花子",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 2,
          "pos" => "名詞",
          "pos1" => "固有名詞",
          "pos2" => "人名",
          "pos3" => "名",
          "pronunciation" => "ハナコ",
          "surface" => "花子",
          "yomi" => "ハナコ"
        },
        %{
          "base" => "が",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 3,
          "pos" => "助詞",
          "pos1" => "格助詞",
          "pos2" => "一般",
          "pos3" => "",
          "pronunciation" => "ガ",
          "surface" => "が",
          "yomi" => "ガ"
        }
      ]
    },
    %{
      "chunk" => %{
        "func" => 6,
        "head" => 4,
        "id" => 2,
        "link" => 3,
        "rel" => "D",
        "score" => 1.825021
      },
      "morphs" => [
        %{
          "base" => "読む",
          "conjugation" => "連用タ接続",
          "conjugation_form" => "五段・マ行",
          "id" => 4,
          "pos" => "動詞",
          "pos1" => "自立",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "ヨン",
          "surface" => "読ん",
          "yomi" => "ヨン"
        },
        %{
          "base" => "で",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 5,
          "pos" => "助詞",
          "pos1" => "接続助詞",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "デ",
          "surface" => "で",
          "yomi" => "デ"
        },
        %{
          "base" => "いる",
          "conjugation" => "基本形",
          "conjugation_form" => "一段",
          "id" => 6,
          "pos" => "動詞",
          "pos1" => "非自立",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "イル",
          "surface" => "いる",
          "yomi" => "イル"
        }
      ]
    },
    %{
      "chunk" => %{
        "func" => 8,
        "head" => 7,
        "id" => 3,
        "link" => 5,
        "rel" => "D",
        "score" => -0.742128
      },
      "morphs" => [
        %{
          "base" => "本",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 7,
          "pos" => "名詞",
          "pos1" => "一般",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "ホン",
          "surface" => "本",
          "yomi" => "ホン"
        },
        %{
          "base" => "を",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 8,
          "pos" => "助詞",
          "pos1" => "格助詞",
          "pos2" => "一般",
          "pos3" => "",
          "pronunciation" => "ヲ",
          "surface" => "を",
          "yomi" => "ヲ"
        }
      ]
    },
    %{
      "chunk" => %{
        "func" => 11,
        "head" => 10,
        "id" => 4,
        "link" => 5,
        "rel" => "D",
        "score" => -0.742128
      },
      "morphs" => [
        %{
          "base" => "次",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 9,
          "pos" => "名詞",
          "pos1" => "一般",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "ツギ",
          "surface" => "次",
          "yomi" => "ツギ"
        },
        %{
          "base" => "郎",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 10,
          "pos" => "名詞",
          "pos1" => "一般",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "ロー",
          "surface" => "郎",
          "yomi" => "ロウ"
        },
        %{
          "base" => "に",
          "conjugation" => "",
          "conjugation_form" => "",
          "id" => 11,
          "pos" => "助詞",
          "pos1" => "格助詞",
          "pos2" => "一般",
          "pos3" => "",
          "pronunciation" => "ニ",
          "surface" => "に",
          "yomi" => "ニ"
        }
      ]
    },
    %{
      "chunk" => %{
        "func" => 13,
        "head" => 12,
        "id" => 5,
        "link" => -1,
        "rel" => "D",
        "score" => 0.0
      },
      "morphs" => [
        %{
          "base" => "渡す",
          "conjugation" => "連用形",
          "conjugation_form" => "五段・サ行",
          "id" => 12,
          "pos" => "動詞",
          "pos1" => "自立",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "ワタシ",
          "surface" => "渡し",
          "yomi" => "ワタシ"
        },
        %{
          "base" => "た",
          "conjugation" => "基本形",
          "conjugation_form" => "特殊・タ",
          "id" => 13,
          "pos" => "助動詞",
          "pos1" => "",
          "pos2" => "",
          "pos3" => "",
          "pronunciation" => "タ",
          "surface" => "た",
          "yomi" => "タ"
        }
      ]
    }
  ]
  ```
  """

  @spec parse(String.t, boolean()) :: [Map.t, ...]

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
      %{"chunk" => chunk, "morphs" => toks}
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
