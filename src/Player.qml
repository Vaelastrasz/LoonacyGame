import QtQuick 2.12

Item {
    property string name: "Player"
    property string direction: ""
    property int cardNum: handRow.children.length
    property alias playerHand: handRow;

    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: -(handRow.width / 2)
    anchors.bottomMargin: mainWindow.cardHeight

    function generateHand(cardNumber) {

        generateCard(handRow, cardNumber)
    }

    function setPlayerAnchors() {
        console.log("direction of player: " + direction)
        switch(direction) {
        case "up":
            anchors.top = parent.top
            break;
        case "down":
            anchors.bottom = parent.bottom
            break;
        case "left":
            break;
        case "right":
            break;
        }
    }

    onCardNumChanged: {
        if (cardNum <= 0) {
            gameWon(name)
        }
    }

    Component.onCompleted: {setPlayerAnchors(); generateHand(3)}

    Row {
        id: handRow
        spacing : -(mainWindow.cardWidth / 3)
    }

}
