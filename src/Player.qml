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
        var imgArray = ["brain", "cat", "chocolate", "earth", "guys", "heart", "liberty", "moon"];
//        imgArray.forEach(element => console.log("Category:" + element));
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
        Card {
            img1: "brain"
            img2: "cat"
        }
        Card {
            img1: "guys"
            img2: "earth"
        }
        Card {
            img1: "moon"
            img2: "cat"
        }
        Card {
            img1: "moon"
            img2: "earth"
        }
        Card {}
    }

}
