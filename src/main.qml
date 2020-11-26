import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0

Window {
    id: mainWindow
    visible: true
    visibility: "Maximized"
    title: "Loonacy Game v 0.1"

    property var currentMaxZ: 0
    property string key : "dropDeckKey"
    property int cardWidth: (width / 15)
    property int cardHeight: (height / 4.5)

    Image {
        id: generalBackgroundImage
        anchors.fill: parent
        source: "/images/resources/background"
    }

    DeckLayer {
        id: dropDeckLayer
    }

    Player {
        id: player1
        direction: "up"
    }

    Player {
        id: player2
        y: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: mainWindow.cardHeight
        direction: "down"
    }


}
