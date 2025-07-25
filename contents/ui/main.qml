import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.1
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support

PlasmoidItem {
  id: root
  width: iconAndTem.width
  height: widgetSize
  
  property var days: []

  Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground | PlasmaCore.Types.ConfigurableBackground
  preferredRepresentation: compactRepresentation

  property bool boldfonts: plasmoid.configuration.boldfonts
  property string temperatureUnit: plasmoid.configuration.temperatureUnit
  property string sizeFontConfg: plasmoid.configuration.sizeFontConfig
  property int widgetSize: plasmoid.configuration.widgetSize ? plasmoid.configuration.widgetSize : 32

  DayOfWeekRow {
    id: daysWeek
    visible:  false
    delegate: Item {
      Component.onCompleted: {
        days.push(shortName)
      }
    }
  }

  compactRepresentation: CompactRepresentation {

  }
  fullRepresentation: FullRepresentation {
  }

  Component.onCompleted: {
    plasmoid.setAction("refresh", i18n("Refresh"), "view-refresh")
  }

  onActionTriggered: {
    if (actionName === "refresh") {
      iconAndTem.weatherData.updateWeather(1)
    }
  }
}
