# CaboCha-Elixir

**Elixir bindings for CaboCha, a Japanese dependency structure analyzer**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1.Add `cabo_cha` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cabo_cha, "~> 1.0.0"}
  ]
end
```

2.Add `cabocha` command for your environment:

```bash
# macOS
brew install cabocha
```

## Usage
For more details, go to [Hex Online Documentation](https://hexdocs.pm/cabo_cha).

The way of parsing string is as follows:

```elixir
iex(1)> CaboCha.parse("太郎は花子が読んでいる本を次郎に渡した")
[
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
]
```
