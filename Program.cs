using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello World!");
        Console.WriteLine(Test());
    }

    [MethodImpl(MethodImplOptions.NoInlining)]
    static int Test()
    {
        return Sse2.Subtract( // LLVM is able to fold constant vectors :p
                        Vector128<int>.Zero, 
                        Vector128.CreateScalar(42))
                   .ToScalar();
    }
}