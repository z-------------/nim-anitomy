import std/os

const AnitomySrcDir = "../anitomy/anitomy"
{.compile: AnitomySrcDir / "anitomy.cpp".}
{.compile: AnitomySrcDir / "element.cpp".}
{.compile: AnitomySrcDir / "keyword.cpp".}
{.compile: AnitomySrcDir / "parser_helper.cpp".}
{.compile: AnitomySrcDir / "parser_number.cpp".}
{.compile: AnitomySrcDir / "parser.cpp".}
{.compile: AnitomySrcDir / "string.cpp".}
{.compile: AnitomySrcDir / "token.cpp".}
{.compile: AnitomySrcDir / "tokenizer.cpp".}

{.passC: "-I" & currentSourcePath().parentDir.parentDir / "anitomy".}

import ./anitomy/[
  anitomy,
  element,
  string,
]

export
  anitomy,
  element,
  string

when isMainModule:
  const Filename = "[TaigaSubs]_Toradora!_(2008)_-_01v2_-_Tiger_and_Dragon_[1280x720_H.264_FLAC][1234ABCD].mkv"

  var a = initAnitomy()
  if a.Parse(initAnitomyString(Filename)):
    echo a.elements.size, " elements:"
    for element in a.elements:
      echo element.first, ": ", element.second
  else:
    stderr.writeLine "parse failed"
