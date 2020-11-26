import QtQuick 2.12

Item {
    property alias currentCard: currCard
    id: root
    width: mainWindow.cardWidth * 1.5
    height: mainWindow.cardHeight * 1.5

    function isCardCompatible(card) {
        if (card.img1 === currCard.img1 || card.img1 === currCard.img2 ||
            card.img2 === currCard.img1 || card.img2 === currCard.img2) {
            return true;
        }
        return false;
    }

    DropArea {
        id: deckDrop
        anchors.fill: parent
        Drag.keys: [mainWindow.key]
        onDropped: {
            if (isCardCompatible(drag.source)) {
                drag.source.scaleToDeck(currCard)
                console.log("card "+drag.source.img1+":"+drag.source.img2+" is COMPATIBLE")
            } else {
                console.log("card "+drag.source.img1+":"+drag.source.img2+" is inccompatible with "+currCard.img1+":"+currCard.img2)
                drag.source.cardReturnAnimation()
            }
        }

        Card {
            id: currCard
            anchors.fill: parent
            isDragable: false
        }
    }
}
