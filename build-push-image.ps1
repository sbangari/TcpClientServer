# $tag = ":test"
$tag = ":latest"
# $tag = ":stable"
# $tag = ":WD2022"
# $tag = ":WS2022"
# $tag = ""
go build -o .\bins\client.exe .\client\
go build -o .\bins\server.exe .\server\
docker build -t tcp-client-server$tag .
docker tag tcp-client-server$tag princepereira/tcp-client-server$tag
docker push princepereira/tcp-client-server$tag
docker rmi -f (docker images --filter "dangling=true" -q)
Write-Host "Dangling images deleted ..."