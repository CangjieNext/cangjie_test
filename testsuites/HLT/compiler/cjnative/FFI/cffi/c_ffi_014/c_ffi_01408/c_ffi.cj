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
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

@C
struct teststructtmp {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

@CallingConv[C]
@C
func cstruct(a: teststructtmp): teststructtmp {
    var b: teststructtmp = a
    b.i8 = 10
    return b
}

@CallingConv[1]
foreign func get_cstruct(cb: CFunc<(teststructtmp) -> teststructtmp>): teststructtmp

@CallingConv[abc]
foreign func printf(fmt: CString): Int32

unsafe main(): Int64 {
    var res: teststructtmp = get_cstruct(cstruct)

    if ((res.i8 == 10) && (res.ui8 == 0)) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_annotation_calling_conv_not_support
// ASSERT: scan sema_annotation_invalid_args_type
