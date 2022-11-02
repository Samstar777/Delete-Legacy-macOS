#!/bin/bash
#
# Created By: Salim Ukani
# Date: Feb 15, 2022.
# Description: Script to seacrh and delete the specified macOS installers.
#
# List of legacy macOS installers to be removed (Add/Remove if necessary)
macOSLegacyInstallers=(
	/Applications/Install\ macOS\ High\ Sierra.app
	/Applications/Install\ macOS\ Mojave.app
    /Applications/Install\ macOS\ Catalina.app
    /Applications/Install\ macOS\ Big\ Sur.app
)

# Function to delete
function deleteItems()
{
	declare -a toDelete=("${!1}")

	for item in "${toDelete[@]}"
		do
			if [[ ! -z "${2}" ]]
				then
					item=("${2}""${item}")
			fi

			echo "Looking for $item"

			if [ -e "${item}" ]
				then
					echo "Legacy macOS installer Found: Removing $item"
					rm -rf "${item}"
			fi
		done
}


# Delete legacy installers
deleteItems macOSLegacyInstallers[@]

exit 0