import QtQuick 2.12

Item {
    id: root
    property color color: "gray"
    property color borderIdle: "black"
    property color borderActive: "limegreen"
    property string text: "title"
    property int xStart: 0
    property int yStart: 0
    property alias cardModel: cardModel

    width: mainWindow.cardWidth
    height: mainWindow.cardHeight

    function setDragStartPos() {
        xStart = x
        yStart = y
        console.log("Drag started: " + xStart + "x" + yStart + "\nZ: " + z)
    }

    function cardReturnAnimation() {
        animationXBack.start()
        animationYBack.start()
    }
    function pointOnCard() {
        animationScaleOnMouse.start()
        cardModel.border.color = borderActive
        cardModel.border.width = 4
        z = ++currentMaxZ;
    }
    function unpointOnCard() {
        animationScaleLower.start()
        cardModel.border.color = borderIdle
        cardModel.border.width = 2
    }

    Drag.active: interactionCardArea.drag.active
    Drag.keys: [mainWindow.key]

    Rectangle {
        id: cardModel
        anchors.fill: root
        color: root.color
        border.color: borderIdle
        border.width: 2
        radius: (width * 0.2)


        Text {
            text: root.text
            anchors.centerIn: parent
            font.pixelSize: 20
        }

        MouseArea {
            id: interactionCardArea
            anchors.fill: parent
            drag.target: root
            hoverEnabled: true
            onPressed: root.setDragStartPos();
            onReleased: {root.cardReturnAnimation(); root.Drag.drop()}
            onEntered: root.pointOnCard()
            onExited: root.unpointOnCard()
        }

        ScaleAnimator {
            id: animationScaleOnMouse
            target: root
            from: 1.0
            to: 1.2
            duration: 300
        }

        ScaleAnimator {
            id: animationScaleLower
            target: root
            from: 1.2
            to: 1.0
            duration: 300
        }

        PropertyAnimation {
            id: animationYBack
            target: root
            property: "y"
            to: yStart
            duration: 800
        }

        PropertyAnimation {
            id: animationXBack
            target: root
            property: "x"
            to: xStart
            duration: 800
        }
    }
}

