:: ------------------------------------------------------------------------
:: FusionInventory
:: Copyright (C) 2010-2013 by the FusionInventory Development Team.
::
:: http://www.fusioninventory.org/   http://forge.fusioninventory.org/
:: ------------------------------------------------------------------------
::
:: LICENSE
::
:: This file is part of FusionInventory project.
::
:: FusionInventory Agent Installer for Microsoft Windows is free software;
:: you can redistribute it and/or modify it under the terms of the GNU
:: General Public License as published by the Free Software Foundation;
:: either version 2 of the License, or (at your option) any later version.
::
::
:: FusionInventory Agent Installer for Microsoft Windows is distributed in
:: the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
:: the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
:: PURPOSE. See the GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program; if not, write to the Free Software Foundation,
:: Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
:: or see <http://www.gnu.org/licenses/>.
::
:: ------------------------------------------------------------------------
::
:: @package   FusionInventory Agent Installer for Microsoft Windows
:: @file      .\Perl\Scripts\uninstall-gnu-utilities-collection.bat
:: @author    Tomas Abad <tabadgp@gmail.com>
:: @copyright Copyright (c) 2010-2013 FusionInventory Team
:: @license   GNU GPL version 2 or (at your option) any later version
::            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
:: @link      http://www.fusioninventory.org/
:: @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
:: @since     2012
::
:: ------------------------------------------------------------------------


@echo off

for %%p in (".") do pushd "%%~fsp"
cd /d "%~dp0"

set MINGW_PATH=%SYSTEMDRIVE%\MinGW

if not exist "%MINGW_PATH%" goto not_installed
:: MinGW/MSYS is already installed

:: delete %MINGW_PATH% directory
rmdir /q /s "%MINGW_PATH%"

goto end_of_file

:not_installed
:: MinGW/MSYS is not installed

echo.
echo It seems that MinGW/MSYS is not installed into "%MINGW_PATH%".
echo.

:end_of_file
:: unset environment variables

set MINGW_PATH=

popd
exit /b 0
