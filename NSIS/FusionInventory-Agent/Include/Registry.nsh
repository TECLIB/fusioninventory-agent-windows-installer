/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2013 by the FusionInventory Development Team.

   http://www.fusioninventory.org/ http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory Agent Installer for Microsoft Windows is free software;
   you can redistribute it and/or modify it under the terms of the GNU
   General Public License as published by the Free Software Foundation;
   either version 2 of the License, or (at your option) any later version.


   FusionInventory Agent Installer for Microsoft Windows is distributed in
   the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
   PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
   or see <http://www.gnu.org/licenses/>.

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Include\Registry.nsh
   @author    Shengalts Aleksander
   @copyright Copyright (c) 2011
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/


!ifndef __FIAI_REGISTRY_INCLUDE__
!define __FIAI_REGISTRY_INCLUDE__


!define registry::Open `!insertmacro registry::Open`

!macro registry::Open _PATH _OPTIONS _HANDLE
   registry::_Open /NOUNLOAD `${_PATH}` `${_OPTIONS}`
   Pop ${_HANDLE}
!macroend


!define registry::Find `!insertmacro registry::Find`

!macro registry::Find _HANDLE _PATH _VALUEORKEY _STRING _TYPE
   registry::_Find /NOUNLOAD `${_HANDLE}`
   Pop ${_PATH}
   Pop ${_VALUEORKEY}
   Pop ${_STRING}
   Pop ${_TYPE}
!macroend


!define registry::Close `!insertmacro registry::Close`

!macro registry::Close _HANDLE
   registry::_Close /NOUNLOAD `${_HANDLE}`
!macroend


!define registry::KeyExists `!insertmacro registry::KeyExists`

!macro registry::KeyExists _PATH _ERR
   registry::_KeyExists /NOUNLOAD `${_PATH}`
   Pop ${_ERR}
!macroend


!define registry::Read `!insertmacro registry::Read`

!macro registry::Read _PATH _VALUE _STRING _TYPE
   registry::_Read /NOUNLOAD `${_PATH}` `${_VALUE}`
   Pop ${_STRING}
   Pop ${_TYPE}
!macroend


!define registry::Write `!insertmacro registry::Write`

!macro registry::Write _PATH _VALUE _STRING _TYPE _ERR
   registry::_Write /NOUNLOAD `${_PATH}` `${_VALUE}` `${_STRING}` `${_TYPE}`
   Pop ${_ERR}
!macroend


!define registry::ReadExtra `!insertmacro registry::ReadExtra`

!macro registry::ReadExtra _PATH _VALUE _NUMBER _STRING _TYPE
   registry::_ReadExtra /NOUNLOAD `${_PATH}` `${_VALUE}` `${_NUMBER}`
   Pop ${_STRING}
   Pop ${_TYPE}
!macroend


!define registry::WriteExtra `!insertmacro registry::WriteExtra`

!macro registry::WriteExtra _PATH _VALUE _STRING _ERR
   registry::_WriteExtra /NOUNLOAD `${_PATH}` `${_VALUE}` `${_STRING}`
   Pop ${_ERR}
!macroend


!define registry::CreateKey `!insertmacro registry::CreateKey`

!macro registry::CreateKey _PATH _ERR
   registry::_CreateKey /NOUNLOAD `${_PATH}`
   Pop ${_ERR}
!macroend


!define registry::DeleteValue `!insertmacro registry::DeleteValue`

!macro registry::DeleteValue _PATH _VALUE _ERR
   registry::_DeleteValue /NOUNLOAD `${_PATH}` `${_VALUE}`
   Pop ${_ERR}
!macroend


!define registry::DeleteKey `!insertmacro registry::DeleteKey`

!macro registry::DeleteKey _PATH _ERR
   registry::_DeleteKey /NOUNLOAD `${_PATH}`
   Pop ${_ERR}
!macroend


!define registry::DeleteKeyEmpty `!insertmacro registry::DeleteKeyEmpty`

!macro registry::DeleteKeyEmpty _PATH _ERR
   registry::_DeleteKeyEmpty /NOUNLOAD `${_PATH}`
   Pop ${_ERR}
!macroend


!define registry::CopyValue `!insertmacro registry::CopyValue`

!macro registry::CopyValue _PATH_SOURCE _VALUE_SOURCE _PATH_TARGET _VALUE_TARGET _ERR
   registry::_CopyValue /NOUNLOAD `${_PATH_SOURCE}` `${_VALUE_SOURCE}` `${_PATH_TARGET}` `${_VALUE_TARGET}`
   Pop ${_ERR}
!macroend


!define registry::MoveValue `!insertmacro registry::MoveValue`

!macro registry::MoveValue _PATH_SOURCE _VALUE_SOURCE _PATH_TARGET _VALUE_TARGET _ERR
   registry::_MoveValue /NOUNLOAD `${_PATH_SOURCE}` `${_VALUE_SOURCE}` `${_PATH_TARGET}` `${_VALUE_TARGET}`
   Pop ${_ERR}
!macroend


!define registry::CopyKey `!insertmacro registry::CopyKey`

!macro registry::CopyKey _PATH_SOURCE _PATH_TARGET _ERR
   registry::_CopyKey /NOUNLOAD `${_PATH_SOURCE}` `${_PATH_TARGET}`
   Pop ${_ERR}
!macroend


!define registry::MoveKey `!insertmacro registry::MoveKey`

!macro registry::MoveKey _PATH_SOURCE _PATH_TARGET _ERR
   registry::_MoveKey /NOUNLOAD `${_PATH_SOURCE}` `${_PATH_TARGET}`
   Pop ${_ERR}
!macroend


!define registry::SaveKey `!insertmacro registry::SaveKey`

!macro registry::SaveKey _PATH _FILE _OPTIONS _ERR
   registry::_SaveKey /NOUNLOAD `${_PATH}` `${_FILE}` `${_OPTIONS}`
   Pop ${_ERR}
!macroend


!define registry::RestoreKey `!insertmacro registry::RestoreKey`

!macro registry::RestoreKey _FILE _ERR
   registry::_RestoreKey /NOUNLOAD `${_FILE}`
   Pop ${_ERR}
!macroend


!define registry::StrToHex `!insertmacro registry::StrToHexA`
!define registry::StrToHexA `!insertmacro registry::StrToHexA`

!macro registry::StrToHexA _STRING _HEX_STRING
   registry::_StrToHexA /NOUNLOAD `${_STRING}`
   Pop ${_HEX_STRING}
!macroend


!define registry::StrToHexW `!insertmacro registry::StrToHexW`

!macro registry::StrToHexW _STRING _HEX_STRING
   registry::_StrToHexW /NOUNLOAD `${_STRING}`
   Pop ${_HEX_STRING}
!macroend


!define registry::HexToStr `!insertmacro registry::HexToStrA`
!define registry::HexToStrA `!insertmacro registry::HexToStrA`

!macro registry::HexToStrA _HEX_STRING _STRING
   registry::_HexToStrA /NOUNLOAD `${_HEX_STRING}`
   Pop ${_STRING}
!macroend

!define registry::HexToStrW `!insertmacro registry::HexToStrW`

!macro registry::HexToStrW _HEX_STRING _STRING
   registry::_HexToStrW /NOUNLOAD `${_HEX_STRING}`
   Pop ${_STRING}
!macroend


!define registry::Unload `!insertmacro registry::Unload`

!macro registry::Unload
   registry::_Unload
!macroend


!endif
