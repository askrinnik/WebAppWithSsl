docker run ^
--name=WebAppWithSsl_3 ^
--publish 32770:80 ^
--publish 32771:443 ^
--env=ASPNETCORE_URLS=https://+:443;http://+:80 ^
ghcr.io/askrinnik/web-app-with-ssl

pause