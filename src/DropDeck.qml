import QtQuick 2.12

Item {
    property alias currentCard: currCard
    id: root
    width: mainWindow.cardWidth * 1.5
    height: mainWindow.cardHeight * 1.5

    DropArea {
        id: deckDrop
        anchors.fill: parent
        Drag.keys: [mainWindow.key]
        Component.onCompleted: {console.log(parent.width+"x"+parent.height)}
        onDropped: {
            drag.source.visible = false
        }

        Card {
            id: currCard
            anchors.fill: parent
            isDragable: false
        }
    }
}
