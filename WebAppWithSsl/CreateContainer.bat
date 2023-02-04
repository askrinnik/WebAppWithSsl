docker run ^
--name=WebAppWithSsl_1 ^
--publish 32770:80 ^
--publish 32771:443 ^
--volume=%USERPROFILE%\AppData\Roaming\Microsoft\UserSecrets:/root/.microsoft/usersecrets:ro ^
--volume=%USERPROFILE%\AppData\Roaming\ASP.NET\Https:/root/.aspnet/https:ro ^
--env=ASPNETCORE_URLS=https://+:443;http://+:80 ^
--env=ASPNETCORE_ENVIRONMENT=Development ^
ghcr.io/askrinnik/web-app-with-ssl

pause