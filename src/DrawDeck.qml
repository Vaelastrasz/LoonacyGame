import QtQuick 2.0

Item {
    property string title: "DrawDeck"
    property color idleColor: "grey"
    property var cardLeftCounter: 0

    width: mainWindow.cardWidth * 1.5
    height: mainWindow.cardHeight * 1.5

    anchors.left: parent.left
    anchors.leftMargin: mainWindow.cardWidth * 0.5
    anchors.top: parent.top
    anchors.topMargin: mainWindow.cardHeight * 1.5
    MouseArea {
        anchors.fill: parent
        onPressed: {console.log("clicked"); cardLeftCounter--}
    }

    Rectangle {
        color: idleColor
        anchors.fill: parent
        Text {
            anchors.bottom: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            text: "CardLeft:<b> " + cardLeftCounter + "</b>"
            color: "white"
            font.pixelSize: 15
        }
    }
}
