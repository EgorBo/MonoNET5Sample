TARGET_OS=linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    TARGET_OS=osx
fi

TARGET_ARCH=x64
TARGET_CONFIG=Release

# assumes .NET 5-rc1 is installed
# or you can use `dotnet.sh` from a dotnet/runtime repo:
# ~/runtime/./dotnet.sh
dotnet publish -c $TARGET_CONFIG -r $TARGET_OS-$TARGET_ARCH

# show LLVM IR + asm for Test method (and run actual Program)
#   preemptive -- because we don't want to see gc safepoints in the asm
#   --llvm stands for LLVM-JIT mode (you can also try --interpreter here)
MONO_THREADS_SUSPEND="preemptive" \
MONO_VERBOSE_METHOD="Test" \
MONO_ENV_OPTIONS="--llvm --ffast-math" \
bin/Release/net5.0/$TARGET_OS-$TARGET_ARCH/publish/Program

# TODO: LLVM-AOT usage
