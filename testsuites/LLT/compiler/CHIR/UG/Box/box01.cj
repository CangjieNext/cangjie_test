// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: regex Class-_CN7default1IE& = Box\(%[0-9]+, Class-_CN7default1IE&\)
// (not Windows and DEBUG_OPTION) ASSERT: regex Struct-_CN7default1SE = UnBox\(%[0-9]+, Struct-_CN7default1SE\)

// struct -> I
interface I {
    func foo() {}
}

struct S <: I {
    var a: Int64
    init(x: Int64) {
        a = x
    }
}

func foo() {
    let x: I = S(2) // box

    match (x) {
        case v: S => v.a // unbox
        case _ => S(1).a
    }
    return 0
}

main() {
    foo()
    0
}
