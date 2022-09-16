import pkg/cppstl/std_basicstring

{.push header: "anitomy/string.h".}

type
  AnitomyChar* {.importcpp: "anitomy::char_t".} = object
  AnitomyString* {.importcpp: "anitomy::string_t".} = CppBasicString[AnitomyChar]

proc data(this: AnitomyString): ptr UncheckedArray[AnitomyChar] {.importcpp: "#.data(@)".}

{.pop.}

proc initAnitomyString*(s: string or cstring): AnitomyString =
  initCppBasicString(cast[ptr UncheckedArray[AnitomyChar]](WideCString newWideCString(s)))

func `$`*(s: AnitomyString): string =
  let data = cast[WideCString](s.data())
  $data
