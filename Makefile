#
# Chrome Token Signing Native Host
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#

# This is the Makefile for Windows NMake. See GNUmakefile for OSX/Linux.

SIGN = signtool sign /debug /v /a /n "NORTAL AS" /fd SHA256 /du http://nortal.com /t http://timestamp.verisign.com/scripts/timstamp.dll

build-modules:
	msbuild /t:"IE token signing install module":Rebuild /p:Configuration=Release;Platform=x86 "Mass token signing install.sln"
	msbuild /t:"Chrome token signing install module":Rebuild /p:Configuration=Release;Platform=x86 "Mass token signing install.sln"

pkg:
	msbuild /t:"MergedTokenSigningInstall":Rebuild /p:Configuration=Release;Platform=x86 "Mass token signing install.sln"
	$(SIGN) MergedTokenSigningInstall\bin\Release\MergedTokenSigningInstall.msi

pkg-unsigned:
	msbuild /t:"MergedTokenSigningInstall":Rebuild /p:Configuration=Release;Platform=x86 "Mass token signing install.sln"