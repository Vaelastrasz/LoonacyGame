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
        var colorArray = ["blue", "green", "yellow", "limegreen", "red"]
        var iter;
        for (iter in cardNumber) {
            //generate card here
        }
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
        Component.onCompleted: {root.setAnchors(); generateHand(5)}
        Card {
            id: blueCard
            color: "blue"
            text: "Card1"
        }
        Card {
            id: greenCard
            color: "green"
            text: "Card2"
        }
        Card {
            id: yellowCard
            color: "yellow"
            text: "Card3"
        }
        Card {
            id: redCard
            color: "red"
            text: "Card4"
        }
        Card {
            color: "green"
            text: "Card4"
        }
    }
}
