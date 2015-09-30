import QtQuick 2.3
import QtQml.Models 2.2
import QtQuick.Controls 1.4

import com.arch.models 1.0

import "."

Rectangle {
    color: "red"
    anchors.centerIn: parent
    anchors.fill: parent

    FileSystemModel {
        id: fileModel
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: View {}
    }
}
