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

    readonly property FontLoader _hf1: FontLoader {source: "/assets/fonts/ClashDisplay/ClashDisplay-Bold.otf"}
    readonly property FontLoader _hf2: FontLoader {source: "/assets/fonts/ClashDisplay/ClashDisplay-Extralight.otf"}
    readonly property FontLoader _hf3: FontLoader {source: "/assets/fonts/ClashDisplay/ClashDisplay-Light.otf"}
    readonly property FontLoader _hf4: FontLoader {source: "/assets/fonts/ClashDisplay/ClashDisplay-Medium.otf"}
    readonly property FontLoader _hf5: FontLoader {source: "/assets/fonts/ClashDisplay/ClashDisplay-Regular.otf"}
    readonly property FontLoader _hf6: FontLoader {source: "/assets/fonts/ClashDisplay/ClashDisplay-Semibold.otf"}

    readonly property FontLoader _mf1: FontLoader {source: "/assets/fonts/AzeretMono/AzeretMono-Black.otf"}
    readonly property FontLoader _mf2: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-BlackItalic.otf"}
    readonly property FontLoader _mf3: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-Bold.otf"}
    readonly property FontLoader _mf4: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-BoldItalic.otf"}
    readonly property FontLoader _mf5: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-ExtraBold.otf"}
    readonly property FontLoader _mf6: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-ExtraBoldItalic.otf"}
    readonly property FontLoader _mf7: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-ExtraLight.otf"}
    readonly property FontLoader _mf8: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-ExtraLightItalic.otf"}
    readonly property FontLoader _mf9: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-Italic.otf"}
    readonly property FontLoader _mf10: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-Light.otf"}
    readonly property FontLoader _mf11: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-LightItalic.otf"}
    readonly property FontLoader _mf12: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-Medium.otf"}
    readonly property FontLoader _mf13: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-MediumItalic.otf"}
    readonly property FontLoader _mf14: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-Regular.otf"}
    readonly property FontLoader _mf15: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-SemiBold.otf"}
    readonly property FontLoader _mf16: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-SemiBoldItalic.otf"}
    readonly property FontLoader _mf17: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-Thin.otf"}
    readonly property FontLoader _mf18: FontLoader {source: "../assets/fonts/AzeretMono/AzeretMono-ThinItalic.otf"}

    readonly property string baseFontFamily: _bf1.name
    readonly property string titleFontFamily: _hf1.name
    readonly property string monoFontFamily: _mf1.name
}
