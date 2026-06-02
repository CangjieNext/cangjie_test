// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: CFunc1.cj
// EXEC: %compiler %cmp_opt_chir2hlir CFunc1.cj %compile_lib_opt -o define.%middle
// EXEC: %compiler %cmp_opt_chir2hlir define.%middle %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: regex here from imported A
// ASSERT: regex here from imported lambdaA

// ASSERT: regex here from imported B
// ASSERT: regex here from imported lambdaB

// ASSERT: regex here from imported C
// ASSERT: regex here from imported lambdaC

// ASSERT: regex here from AA
// ASSERT: regex here from BB


// ASSERT: regex here from AA
// ASSERT: regex here from lambdaAA

// ASSERT: regex here from BB
// ASSERT: regex here from lambdaBB

// ASSERT: regex here from CC
// ASSERT: regex here from lambdaCC

// ASSERT: regex here from AA
// ASSERT: regex here from BB

package test

internal import a.*

foreign func free(ptr: CPointer<UInt8>): Unit

@C
public func AA(){
    print("here from AA")
}


public var lambdaAA: CFunc<()->Unit> = { =>
    print("here from lambdaAA")
}

@C
public func BB(a: CPointer<UInt8>): CPointer<UInt8>{
    print("here from BB")
    a
}

public var lambdaBB: CFunc<(CPointer<UInt8>)->CPointer<UInt8>> = { a: CPointer<UInt8> =>
    print("here from lambdaBB")
    a
}

@C
public func CC(a: CString): CString{
    print("here from CC")
    a
}

public var lambdaCC: CFunc<(CString)->CString> = { a: CString =>
    print("here from lambdaCC")
    a
}


main(): Int64 {
    unsafe {
        A()
    }
    unsafe {
        lambdaA()
    }

    var a = CPointer<UInt8>()
    unsafe {
        B(a)
    }
    unsafe {
        lambdaB(a)
    }
    var cstr = unsafe {LibC.mallocCString("abcd")}
    unsafe {
        C(cstr)
    }
    unsafe {
        lambdaC(cstr)
    }

    unsafe {
        AA()
    }
    unsafe {
        lambdaAA()
    }

    var aa = CPointer<UInt8>()
    unsafe {
        BB(aa)
    }
    unsafe {
        lambdaBB(aa)
    }
    unsafe {
        CC(cstr)
    }
    unsafe {
        lambdaCC(cstr)
        LibC.free(cstr)
    }
    0
}
