import QtQuick 2.12

Item {
    property string direction: ""
    property int cardNum: 0
    property alias playerHand: handRow;
    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.horizontalCenterOffset: -(handRow.width / 2)

    function generateHand(cardNumber) {
        console.log("CardNum: " + cardNumber)
        generateCard(handRow, cardNumber)
    }

    function setAnchors() {
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

    Row {
        id: handRow
        spacing : -(mainWindow.cardWidth / 3)
        Component.onCompleted: {setAnchors(); generateHand(10)}
    }

}
