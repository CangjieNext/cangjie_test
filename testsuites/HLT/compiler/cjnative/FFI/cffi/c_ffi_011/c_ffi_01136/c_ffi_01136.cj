/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
struct MyRecord {
    public MyRecord(var n: Int64, var m: Int64, var k: Int64) {}
}

foreign func AllocCStruct(): MyRecord

foreign func GetMaxFuncPtr(): CFunc<(MyRecord) -> (MyRecord)>

var count = 0

func FuncFromC(): Int64 {
    var a = unsafe { GetMaxFuncPtr() }
    var tmp = unsafe { AllocCStruct() }
    tmp.n = 1
    var b = unsafe { a(tmp) }
    var res = unsafe { b.n }
    if (res == 2) {
        count += 1
    }
    return 0
}

main(): Int64 {
    FuncFromC()
    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
