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

    DropDeckLayer{}

    Player {
        id: player1
        x: 243
        y: 384
        direction: "up"
    }


    Player {
        id: player2
        direction: "down"
    }

}
