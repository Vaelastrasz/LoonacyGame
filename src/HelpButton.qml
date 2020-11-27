import QtQuick 2.14
import QtQuick.Controls 2.12

Item {
    id: root
    width: parent.width / 30
    height: width
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.leftMargin: width / 3
    anchors.topMargin: width / 3
    Rectangle {
        anchors.fill: parent
        radius: width
        color: "blue"
        border.color: "white"
        border.width: width * 0.1
        Text {
            text: "?"
            anchors.centerIn: parent
            color: "white"
            font.bold: true
            font.pixelSize: 30
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {upskale.start()}
        onExited: {downskale.start()}
        onClicked: {helpInfo.visible = true}
    }

    ScaleAnimator {
        id: upskale
        target: root
        from: 1.0
        to: 1.2
        duration: 150
    }

    ScaleAnimator {
        id: downskale
        target: root
        from: 1.2
        to: 1.0
        duration: 150
    }

    Popup {
        id: helpInfo
        width: mainWindow.width
        height: mainWindow.height
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape

        Text {
            anchors.centerIn: parent
            text: "<ol><li>Each card in Loonacy features two different pictures</li>
                       <li>In the start of the game each player receives 10 cards</li>
                       <li>Winner is a player who places all of his cards earlier than opponent</li>
                       <li>Card can be placed on the field only if it has at least one common picture with upper card of corresponding deck</li>
                       <li>If both players can not place card because of no intersections any of them can tap on face down deck and each of players would receive one card to his hand</li>
                       <li>There is no turn system - players can make a move whenever they see intersections, so act fast!</li>
                   </ol><br>
                   Good luck!
                   <br><br>
                   Press \"Esc\" to close this window"
            font.bold: true
            font.pixelSize: 20
        }
    }
}
