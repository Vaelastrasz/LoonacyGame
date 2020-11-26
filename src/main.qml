import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0

Window {
    id: mainWindow
    visible: true
    visibility: "Maximized"
//    width: 800
//    height: 400
    title: "Loonacy Game v0.1"

    property alias player1: player1
    property alias player2: player2
    property var currentMaxZ: 0
    property string key : "dropDeckKey"
    property int cardWidth: (width / 14)
    property int cardHeight: (height / 4.5)

    function getRandomInt(min, max) {
        min = Math.ceil(min)
        max = Math.floor(max)
        return Math.floor(Math.random() * (max - min + 1))  + min
    }

    function generateCard(parentObject, cardCount) {
        let imgArray = ["brain", "cat", "chocolate", "earth", "guys", "heart", "liberty", "moon"];
        for (var cnt = 0; cnt < cardCount; cnt++) {
            var card = Qt.createQmlObject("Card {id: generatedCard" + cnt + "}", parentObject, "DynamicallyLoaded")
            card.img1 = imgArray[getRandomInt(0, 7)];
            card.img2 = imgArray[getRandomInt(0, 7)];
            while (card.img1 === card.img2) {
                card.img2 = imgArray[getRandomInt(0, 7)];
            }
            console.log("Card created: " + card.img1 + ":" + card.img2)
        }
        return card
    }
    Component.onCompleted: {
        generateCard(dropDeckLayer.dropDeck1.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck1.currentCard);
        generateCard(dropDeckLayer.dropDeck2.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck2.currentCard);
        generateCard(dropDeckLayer.dropDeck3.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck3.currentCard);
        generateCard(dropDeckLayer.dropDeck4.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck4.currentCard);
    }

    Image {
        id: generalBackgroundImage
        anchors.fill: parent
        source: "/images/resources/background"
    }

    DeckLayer {
        id: dropDeckLayer
    }

    Player {
        id: player1
        direction: "up"
    }

    Player {
        id: player2
        y: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: mainWindow.cardHeight
        direction: "down"
    }


}
