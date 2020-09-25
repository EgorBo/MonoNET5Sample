using System;
using System.Runtime.CompilerServices;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello World!");
        Console.WriteLine(Test(2,4,6));
    }

    [MethodImpl(MethodImplOptions.NoInlining)]
    static float Test(float a, float b, float c) => a * b + c; // fmadd
}