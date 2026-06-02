// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_BoxRecursionEnum.chir | compare %f

enum E {
    A | B(S, Bool)
}

struct S {
    var x: E = E.A
}

func foo(e: E) {
    match (e) {
        case A => println(100)
        case B(s, x) => println(200)
    }
    return 0
}

main() {
    foo(E.B(S(), true))
    return 0
}

// ASSERT: regex-begin %\d+: Tuple<UInt32,Box<Struct-_CN7default1SE>&,Bool> = TypeCast\(%\d+, Tuple<UInt32,Box<Struct-_CN7default1SE>&,Bool>\)
// ASSERT: regex-next %\d+: Box<Struct-_CN7default1SE>& = Field\(%\d+, 1\)
