import QtQuick 2.0

Item {
    id: root
    anchors.left: parent.left
    anchors.leftMargin: mainWindow.cardWidth * 2.4
    anchors.top: parent.top
    anchors.topMargin: mainWindow.cardHeight * 1.5
    Row {
        anchors.fill: parent
        spacing: mainWindow.cardWidth / 2
        DropDeck {
            id: dropDeck1
        }
        DropDeck {
            id: dropDeck2
        }
        DropDeck {
            id: dropDeck3
        }
        DropDeck {
            id: dropDeck4
        }
    }
}
