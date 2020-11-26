import QtQuick 2.12

Item {
    property color enterColor: "red"
    property color idleColor: "yellow"
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
//            currCard.color = enterColor
            currentCard.color = drag.source.color
            drag.source.visible = false
        }
//        onExited: currCard.color = idleColor

        Card {
            id: currCard
            anchors.fill: parent
            color: "blue"
            text: "Card1"
        }

    }
}
