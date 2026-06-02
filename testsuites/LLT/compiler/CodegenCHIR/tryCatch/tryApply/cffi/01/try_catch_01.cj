// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./fn_01.cpp
// (CJNATIVE) EXEC: gcc fn_01.cpp -c -fPIC
// (CJNATIVE) EXEC: %compiler %cmp_opt fn_01.o %cffi_std_link %f -o %output
// (CJNATIVE) EXEC-PIPE: %run %output | compare %f
// (not CJNATIVE) EXEC: g++ fn_01.cpp -shared -fPIC -o libfn_01.so
// (not CJNATIVE) EXEC: %compiler %cmp_opt -l fn_01 %f -o %output
// (not CJNATIVE) EXEC-PIPE: %run %output | compare %f
// ASSERT: scan-begin 32
// ASSERT: scan-next Exception info: Exception: CJFuncCalledByC

foreign func CFuncInCJ(fn: CFunc<(Int64) -> CPointer<Int64>>, arg: Int64): CPointer<Int64>

@C
func CJFuncCalledByC(param: Int64): CPointer<Int64> {
    println(param)
    throw Exception("CJFuncCalledByC")
    return CPointer<Int64>()
}

public func WrapperOfUser(fn: CFunc<(Int64) -> CPointer<Int64>>, arg: Int64): CPointer<Int64> {
    var ret = CPointer<Int64>()
    try {
        ret = unsafe { CFuncInCJ(fn, arg) }
    } catch (e: Exception) {
        println("Exception info: ${e}")
    }
    return ret
}

main() {
    WrapperOfUser(CJFuncCalledByC, 32)
    0
}
