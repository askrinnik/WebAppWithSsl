docker run ^
--name=WebAppWithSsl_2 ^
--publish 32770:80 ^
--publish 32771:443 ^
--env Kestrel__Certificates__Development__Password=9ba2de68-55d7-4b61-b6c8-be06f10aa81f ^
--env=ASPNETCORE_URLS=https://+:443;http://+:80 ^
--env=ASPNETCORE_ENVIRONMENT=Development ^
ghcr.io/askrinnik/web-app-with-ssl

pause