cmake_minimum_required(VERSION 3.16)

project(qtquick1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appqtquick1
    main.cpp
)

qt_add_qml_module(appqtquick1
    URI qtquick1
    VERSION 1.0
    QML_FILES
        main.qml
        Rectangle1.qml
        MyScript.js
        MButton.qml

    RESOURCES
        images/trash.png
#        fonts/Font\ Awesome\ 6\ Pro-Thin-100.otf
#        fonts/Font\ Awesome\ 6\ Pro-Solid-900.otf
        fonts/Font\ Awesome\ 6\ Pro-Regular-400.otf
#        fonts/Font\ Awesome\ 6\ Pro-Light-300.otf
)

set_target_properties(appqtquick1 PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqtquick1
    PRIVATE Qt6::Quick)

install(TARGETS appqtquick1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
