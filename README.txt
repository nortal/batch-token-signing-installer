-This projects is just for building install modules for chrome, firefox and IE signing plugins and then mergeing them into single installation package.
-The projects depends on ../browser-token-signing and ../chrome-token-signing projects

How to:
1. Compile IE, firefox and chrome plugins, which produces next files correspondingly: 
	-$(var.ExtSolutionDir)Release/esteid-plugin-ie.dll: "msbuild /t:ie-token-signing:Rebuild;ie-token-signing-wix:Rebuild /p:Configuration=Release;Platform=Win32 browser-token-signing.sln"
	-$(var.ExtSolutionDir)host-windows/Release/chrome-token-signing-mass.exe "make"
ExtSolutionDir stands for external solution dir, which should point to real directory of plugins' solutions. These variables are defined in config wxi files.
	1.1 IF IE compilation fails with "[...] error MSB8011: [...]" then you can register esteid-plugin-ie.dll manually with: "regsvr32 /s /n /i:user esteid-plugin-ie.dll" in Release folder

2. Now you are ready to execute "make build-modules" in this projects root folder

3. "make pkg" or "make pkg-unsigned"

4. These commands produce .msm for each plugin and the merges them together to "MergedTokenSigningInstall\bin\Release\MergedTokenSigningInstall.msi"