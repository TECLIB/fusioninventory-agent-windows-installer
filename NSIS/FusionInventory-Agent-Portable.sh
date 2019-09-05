#!/bin/bash
# ------------------------------------------------------------------------
# FusionInventory Agent Installer for Microsoft Windows
# Copyright (C) 2010-2019 by the FusionInventory Development Team.
#
# http://www.fusioninventory.org/
# ------------------------------------------------------------------------
#
# LICENSE
#
# This file is part of FusionInventory project.
#
# FusionInventory Agent Installer for Microsoft Windows is free software;
# you can redistribute it and/or modify it under the terms of the GNU
# General Public License as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.
#
#
# FusionInventory Agent Installer for Microsoft Windows is distributed in
# the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
# the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
# or see <http://www.gnu.org/licenses/>.
#
# ------------------------------------------------------------------------
#
# @package   FusionInventory Agent Installer for Microsoft Windows
# @file      .\NSIS\FusionInventory-Agent-Portable.sh
# @author    Tomas Abad <tabadgp@gmail.com>
#            Guillaume Bougard <gbougard at teclib.com>
# @copyright Copyright (c) 2010-2019 FusionInventory Team
# @license   GNU GPL version 2 or (at your option) any later version
#            http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
# @link      http://www.fusioninventory.org/
# @link      https://github.com/fusioninventory/fusioninventory-agent
# @since     2012
#
# ------------------------------------------------------------------------

# Load perl environment
source ../Perl/Scripts/load-perl-environment

declare -r installer="$1"

declare arch=''
declare digest=''
declare basename=''
declare -a -r digests=(md5 sha1 sha256)

declare -r openssl=$(type -P openssl)

# Check the OS
if [ "${MSYSTEM}" = "MSYS" ]; then
   # Windows OS with MinGW/MSYS

   basename="${0##*\\}"
else
   if [ -n "${WINDIR}" ]; then
      # It's a Windows OS

      basename="${0##*\\}"

      echo
      echo -n "You can not launch '${basename}' directly. "
      echo "Please, launch '${basename%.sh}.bat' instead."
      echo

      exit 1
   fi

   # It's a UNIX OS.

   basename="${0##*/}"
fi

if [ -z "$installer" -o ! -e "$installer" ]; then
   basename="${0##*\\}"

   echo
   echo -n "You can not launch '${basename}' directly without an installer as argument. "
   echo "Please, launch '${basename%.sh}.bat' instead."
   echo

   exit 2
fi

if [ ! -d "Portable/FusionInventory-Agent" ]; then
   basename="${0##*\\}"

   echo
   echo "Agent not installed at the expected place"
   echo
   echo "Please, launch '${basename%.sh}.bat' only after installers has been built."
   echo

   exit 3
fi

# All seems be correct...

# Extract arch from installer name
arch=${installer##*windows-}
arch=${arch%_*}

# Build installer related portable archive
echo -n "Building ${arch} portable archive..."

# Add data dir
/bin/install --directory "Portable/FusionInventory-Agent/data"

# Unset and comment not used logfile path in portable.cfg
/bin/sed -i -e "s|^logfile.*$|#logfile =|" "Portable/FusionInventory-Agent/etc/conf.d/portable.cfg"

( cd Portable ; 7z a -bd -sfx7z.sfx -stl -y "../${installer%.exe}-portable.exe" "FusionInventory-Agent" >../7z-${arch}-portable.txt 2>&1; )
if (( $? == 0 )); then
   echo '.Done!'

   # Digest calculation loop
   echo -n "Calculating digest message for ${arch} portable archive."
   for digest in "${digests[@]}"; do
      "${openssl}" dgst -${digest} -c -out "${installer%.exe}-portable.${digest}" "${installer%.exe}-portable.exe"
      echo -n "."
   done
   echo ".Done!"
else
   echo '.Failure!'
   echo " Failed to build ${arch} portable agent archive."
fi

/bin/rm -rf "Portable" > /dev/null 2>&1

echo
