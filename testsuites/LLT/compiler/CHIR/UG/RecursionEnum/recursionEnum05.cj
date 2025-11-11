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
    A | B(Bool, S, () -> Bool)
}

struct S {
    var x: E = E.A
    var y = "good!!!"
}

func goo() {
    true
}

main() {
    var a = E.B(true, S(), goo)
    match (a) {
        case A => println(100)
        case B(s, x, y) =>
            if (x.y == "good!!!") {
                return 0
            }
    }
    return 1
}

// ASSERT: regex-begin %\d+: Tuple<UInt32,Bool,Box<Struct-_CN7default1SE>&,Class-\$Cg0_<Bool>&> = TypeCast\(%\d+, Tuple<UInt32,Bool,Box<Struct-_CN7default1SE>&,Class-\$Cg0_<Bool>&>\)
// ASSERT: regex-next %\d+: Bool = Field\(%\d+, 1\)
// ASSERT: regex-next %\d+: Box<Struct-_CN7default1SE>& = Field\(%\d+, 2\)
