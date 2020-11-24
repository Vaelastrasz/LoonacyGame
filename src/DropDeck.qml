import QtQuick 2.12

Item {
    property color enterColor: "red"
    property color idleColor: "yellow"
    property alias _goal: goal
    id: root
    width: mainWindow.cardWidth * 1.5
    height: mainWindow.cardHeight * 1.5

    DropArea {
        id: deckDrop
        anchors.fill: parent
        Drag.keys: [mainWindow.key]
        Component.onCompleted: {console.log(parent.width+"x"+parent.height)}
        onDropped: {
            console.log("dropped!")
            goal.color = enterColor
        }
        onExited: goal.color = idleColor
        Rectangle {
            id: goal
            anchors.fill: parent
            color: idleColor
        }
    }
}
