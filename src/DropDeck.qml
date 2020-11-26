import QtQuick 2.12

Item {
    property alias currentCard: currCard
    id: root
    width: mainWindow.cardWidth * 1.5
    height: mainWindow.cardHeight * 1.5

    function isCardCompatible(card) {
        if (card.img1 === currCard.img1 || card.img1 === currCard.img2 ||
            card.img2 === currCard.img1 || card.img2 === currCard.img2) {
            console.log("CARDS COMPATIBLE!")
            return true;
        }
        console.log("CARDS ARENT COMPATIBLE!")
        return false;
    }

    DropArea {
        id: deckDrop
        anchors.fill: parent
        Drag.keys: [mainWindow.key]
        Component.onCompleted: {console.log(parent.width+"x"+parent.height)}
        onDropped: {
            if (isCardCompatible(drag.source)) {
                drag.source.scaleToDeck(currCard)
            } else {
                drag.source.cardReturnAnimation();
            }
        }

        Card {
            id: currCard
            anchors.fill: parent
            isDragable: false
        }
    }
}
