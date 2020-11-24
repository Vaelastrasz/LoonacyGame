import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: "Loonacy Game v 0.1"
    property var currentMaxZ: 0
    property string key : "dropDeckKey"
    property int cardWidth: (width / 10)
    property int cardHeight: (height / 5)

    Image {
        anchors.fill: parent
        source: "/images/resources/background"
    }

    DropDeckLayer {
        id: dropDeckLayer
        x: 496
        y: 240
    }

    DrawDeck {
        id: drawDeck
    }

    Player {
        id: player1
        direction: "up"
    }

    Player {
        id: player2
        direction: "down"
    }


}
