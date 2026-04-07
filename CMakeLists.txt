cmake_minimum_required(VERSION 3.16)

find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    set(CMAKE_CXX_COMPILER_LAUNCHER ${CCACHE_PROGRAM})
endif()

project(StickDrift VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Needed to make lsps in neovim work
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(QT_QML_GENERATE_QMLLS_INI ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appStickDrift
    app/main.cpp
)

target_include_directories(appStickDrift PRIVATE 
    ${CMAKE_CURRENT_SOURCE_DIR}/app
    ${CMAKE_CURRENT_BINARY_DIR}
)

qt_add_resources(appStickDrift "app_fonts"
    PREFIX ""
    FILES
        assets/fonts/Satoshi/Satoshi-Black.otf
        assets/fonts/Satoshi/Satoshi-BlackItalic.otf
        assets/fonts/Satoshi/Satoshi-Bold.otf
        assets/fonts/Satoshi/Satoshi-BoldItalic.otf
        assets/fonts/Satoshi/Satoshi-Light.otf
        assets/fonts/Satoshi/Satoshi-LightItalic.otf
        assets/fonts/Satoshi/Satoshi-Medium.otf
        assets/fonts/Satoshi/Satoshi-MediumItalic.otf
        assets/fonts/Satoshi/Satoshi-Regular.otf
        assets/fonts/Satoshi/Satoshi-Italic.otf
        assets/fonts/ClashDisplay/ClashDisplay-Bold.otf
        assets/fonts/ClashDisplay/ClashDisplay-Extralight.otf
        assets/fonts/ClashDisplay/ClashDisplay-Light.otf
        assets/fonts/ClashDisplay/ClashDisplay-Medium.otf
        assets/fonts/ClashDisplay/ClashDisplay-Regular.otf
        assets/fonts/ClashDisplay/ClashDisplay-Semibold.otf
)

qt_add_resources(appStickDrift "app_icons"
    PREFIX ""
    FILES
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Canvas.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Ellipse.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Frame.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Pencil.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Polygon.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Scale.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Section.svg
    assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Select.svg
)

set(plain_qml_files
    qml/Main.qml
    qml/common/PrimaryButton.qml
    qml/common/text/BaseText.qml
    qml/common/text/TitleText.qml
    qml/components/ToolSelect/ToolSelect.qml
    qml/components/ToolSelect/ToolSelectItem.qml
    qml/screens/WelcomeScreen.qml
    qml/screens/WorkspaceScreen.qml
)

set(qml_singletons
    qml/Theme.qml
)

set(app_headers
    app/Constants.h
    app/WorkspaceState.h
)

set(app_files
    app/WorkspaceState.cpp
)

# https://doc.qt.io/qt-6/qml-singleton.html mentions that QT_QML_SINGLETON_TYPE flag has to be set to true to use Singletons
set_source_files_properties(${qml_singletons}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appStickDrift
    URI StickDrift
    QML_FILES ${plain_qml_files} ${qml_singletons}
    SOURCES ${app_headers} ${app_files}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appStickDrift PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appStickDrift
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appStickDrift
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Qml
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appStickDrift
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
