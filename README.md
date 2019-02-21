This projects builds install modules for Chrome, Firefox and IE batch signing plugins and merges them into a single installation package.
The project depends on the [browser-batch-token-signing](/nortal/browser-batch-token-signing) and [chrome-batch-token-signing](/nortal/chrome-batch-token-signing) projects.

## Prerequisites
* Visual Studio 2015/2017
* [WiX Toolset](http://wixtoolset.org/)
* [Wix Toolset Visual Studio 2017 Extension](https://marketplace.visualstudio.com/items?itemName=RobMensching.WixToolsetVisualStudio2017Extension) (if using VS2017)

## Compiling
1. Open Developer Command Prompt for Visual Studio
2. Run the following commands:
```
git clone https://github.com/nortal/chrome-batch-token-signing.git
cd chrome-batch-token-signing
git submodule update --init --recursive
nmake build
cd ..

git clone https://github.com/nortal/browser-batch-token-signing.git
cd browser-batch-token-signing
msbuild /t:ie-token-signing:Rebuild /p:Configuration=Release;Platform=Win32 browser-token-signing.sln
cd ..

git clone https://github.com/nortal/batch-token-signing-installer.git
cd batch-token-signing-installer
nmake build-modules
nmake pkg-unsigned
cd ..
```
The installer executable is written to "MergedTokenSigningInstall\bin\Release\MergedTokenSigningInstall_version.msi".