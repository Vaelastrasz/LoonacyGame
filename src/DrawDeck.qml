import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    property string title: "DrawDeck"
    property color idleColor: "grey"
    property var cardLeftCounter: 20
    id: root

    width: mainWindow.cardWidth * 1.7
    height: mainWindow.cardHeight * 1.5

    MouseArea {
        anchors.fill: parent
        onPressed: {
            generateCard(mainWindow.player1.playerHand, 1)
            generateCard(mainWindow.player2.playerHand, 1)
            cardLeftCounter -= 2
            if (cardLeftCounter <= 0) {
                parent.visible = false
            }
        }
    }

    Text {
        anchors.bottom: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: "CardLeft:<b> " + cardLeftCounter + "</b>"
        color: "white"
        font.pixelSize: 15
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
            }
        }
    }
}
