using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;

public class Program
{
    private static void Main()
    {
        bool isMono = typeof(object).Assembly.GetType("Mono.RuntimeStructs") != null;
        Console.WriteLine($"Hello World {(isMono ? "from Mono!" : "from CoreCLR!")}");

        Console.WriteLine(Test());
    }

    [MethodImpl(MethodImplOptions.NoInlining)]
    private static int Test()
    {
        return Sse2.Subtract( // LLVM is able to fold constant vectors :p
                        Vector128<int>.Zero, 
                        Vector128.CreateScalar(42))
                   .ToScalar();
    }
}