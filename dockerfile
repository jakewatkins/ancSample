#
#
#
#
#

# stage 1 - build the solution
FROM jakewatkins/ancbuildenv AS builder

WORKDIR /source

# Pull source code from Git repository
RUN git clone https://github.com/jakewatkins/ancSample.git /source

# restore the solution's packages
RUN dotnet restore 

#build the solution
RUN dotnet publish --output /app/ --configuration Release

# stage 2 - build the container image
FROM microsoft/aspnetcore:1.1.2

WORKDIR /app

COPY --from=builder /app .

EXPOSE 80/tcp

# Set the image entry point
ENTRYPOINT ["dotnet", "/app/ancSample.dll"] 
