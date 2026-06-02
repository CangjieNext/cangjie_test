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
struct teststruct1 {
    public var i8: Int8
    public var ui8: UInt8

    @CallingConv[CDECL]
    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

struct teststruct2 {
    public var i8: Int8
    public var ui8: UInt8

    @CallingConv[CDECL]
    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

class TESTCLASS {
    public var i8: Int8
    public var ui8: UInt8

    @CallingConv[CDECL]
    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

interface I {
    @CallingConv[CDECL]
    @C
    func test1(): Unit {}
}

main() {}
// ASSERT: scan sema_illegal_scope_use_of_annotation
