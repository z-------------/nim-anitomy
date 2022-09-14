import ./element
import ./string

{.push header: "anitomy/anitomy.h".}

type
  Anitomy* {.importcpp: "anitomy::Anitomy".} = object

proc Parse*(this: var Anitomy; filename: AnitomyString or ptr UncheckedArray[AnitomyChar]): bool {.importcpp: "#.Parse(@)".}

proc elements*(this: var Anitomy): Elements {.importcpp: "#.elements(@)".}

{.pop.}
