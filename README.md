# QML Components Demo

A demo project showcasing Qt/QML application architecture with custom components, theme management, and proper project structure. This project serves as an example of creating reusable QML components and implementing a clean separation between UI and business logic.

## 📋 Features

- Custom QML components demonstration
- Theme management system (light/dark mode)
- Modern C++/QML application architecture
- Clean separation of UI and backend logic
- Dynamic color management
- Reusable components structure

## 🏗️ Project Structure

```
Qt_QML_Sample/
├── CMakeLists.txt
├── main.cpp
├── app/
│   ├── Settings.cpp
│   ├── Settings.h
│   ├── ThemeManager.cpp
│   ├── ThemeManager.h
│   └── .... other infrastructure
└── ui/
    ├── components/
    │   ├── ColorPicker.qml
    │   ├── MyButton.qml
    │   ├── MyInput.qml
    │   └── .... other UI-components
    └── view/
        ├── Main.qml
        ├── Settings.qml
        └── ... pages, modals, windows, etc.
```

## 🛠️ Building

### Prerequisites
- Qt 6.5.0 or higher
- CMake 3.16 or higher
- C++17 compatible compiler

### Build Steps

```bash
mkdir build
cd build
cmake ..
cmake --build .
```

## 🎨 Components

### ThemeManager
Backend C++ class that manages application theming:
```cpp
class ThemeManager : public QObject {
    Q_PROPERTY(QColor accentColor READ accentColor WRITE setAccentColor NOTIFY accentColorChanged)
    Q_PROPERTY(bool darkMode READ darkMode WRITE setDarkMode NOTIFY darkModeChanged)
    // ...
};
```

### Custom QML Components (Created as an example)
- **ColorPicker.qml**: Color selection component
- **MyButton.qml**: Customized button component
- **MyInput.qml**: Enhanced input field component

## 📝 Usage Example

```qml
import QtQuick
import QtQuick.Controls.Basic
import "../components"

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    
    MyButton {
        text: "Hello"
        onClicked: console.log("Button clicked!")
    }
    
    MyInput {
        placeholder: "Enter text..."
        onTextChanged: console.log("Text:", text)
    }
}
```

## 🔧 Configuration

Theme configuration in main.cpp:
```cpp
auto* themeManager = new ThemeManager(&app);
engine.rootContext()->setContextProperty("themeManager", themeManager);
```

## 👨‍💻 Author
- [k1tbyte](https://github.com/k1tbyte)

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📚 Resources
- [Qt Documentation](https://doc.qt.io/)
- [QML Reference](https://doc.qt.io/qt-6/qmlreference.html)
- [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html)

---

*This project serves as an example of modern Qt/QML application architecture and component design. Feel free to use it as a reference for your own projects.*