add_subdirectory(ZC2_FULL)
add_subdirectory(ZC2_UPDATES)
add_subdirectory(ZDB)
add_subdirectory(CUSTOM)

FILE(GLOB _SQL_UPDATES *.sql)

INSTALL(FILES ${_SQL_UPDATES} DESTINATION share/trinity/sql/ZC2)
