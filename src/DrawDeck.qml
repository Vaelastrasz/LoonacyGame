import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    property string title: "DrawDeck"
    property color idleColor: "grey"
    property var cardLeftCounter: 0

    width: mainWindow.cardWidth * 1.5
    height: mainWindow.cardHeight * 1.5

//    anchors.left: parent.left
//    anchors.leftMargin: mainWindow.cardWidth * 0.5
//    anchors.top: parent.top
//    anchors.topMargin: mainWindow.cardHeight * 1.5
    MouseArea {
        anchors.fill: parent
        onPressed: {console.log("clicked"); cardLeftCounter--}
    }

    Image {
        id: cardBackground
        anchors.fill: parent
        source: "qrc:/images/resources/back.png"
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: cardBackground.width
                height: cardBackground.height
                Rectangle {
                    anchors.fill: parent
                    border.color: "black"
                    border.width: 2
                    radius: (width * 0.2)
                }
                Text {
                    anchors.bottom: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "CardLeft:<b> " + cardLeftCounter + "</b>"
                    color: "white"
                    font.pixelSize: 15
                }
            }
        }
    }
}
