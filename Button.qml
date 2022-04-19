import QtQuick 2.0

 //Implementation of the Button control.
 Item {
     id: button
     width: 50
     height: innerText.font.pixelSize+10
     property alias buttonText: innerText.text;
     property color color: "white"
     property color pressColor: "green"
     onEnabledChanged: state = ""
     signal clicked



     //Rectangle to draw the button
     Rectangle {
         id: rectangleButton
         anchors.fill: parent

         Rectangle{
             id:indicator
             width: 10
             height: parent.height
             color:"red"
             anchors.left:rectangleButton.left
         }

         Text {
             id: innerText
             font.pixelSize:16
             anchors.centerIn: button
             anchors.left:indicator.right
         }
     }

     //change the color of the button in differen button states
     states: [
         State {
             name: "Hovering"
         },
         State {
             name: "Pressed"
             PropertyChanges {
                 target: indicator
                 color: "green"
             }
         }
     ]

     //define transmission for the states
     transitions: [
         Transition {
             from: "*"; to: "Hovering"
             PropertyAnimation {target: indicator; properties: "width";to:25; easing.type: Easing.InOutQuad }

         },
         Transition {
             from: "*"; to: "Pressed"
             ColorAnimation { target: indicator;duration: 10 }
             PropertyAnimation {target: indicator; properties: "width";to:30; duration:100 }

         },
         Transition {
             from: "*"; to: ""
             PropertyAnimation {target: indicator; properties: "width";to:10; easing.type: Easing.InOutQuad }

         }
     ]

     //Mouse area to react on click events
     MouseArea {
         hoverEnabled: true
         anchors.fill: button
         onEntered: { button.state='Hovering'}
         onExited: { button.state=''}
         onClicked: { button.clicked();}
         onPressed: { button.state="Pressed" }
         onReleased: {
             if (containsMouse)
               button.state="Hovering";
             else
               button.state="";
         }
     }
 }

