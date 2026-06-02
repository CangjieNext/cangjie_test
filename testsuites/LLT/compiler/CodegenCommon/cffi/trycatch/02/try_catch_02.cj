// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./fn_02.cpp
// (CJNATIVE) EXEC: gcc fn_02.cpp -c -fPIC
// (CJNATIVE) EXEC: %compiler %cmp_opt fn_02.o %cffi_std_link %f -o %output
// (CJNATIVE) EXEC-PIPE: %run %output | compare %f
// (not CJNATIVE) EXEC: g++ fn_02.cpp -shared -fPIC -o libfn_02.so
// (not CJNATIVE) EXEC: %compiler %cmp_opt -l fn_02 %f -o %output
// (not CJNATIVE) EXEC-PIPE: %run %output | compare %f
// ASSERT: scan-begin param: 64
// ASSERT: scan-next Exception info: Exception: CJFuncCalledByC

foreign func CFuncInCJ(fn: CFunc<(Int64) -> Unit>, arg: Int64): Unit

@C
func CJFuncCalledByC(param: Int64): Unit {
    println("param: ${param}")
    throw Exception("CJFuncCalledByC")
}

public func WrapperOfUser(fn: CFunc<(Int64) -> Unit>, arg: Int64): Unit {
    try {
        unsafe { CFuncInCJ(fn, arg) }
    } catch (e: Exception) {
        println("Exception info: ${e}")
    }
}

main() {
    WrapperOfUser(CJFuncCalledByC, 64)
    0
}
