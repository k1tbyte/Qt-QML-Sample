cmake_minimum_required(VERSION 3.16)
project(Qt_QML_Sample)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS
        Core
        Gui
        Widgets
        Qml
        Quick
        QuickControls2
        REQUIRED
)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

add_executable(${PROJECT_NAME}
        main.cpp
        app/ThemeManager.cpp
        app/ThemeManager.h
        app/Settings.cpp
        app/Settings.h
)

qt_add_qml_module(${PROJECT_NAME}
        URI ${PROJECT_NAME}
        VERSION 1.0
        QML_FILES
        ui/view/Main.qml
        ui/view/Settings.qml
        ui/components/MyButton.qml
        ui/components/MyInput.qml
        ui/components/ColorPicker.qml
)

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        Qt::Core
        Qt::Gui
        Qt::Widgets
        Qt::Qml
        Qt::Quick
        Qt::QuickControls2
)