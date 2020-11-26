import QtQuick 2.0

Item {
    property alias drawDeck: drawDeck
    property alias dropDeck1: dropDeck1
    property alias dropDeck2: dropDeck2
    property alias dropDeck3: dropDeck3
    property alias dropDeck4: dropDeck4
    id: root
    anchors.centerIn: parent
    Row {
        spacing: mainWindow.cardWidth / 3
        anchors.centerIn: parent
        DrawDeck {id: drawDeck}

        DropDeck {id: dropDeck1}
        DropDeck {id: dropDeck2}
        DropDeck {id: dropDeck3}
        DropDeck {id: dropDeck4}
    }
}
