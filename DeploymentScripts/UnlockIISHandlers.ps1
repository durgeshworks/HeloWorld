$assembly = [System.Reflection.Assembly]::LoadFrom("$env:systemroot\system32\inetsrv\Microsoft.Web.Administration.dll")

# helper function to unlock sectiongroups
function unlockSectionGroup($group)
{
    foreach ($subGroup in $group.SectionGroups)
    {
        unlockSectionGroup($subGroup)
    }
    foreach ($section in $group.Sections)
    {
        $section.OverrideModeDefault = "Allow"
    }
}

# initial work
# load ServerManager
$mgr = new-object Microsoft.Web.Administration.ServerManager
# load appHost config
$conf = $mgr.GetApplicationHostConfiguration()

# unlock all sections in system.webServer
unlockSectionGroup(
     $conf.RootSectionGroup.SectionGroups["system.webServer"])
     