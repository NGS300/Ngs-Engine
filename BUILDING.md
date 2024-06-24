# Dependencies
0. Setup
    - Download [Haxe](https://haxe.org) - I Use 4.3.4
1. The Git Links
    - Download [Git](https://git-scm.com/downloads)
2. The **APIs** in ***Windows Commands Lines***
    * No ***Gits***
    ```bash
    haxelib install lime
    ```
    ```bash
    haxelib install openfl
    ```
    ```bash
    haxelib install flixel
    ```
    ```bash
    haxelib run lime setup flixel
    ```
    ```bash
    haxelib run lime setup
    ```
    ```bash
    haxelib install flixel-tools
    ```
    ```bash
    haxelib run flixel-tools setup
    ```
    ```bash
    haxelib install flixel-text-input
    ```
    ```bash
    haxelib install hxCodec
    ```
    ```bash
    haxelib install hamcrest
    ```
    ```bash
    haxelib install format
    ```

    * With ***Gits***
    ```bash
    haxelib git haxeui-core https://github.com/haxeui/haxeui-core.git
    ```
    ```bash
    haxelib git haxeui-flixel https://github.com/haxeui/haxeui-flixel.git
    ```
    ```bash
    haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc.git
    ```
    ```bash
    haxelib git polymod https://github.com/larsiusprime/polymod.git
    ```
    ```bash
    haxelib git flxanimate https://github.com/Dot-Stuff/flxanimate.git
    ```
    ```bash
    haxelib git json2object https://github.com/elnabo/json2object.git
    ```
    ```bash
    haxelib git mconsole https://github.com/massive-oss/mconsole.git
    ```
    ```bash
    haxelib git mcover https://github.com/massive-oss/mcover.git
    ```
    ```bash
    haxelib git mockatoo https://github.com/misprintt/mockatoo.git
    ```
    ```bash
    haxelib git munit https://github.com/massiveinteractive/MassiveUnit.git
    ```
    ```bash
    haxelib git thx.core https://github.com/fponticelli/thx.core.git
    ```
    ```bash
    haxelib git thx.semver https://github.com/fponticelli/thx.semver.git
    ```
    ```bash
    haxelib git hxgamejolt-api https://github.com/MAJigsaw77/hxgamejolt-api.git
    ```
3. Platform setup
   - For Windows, download the [Visual Studio 2022](https://visualstudio.microsoft.com/pt-br/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&cid=2030&passive=false)
        - When prompted, select "Individual Components" and make sure to download the following:
        - MSVC v143 VS 2022 C++ x64/x86 build tools
        - Windows 10/11 SDK
    - Mac: [`lime setup mac` Documentation](https://lime.openfl.org/docs/advanced-setup/macos/)
    - Linux: [`lime setup linux` Documentation](https://lime.openfl.org/docs/advanced-setup/linux/)
    - HTML5: Compiles without any extra setup
4. If you are targeting for native, you may need to run `lime rebuild PLATFORM` and `lime rebuild PLATFORM -debug`
5. `lime test PLATFORM` ! Add `-debug` to enable several debug features
6. The Visual Studio Code to Program
    - Download [Visual Studio Code](https://code.visualstudio.com/download)