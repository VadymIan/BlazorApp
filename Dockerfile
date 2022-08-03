FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

COPY *.sln ./
COPY BlazorApp1/*.csproj BlazorApp1/
COPY TestProject/*.csproj TestProject/

RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app

RUN apt-get update && \
	apt-get install -y procps && rm -rf /var/lib/apt/lists/* \
	apt-get install curl \
	apt-get install net-tools

COPY --from=build-env /app/out .

EXPOSE 7020

ENV ASPNETCORE_ENVIRONMENT Development
ENV ASPNETCORE_URLS http://*:7020

ENTRYPOINT ["dotnet", "BlazorApp1.dll"]