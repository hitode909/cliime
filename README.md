# cliime

An Input Method Editor for Command Line

## Setup

```
bundle install
```

## Usage
Basic Usage
```
% bundle exec -- ruby cliime.rb nihonngohonnyakusuruyatudesu
日本語翻訳するやつです
日本語翻訳する奴です
日本語翻訳スルやつです
日本語翻訳スル奴です
```

Working with [mooz/percol](https://github.com/mooz/percol)

```
% bundle exec -- ruby cliime.rb nihonngohonnyakusuruyatudesu | percol | pbcopy
```

## How this works

- Convert romaji to hiragana with [romankana | RubyGems.org | your community gem host](https://rubygems.org/gems/romankana)
- Convert hiraga to kanji with [Google 日本語入力 - CGI API デベロッパーガイド](http://www.google.co.jp/ime/cgiapi.html)

