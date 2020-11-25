import QtQuick 2.0

Item {
    id: root
    anchors.centerIn: parent
    Row {
        spacing: mainWindow.cardWidth / 3
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        DrawDeck {
            id: drawDeck
        }

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
