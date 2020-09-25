# MonoNET5Sample

Just some hacky way to try Mono runtime bits with LLVM for a simple `net5.0` console application.

```
./run.sh
```
should download a runtime-pack with mono and use that as a "dotnet publish" source.

Expected output:
```
*** ASM for Program:Test () ***
(__TEXT,__text) section
gram_Test___:
0000000000000000	movl	$0xffffffd6, %eax
0000000000000005	retq
***

-42
```
for
```csharp
static int Test()
{
    return Sse2.Subtract( // LLVM is able to fold constant vectors :p
        Vector128<int>.Zero, 
        Vector128.CreateScalar(42))
        .ToScalar();
}
```

(MONO_VERBOSE_METHOD=Test)
