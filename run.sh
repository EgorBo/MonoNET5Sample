# assumes .NET 5-rc1 is installed
dotnet publish -c Release

# show LLVM IR + asm for Test method

MONO_THREADS_SUSPEND="preemptive" \
MONO_VERBOSE_METHOD="Test" \
MONO_ENV_OPTIONS="--llvm --ffast-math" \
bin/Release/net5.0/osx-x64/publish/Program
