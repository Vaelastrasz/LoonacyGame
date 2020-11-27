import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.12

Window {
    id: mainWindow
    visible: true
    visibility: "Maximized"
    title: "Loonacy Game v0.2"

    property alias player1: player1
    property alias player2: player2
    property var currentMaxZ: 0
    property string key : "dropDeckKey"
    property int cardWidth: (width / 14)
    property int cardHeight: (height / 4.5)
    property string winnerName: ""

    function getRandomInt(min, max) {
        min = Math.ceil(min)
        max = Math.floor(max)
        return Math.floor(Math.random() * (max - min + 1))  + min
    }

    function generateCard(parentObject, cardCount) {
        var imgArray = ["brain", "cat", "chocolate", "earth", "guys", "heart", "liberty", "moon"];

        for (var cnt = 0; cnt < cardCount; cnt++) {
            var card = Qt.createQmlObject("Card {id: generatedCard" + cnt + "}", parentObject, "DynamicallyLoaded")

            //trigger some animation, pass there final x y params???
//            card.moveCard(100, 100)
            //TODO: fix this, animation on generation works incorrectly
            card.img1 = imgArray[getRandomInt(0, 7)];
            card.img2 = imgArray[getRandomInt(0, 7)];
            while (card.img1 === card.img2) {
                card.img2 = imgArray[getRandomInt(0, 7)];
            }
        }
        return card
    }

    function gameWon(playerName) {
        winnerName = playerName
        gameWonPopup.visible = true
    }

    function gameDraw() {
        gameDrawPopup.visible = true
    }

    Component.onCompleted: {
        generateCard(dropDeckLayer.dropDeck1.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck1.currentCard);
        generateCard(dropDeckLayer.dropDeck2.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck2.currentCard);
        generateCard(dropDeckLayer.dropDeck3.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck3.currentCard);
        generateCard(dropDeckLayer.dropDeck4.currentCard, 1).scaleToDeck(dropDeckLayer.dropDeck4.currentCard);
    }

    Popup {
        id: gameWonPopup
        anchors.centerIn: parent
        width: mainWindow.width / 3
        height: mainWindow.height / 6
        modal: true
        focus: true

        Text {
            anchors.centerIn: parent
            text: "We have a winner! Congratulations, " + winnerName + "! <br> Press \"Exit\" to close application..."
            font.bold: true
            font.pixelSize: 15
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: width * 0.05
            text: "Exit"
            font.bold: true
            font.pixelSize: 15
            onClicked: mainWindow.close()
        }
    }

    Popup {
        id: gameDrawPopup
        anchors.centerIn: parent
        width: mainWindow.width / 3
        height: mainWindow.height / 6
        modal: true
        focus: true

        Text {
            anchors.centerIn: parent
            text: "We have a draw! Congratulations for both players! <br> Press \"Exit\" to close application..."
            font.bold: true
            font.pixelSize: 15
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: width * 0.05
            text: "Exit"
            font.bold: true
            font.pixelSize: 15
            onClicked: mainWindow.close()
        }
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
        name: "Player 1"
    }

    Player {
        id: player2
        name: "Player 2"
        direction: "down"
    }


}
