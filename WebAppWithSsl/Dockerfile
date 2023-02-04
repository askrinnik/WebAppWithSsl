#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
RUN dotnet dev-certs https
WORKDIR /src
COPY ["WebAppWithSsl/WebAppWithSsl.csproj", "WebAppWithSsl/"]
RUN dotnet restore "WebAppWithSsl/WebAppWithSsl.csproj"
COPY . .
WORKDIR "/src/WebAppWithSsl"
RUN dotnet build "WebAppWithSsl.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebAppWithSsl.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

COPY --from=build /root/.dotnet/corefx/cryptography/x509stores/my/* /root/.dotnet/corefx/cryptography/x509stores/my/

ENTRYPOINT ["dotnet", "WebAppWithSsl.dll"]