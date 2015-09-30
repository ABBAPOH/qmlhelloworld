import QtQuick 2.0
import QtQuick 2.3
import QtQml.Models 2.2
import QtQuick.Controls 1.4

ListView {
    model: DelegateModel {
        id: delegateModel
        model: fileModel

        delegate: Rectangle {
            height: text.height
            width: parent.width
            Text {
                id: text
                font.pixelSize: 50
                text: {
                    // return display; // this also works
                    // index property is the current row
                    if (index == -1) // dunno why -1 is passed
                        return "";
                    // get current QModelIndex (row, column, parent)
                    var modelIndex = fileModel.index(index, 0, delegateModel.rootIndex);
                    // available roles are exported via QAbstractItemModel::roleNames
                    return fileModel.data(modelIndex, fileModel.display);
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var modelIndex = fileModel.index(index, 0, delegateModel.rootIndex);

                    if (fileModel.data(modelIndex) === "..") { // up one level
                        stackView.pop();
                        return;
                    }

                    if (!fileModel.hasChildren(modelIndex)) // is it file?
                        return;

                    var v = stackView.push(Qt.resolvedUrl("View.qml"))
                    v.model.rootIndex = modelIndex
                }
            }
        }
    }
}
