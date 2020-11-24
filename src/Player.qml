import QtQuick 2.12

Item {
    property string direction: ""
    property int cardNum: 0
    property alias playerHand: handRow;

    id: root

    function generateHand(cardNumber : int) {
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
            anchors.rightMargin = mainWindow.cardWidth * 8
            anchors.top = parent.top
            anchors.right = parent.right
            break;
        case "down":
            break;
        case "left":
            break;
        case "right":
            break;
        }
    }


    Row {
        id: handRow
        anchors.fill: parent
        spacing : -(mainWindow.cardWidth / 3)
        function tmp() {console.log("Card:" + mainWindow.cardWidth + "x" + mainWindow.cardHeight)}
        Component.onCompleted: {setAnchors(); tmp(); generateHand(5)}
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
    }
}
