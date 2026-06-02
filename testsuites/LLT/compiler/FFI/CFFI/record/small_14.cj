// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %enableO2 %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan -128, 0


@C
struct Small {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

@CallingConv[CDECL]
@C
func Callback(a: Small): Small {
    var b: Small = a
    b.i8 = -128
    return b
}

@CallingConv[CDECL]
foreign func GetCStruct(cb: CFunc<(Small) -> Small>): Small

unsafe main():Int64 {
    var res: Small = GetCStruct(Callback)

    println("${res.i8}, ${res.ui8}")
    if ( (res.i8 == -128) && (res.ui8 == 0) ) {
        return 0
    } else {
        return 1
    }
}
