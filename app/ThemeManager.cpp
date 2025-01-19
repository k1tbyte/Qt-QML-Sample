//
// Created by kitbyte on 19.01.2025.
//

#include "ThemeManager.h"
#include <QSettings>

ThemeManager::ThemeManager(QObject *parent)
    : QObject(parent)
    , m_accentColor("#2196F3")
    , m_darkMode(false)
    , m_backgroundColor("#F5F5F5")
    , m_textColor("#212121")
{
    loadTheme();
}

ThemeManager::~ThemeManager()
{
    saveTheme();
}

void ThemeManager::setAccentColor(const QColor &color)
{
    if (m_accentColor != color) {
        m_accentColor = color;
        emit accentColorChanged();
    }
}

void ThemeManager::setDarkMode(bool enabled)
{
    if (m_darkMode != enabled) {
        m_darkMode = enabled;
        updateColors();
        emit darkModeChanged();
    }
}

void ThemeManager::saveTheme()
{
    QSettings settings;
    settings.beginGroup("Theme");
    settings.setValue("accentColor", m_accentColor.name());
    settings.setValue("darkMode", m_darkMode);
    settings.endGroup();
}

void ThemeManager::loadTheme()
{
    QSettings settings;
    settings.beginGroup("Theme");
    setAccentColor(QColor(settings.value("accentColor", "#2196F3").toString()));
    setDarkMode(settings.value("darkMode", false).toBool());
    settings.endGroup();
}

void ThemeManager::updateColors()
{
    if (m_darkMode) {
        m_backgroundColor = "#303030";
        m_textColor = "#FFFFFF";
    } else {
        m_backgroundColor = "#F5F5F5";
        m_textColor = "#212121";
    }

    emit backgroundColorChanged();
    emit textColorChanged();
}