add_subdirectory(CUSTOM)
add_subdirectory(FULL_DB)
add_subdirectory(SITE)
add_subdirectory(UPDATES)

FILE(GLOB _SQL_UPDATES *.sql)

INSTALL(FILES ${_SQL_UPDATES} DESTINATION share/trinity/sql/ZC2/ZDB)
