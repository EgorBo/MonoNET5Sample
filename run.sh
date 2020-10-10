TARGET_OS=linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    TARGET_OS=osx
fi

# can be arm64
TARGET_ARCH=x64

# avoid gc safepoints
export MONO_THREADS_SUSPEND="preemptive"

# show asm for Test method
export MONO_VERBOSE_METHOD="Test"

# enable LLVM-JIT mode + fast-math
export MONO_ENV_OPTIONS="--llvm --ffast-math"

# assumes .NET 5-rc1 is installed
# or you can use `dotnet.sh` from a dotnet/runtime repo:
# ~/runtime/./dotnet.sh
dotnet run -c Release -r $TARGET_OS-$TARGET_ARCH
