If($args.count -eq 1){
    $resp = Test-NetConnection -ComputerName localhost -Port 3306
    Clear-Host
    If($resp.TcpTestSucceeded){
        $Env:PATH += ";C:\Program Files\Git\mingw64\bin"
        node .\genCredentials.js $args[0]
    }
    Else{
        Write-Host "You forgot to Start MySQL service" -ForegroundColor Red
    }
}
Else {
    Write-Host "You forgot to pass SDP ID" -ForegroundColor Red
}


