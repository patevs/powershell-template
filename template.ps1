<#
.SYNOPSIS
  <Overview of script>

.DESCRIPTION
  <Brief description of script>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.1
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development

.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

# ------------------------------ [Initialisations] ------------------------------ #

# Get command line arguments.
# https://stackoverflow.com/a/5592684/6346131
# https://www.red-gate.com/simple-talk/sysadmin/powershell/how-to-use-parameters-in-powershell/
$param1 = $args[0]

# Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

# Dot Source required Function Libraries
. "C:\Scripts\Functions\Logging_Functions.ps1"

# -------------------------------- [Declarations] ------------------------------- #

# Script Version
$sScriptVersion = "1.1"

# Log File Info
$sLogPath = "C:\Windows\Temp"
$sLogName = "<script_name>.log"
$sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName

# --------------------------------- [Functions] --------------------------------- #

Function Function-Name{
  Param()

  Begin{
    Log-Write -LogPath $sLogFile -LineValue "<description of what is going on>..."
  }

  Process{
    Try{
      <code goes here>
    }

    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }

  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}

# --------------------------------- [Execution] --------------------------------- #

Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion

# Script Execution goes here
# ...

Log-Finish -LogPath $sLogFile

# ------------------------------------ [END] ------------------------------------ #
