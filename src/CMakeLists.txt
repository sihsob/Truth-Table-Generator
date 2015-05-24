cmake_minimum_required (VERSION 2.8.11)

# we will use flex and bison to construct
# some crucial files for us

find_package (BISON)
find_package (FLEX)

BISON_TARGET (parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cc)
FLEX_TARGET (scanner lexer.l  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cc)
ADD_FLEX_BISON_DEPENDENCY (scanner parser)

include_directories (${CMAKE+CURRENT_BINARY_DIR})

add_executable (ttg
  entry.c
  ${BISON_parser_OUTPUTS}
  ${FLEX_scanner_OUTPUTS}
  )

target_link_libraries (ttg ${FLEX_LIBRARIES} ${BISON_LIBRARIES})

