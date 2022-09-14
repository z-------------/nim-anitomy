{.push header: "anitomy/string.h".}

type
  AnitomyChar* {.importcpp: "anitomy::char_t".} = object
  AnitomyString* {.importcpp: "anitomy::string_t".} = object

proc initAnitomyString*(s: ptr UncheckedArray[AnitomyChar]): AnitomyString {.importcpp: "anitomy::string_t(@)", constructor.}

proc data(this: AnitomyString): ptr UncheckedArray[AnitomyChar] {.importcpp: "#.data(@)".}

{.pop.}

proc initAnitomyString*(s: string or cstring): AnitomyString =
  initAnitomyString(cast[ptr UncheckedArray[AnitomyChar]](WideCString newWideCString(s)))

func `$`*(s: AnitomyString): string =
  let data = cast[WideCString](s.data())
  $data
