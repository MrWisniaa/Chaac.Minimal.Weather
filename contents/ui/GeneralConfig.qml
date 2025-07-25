import QtQuick
import QtQuick.Controls
import org.kde.kirigami as Kirigami
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: configRoot

    QtObject {
        id: unidWeatherValue
        property var value
    }

    QtObject {
        id: fontsizeValue
        property var value
    }

    QtObject {
        id: widgetSizeValue
        property var value
    }

    QtObject {
        id: cityValue
        property var value
    }

    signal configurationChanged

    property alias cfg_temperatureUnit: unidWeatherValue.value
    property alias cfg_sizeFontConfig: fontsizeValue.value
    property alias cfg_cityName: cityField.text
    property alias cfg_useCoordinatesIp: autamateCoorde.checked
    property alias cfg_boldfonts: boldfont.checked
    property alias cfg_textweather: textweather.checked
    property alias cfg_widgetSize: widgetSizeValue.value

    Kirigami.FormLayout {
        width: parent.width

        ComboBox {
            textRole: "text"
            valueRole: "value"
            id: positionComboBox
            Kirigami.FormData.label: i18n("Temperature Unit:")
            model: [
                {text: i18n("Celsius (°C)"), value: 0},
                {text: i18n("Fahrenheit (°F)"), value: 1},
            ]
            onActivated: unidWeatherValue.value = currentValue
            Component.onCompleted: currentIndex = indexOfValue(unidWeatherValue.value)
        }
        CheckBox {
            id: textweather
            Kirigami.FormData.label: i18n('weather conditions text on panel:')
        }

        CheckBox {
            id: autamateCoorde
            Kirigami.FormData.label: i18n('Use IP location')
        }
        TextField {
            id: cityField
            visible: !autamateCoorde.checked
            Kirigami.FormData.label: i18n("City:")
            width: 200
        }
        CheckBox {
            id: boldfont
            Kirigami.FormData.label: i18n('Bold font:')
        }
        ComboBox {
            textRole: "text"
            valueRole: "value"
            Kirigami.FormData.label: i18n('Font Size:')
            id: valueForSizeFont
            model: [
                {text: i18n("8"), value: 8},
                {text: i18n("9"), value: 9},
                {text: i18n("10"), value: 10},
                {text: i18n("11"), value: 11},
                {text: i18n("12"), value: 12},
                {text: i18n("13"), value: 13},
                {text: i18n("14"), value: 14},
                {text: i18n("15"), value: 15},
                {text: i18n("16"), value: 16},
                {text: i18n("17"), value: 17},
                {text: i18n("18"), value: 18},

            ]
            onActivated: fontsizeValue.value = currentValue
            Component.onCompleted: currentIndex = indexOfValue(fontsizeValue.value)
        }
        ComboBox {
            textRole: "text"
            valueRole: "value"
            Kirigami.FormData.label: i18n('Widget Size:')
            id: widgetSizeBox
            model: [
                {text: i18n('Small'), value: 32},
                {text: i18n('Medium'), value: 64},
                {text: i18n('Large'), value: 96},
            ]
            onActivated: widgetSizeValue.value = currentValue
            Component.onCompleted: currentIndex = indexOfValue(widgetSizeValue.value)
        }
    }

}
