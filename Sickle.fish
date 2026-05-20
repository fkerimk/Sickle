#!/usr/bin/env fish

# Check arguments
if contains update $argv; set update true; end

# Obtain repositories
not test -d Heart; and git clone git@github.com:fkerimk/Sickle-Heart.git Heart
not test -d Mapper; and git clone git@github.com:fkerimk/Sickle-Mapper.git Mapper

# Update repositories
test $update; and echo "Updating Heart..."; and git -C Heart pull
test $update; and echo "Updating Mapper..."; and git -C Mapper pull
test $update; and exit

# Run mapper
dotnet run -v:q --project Mapper/Sickle-Mapper.csproj