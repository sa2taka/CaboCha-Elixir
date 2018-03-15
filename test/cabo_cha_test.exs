defmodule CaboChaTest do
  use ExUnit.Case
  doctest CaboCha


  @sentence "昨日の友は明日の敵になる"
  @analysis [
    %{"chunk" => %{"id" => 0, "head" => 0, "func" => 1, "link" => 1, "rel" => "D", "score" => 2.310086},
      "morphs" => [
        %{"id" => 0, "surface" => "昨日", "pos" => "名詞", "pos1" => "副詞可能", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "昨日", "yomi" => "キノウ", "pronunciation" => "キノー"},
        %{"id" => 1, "surface" => "の", "pos" => "助詞", "pos1" => "連体化", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "の", "yomi" => "ノ", "pronunciation" => "ノ"},
      ]
    },
    %{"chunk" => %{"id" => 1, "head" => 2, "func" => 3, "link" => 4, "rel" => "D", "score" => -1.966230},
      "morphs" => [
        %{"id" => 2, "surface" => "友", "pos" => "名詞", "pos1" => "一般", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "友", "yomi" => "トモ", "pronunciation" => "トモ"},
        %{"id" => 3, "surface" => "は", "pos" => "助詞", "pos1" => "係助詞", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "は", "yomi" => "ハ", "pronunciation" => "ワ"},
      ]
    },
    %{"chunk" => %{"id" => 2, "head" => 4, "func" => 5, "link" => 3, "rel" => "D", "score" => 1.510471},
      "morphs" => [
        %{"id" => 4, "surface" => "明日", "pos" => "名詞", "pos1" => "副詞可能", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "明日", "yomi" => "アシタ", "pronunciation" => "アシタ"},
        %{"id" => 5, "surface" => "の", "pos" => "助詞", "pos1" => "連体化", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "の", "yomi" => "ノ", "pronunciation" => "ノ"},
      ]
    },
    %{"chunk" => %{"id" => 3, "head" => 6, "func" => 7, "link" => 4, "rel" => "D", "score" => -1.966230},
      "morphs" => [
        %{"id" => 6, "surface" => "敵", "pos" => "名詞", "pos1" => "一般", "pos2" => "", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "敵", "yomi" => "テキ", "pronunciation" => "テキ"},
        %{"id" => 7, "surface" => "に", "pos" => "助詞", "pos1" => "格助詞", "pos2" => "一般", "pos3" => "", "conjugation_form" => "", "conjugation" => "", "base" => "に", "yomi" => "ニ", "pronunciation" => "ニ"},
      ]
    },
    %{"chunk" => %{"id" => 4, "head" => 8, "func" => 8, "link" => -1, "rel" => "D", "score" => 0.000000},
      "morphs" => [
        %{"id" => 8, "surface" => "なる", "pos" => "動詞", "pos1" => "自立", "pos2" => "", "pos3" => "", "conjugation_form" => "五段・ラ行", "conjugation" => "基本形", "base" => "なる", "yomi" => "ナル", "pronunciation" => "ナル"},
      ]
    },
  ]

  test "CaboCha.parse" do
    assert CaboCha.parse(@sentence) == @analysis
  end
end
