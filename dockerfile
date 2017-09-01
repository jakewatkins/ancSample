#
#
#
#
#

# stage 1 - build the solution
FROM jakewatkins/ancbuildenv AS builder

WORKDIR /source

# Pull source code from Git repository
RUN git clone http://jakewatkins/ancSample

# restore the solution's packages
RUN dotnet restore 

#build the solution
RUN dotnet publish --output /app/ --configuration Release

# stage 2 - build the container image
