pragma Singleton
import QtQuick

QtObject {

    // Colorscheme
    readonly property color background_1: "#171717";
    readonly property color background_2: "#242424";
    readonly property color text: "#e7e7e7";
    readonly property color primary_1: "#ffaeac";
    readonly property color primary_2: "#bed6e9";
    readonly property color primary_3: "#a9fcb7";
    readonly property color primary_4: "#e4c78f";


    // Fonts
    readonly property FontLoader _bf1: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-Black.otf"}
    readonly property FontLoader _bf2: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-BlackItalic.otf"}
    readonly property FontLoader _bf3: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-Bold.otf"}
    readonly property FontLoader _bf4: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-BoldItalic.otf"}
    readonly property FontLoader _bf5: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-Italic.otf"}
    readonly property FontLoader _bf6: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-Light.otf"}
    readonly property FontLoader _bf7: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-LightItalic.otf"}
    readonly property FontLoader _bf8: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-Medium.otf"}
    readonly property FontLoader _bf9: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-MediumItalic.otf"}
    readonly property FontLoader _bf10: FontLoader { source: "/assets/fonts/Satoshi/Satoshi-Regular.otf"}

    readonly property string baseFontFamily: _bf1.name
}
