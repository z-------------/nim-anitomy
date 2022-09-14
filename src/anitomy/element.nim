{.experimental: "overloadableEnums".}

import ./string

{.push header: "anitomy/element.h".}

type
  ElementCategory* = enum
    AnimeSeason
    AnimeSeasonPrefix
    AnimeTitle
    AnimeType
    AnimeYear
    AudioTerm
    DeviceCompatibility
    EpisodeNumber
    EpisodeNumberAlt
    EpisodePrefix
    EpisodeTitle
    FileChecksum
    FileExtension
    FileName
    Language
    Other
    ReleaseGroup
    ReleaseInformation
    ReleaseVersion
    Source
    Subtitles
    VideoResolution
    VideoTerm
    VolumeNumber
    VolumePrefix
    Unknown
  Elements* {.importcpp: "anitomy::Elements".} = object
  ElementPair* {.importcpp: "anitomy::element_pair_t".} = object # std::pair<ElementCategory, string_t>
    first*: ElementCategory
    second*: AnitomyString

# Capacity

proc empty*(this: Elements): bool {.importcpp: "#.empty(@)".}
proc size*(this: Elements): csizeT {.importcpp: "#.size(@)".}

# Iterators
# TODO

# Element access

proc at*(this: Elements; position: csizeT): ElementPair {.importcpp: "#.at(@)".}

{.pop.}