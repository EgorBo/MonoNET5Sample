# MonoNET5Sample

A simple `net5.0` console app with mono-LLVM as a runtime.

**IMPORTANT: it's not an official way to enable Mono runtime for any `net5.0` app. It's just a simple playground to test LLVM back-end**

```
./run.sh
```

Expected output:
```asm
; *** ASM for Program:Test () ***
0000000000000000	movl	-42, %eax  ;; return -42;
0000000000000005	retq
```
^ codegen for:
```csharp
static int Test()
{
    return Sse2.Subtract( // LLVM is able to fold constant vectors :p
                   Vector128<int>.Zero, 
                   Vector128.CreateScalar(42))
               .ToScalar();
}
```

`MONO_VERBOSE_METHOD=Test`
