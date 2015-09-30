import qbs.base 1.0
import qbs.FileInfo 1.0

Application {
    Depends { name: "cpp" }
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
//    Depends { name: "Qt.quick" }
//    Depends { name: "Qt.qml" }
//    Depends { name: "Qt.qmltooling" }
//    Depends { name: "Qt.network" }
    cpp.frameworks: ["AssetsLibrary"]
//    bundle.infoPlistFile: "Info.plist.in"
    cpp.signingIdentity: "iPhone Developer: Ivan Komissarov (9FD79QN6JD)"
    cpp.provisioningProfile: "/Users/i.komissarov/Library/MobileDevice/Provisioning\ Profiles/9a264426-a9c6-423f-bed2-7493417e4efb.mobileprovision"
    files: [
        "main.cpp",
        "qbshello.qrc",
    ]

    Group {
        fileTagsFilter: ["application"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? FileInfo.joinPaths("./", FileInfo.path(bundle.executablePath))
                        : "bin"
    }
}
