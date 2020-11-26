import QtQuick 2.12
import QtGraphicalEffects 1.14

Item {
    id: root
    property color color: "white"
    property color borderIdle: "black"
    property color borderActive: "limegreen"
    property string img1
    property string img2
    property bool isDragable: true
    property var someCard
    property int xStart: 0
    property int yStart: 0

    width: mainWindow.cardWidth
    height: mainWindow.cardHeight

    function setDragStartPos() {
        xStart = x
        yStart = y
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

    function scaleToDeck(deckCard) {
        animationScaleToDeck.start()
        someCard = deckCard
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
        Image {
            id: upperImg
            anchors.top: parent.top
            anchors.topMargin: (parent.height * 0.01)
            anchors.horizontalCenter: parent.horizontalCenter
            height: (parent.height / 2) - (parent.height * 0.05)
            width: parent.width - (parent.width * 0.05)
            source: "qrc:/images/resources/" + img1

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: upperImg.width
                    height: upperImg.height
                    Rectangle {
                        anchors.fill: parent
                        border.color: "black"
                        border.width: 2
                        radius: (width * 0.2)
                    }
                }
            }
        }
        Image {
            id: lowerImg
            anchors.bottom: parent.bottom
            anchors.bottomMargin: (parent.height * 0.01)
            anchors.horizontalCenter: parent.horizontalCenter
            height: (parent.height / 2) - (parent.height * 0.05)
            width: parent.width - (parent.width * 0.05)
            source: "qrc:/images/resources/" + img2
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: lowerImg.width
                    height: lowerImg.height
                    Rectangle {
                        anchors.fill: parent
                        border.color: "black"
                        border.width: 2
                        radius: (width * 0.2)
                    }
                }
            }
        }

//        Text {
//            text: img1 + ":" + img2
//            font.pixelSize: 20
//            anchors.centerIn: parent
//            color: "black"
//        }

        MouseArea {
            id: interactionCardArea
            anchors.fill: parent
            drag.target: isDragable ? root : isDragable
            hoverEnabled: true
            onPressed: root.setDragStartPos()
            onReleased: {
                root.Drag.drop()
                root.cardReturnAnimation()
            }
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

        ScaleAnimator {
            id: animationScaleToDeck
            target: root
            from: 1.0
            to: 1.5
            duration: 300
            onStopped: {
                someCard.img1 = img1
                someCard.img2 = img2
                visible = false
            }
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

