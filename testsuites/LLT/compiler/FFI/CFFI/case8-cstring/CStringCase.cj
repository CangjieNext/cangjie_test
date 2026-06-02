// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: GetPtr.cpp
// EXEC: %clang %clang_shared_opt GetPtr.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan 2121
// ASSERT: scan 1212
// ASSERT: scan 1111
// ASSERT: scan 999
// ASSERT: scan 6
// ASSERT: scan 1898
// ASSERT: scan 9988
// ASSERT: scan get from CJ string: Hello World
// ASSERT: scan 8899
// ASSERT: regex falsetrue
// ASSERT: scan 1 2 3 4 5 6
/* ASSERT: scan -1 2 -3 4 1 6.000000 */
// -1 2 -3 4 1 0.000000



@CallingConv[CDECL]
foreign func PassCStringToC(str: CString): CString

foreign func printf(fmt: CString, ...) : Int32

unsafe main():Int64 {
    var a: CString = LibC.mallocCString("Hello ")
    var b: CString = LibC.mallocCString("World\n")
    var str: CString = LibC.mallocCString("Hello World\n")

    var ptr = a.getChars()
    print(ptr.toUIntNative().toString())
    LibC.free(a)
    var aa: CString = LibC.mallocCString("Hello ")
    var bb: CString = LibC.mallocCString("Hello ")

    let swR = aa.startsWith(bb)
    if (swR) {
        print(2121.toString())
    }

    var ewR = aa.endsWith(bb)
    if (ewR) {
        print(1212.toString())
    }

    var el = aa.equals(bb)
    if (el) {
        print(1111.toString())
    }

    var elR = aa.equalsLower(bb)
    if (elR) {
        print(999.toString())
    }
    print(aa.size().toString())


    var scR1 = aa.subCString(0)
    var scR2 = aa.subCString(0, 6)

    let scR1el = aa.equals(scR1)
    let scR2el = aa.equals(scR2)
    let scR3el = scR1.equals(scR2)
    if (scR1el && scR2el && scR3el) {
        print(1898.toString())
    }
    LibC.free(scR1)
    LibC.free(scR2)
    var cR = aa.compare(bb)
    if (cR == 0) {
        print(9988.toString())
    }

    let resFromC: CString = unsafe{ PassCStringToC(str) }
    var cRC = str.compare(resFromC)
    if (cRC == 0) {
        print(8899.toString())
    }

    print(str.isEmpty().toString())
    LibC.free(str)
    str = CString(CPointer<UInt8>())
    print(str.isEmpty().toString())

    var s = LibC.mallocCString("%d %d %d %d %d %d\n")
    unsafe{ printf(s, 1, 2, 3, 4, 5, 6) }
    LibC.free(s)
    s = CString(CPointer<UInt8>())

    LibC.free(b)
    b = CString(CPointer<UInt8>())
    LibC.free(aa)
    aa = CString(CPointer<UInt8>())
    LibC.free(bb)
    bb = CString(CPointer<UInt8>())

    var i8 : Int8 = -1
    var ui8 : UInt8 = 2
    var i16 : Int16 = -3
    var ui16 : UInt16 = 4
    var bool : Bool = true
    var f32 : Float32 = 6.00
    var ss = LibC.mallocCString("%d %d %d %d %d %f \n")
    unsafe{ printf(ss, i8, ui8, i16, ui16, bool, f32) }
    LibC.free(ss)
    ss = CString(CPointer<UInt8>())

    return 0
}
