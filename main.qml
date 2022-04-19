import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column {
        y:300
        x:40

        Button { buttonText:" Play" }
        Button { buttonText:" Settings" }
        Button { buttonText:" Quit" }

    }

}
