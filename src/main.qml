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
        id: generalBackgroundImage
        anchors.fill: parent
        source: "/images/resources/background"
    }

    DropDeckLayer {
        id: dropDeckLayer
    }

    DrawDeck {
        id: drawDeck
    }

    Player {
        id: player1
        height: 97
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        direction: "up"
    }

    Player {
        id: player2
        y: 384
        height: 96
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 0
        direction: "down"
    }


}

/*##^##
Designer {
    D{i:4;anchors_y:0}
}
##^##*/
