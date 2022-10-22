$resp = Test-NetConnection -ComputerName localhost -Port 3306
Clear-Host
If($resp.TcpTestSucceeded){
    $Env:PATH += ";C:\Program Files\Git\mingw64\bin"
    npm run dev
}
Else{
    Write-Host "You forgot to Start MySQL service" -ForegroundColor Red
}