// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: regex Class-_CN7default2SAIG_E<Int64>& = TransformToConcrete\(%[0-9]+, Class-_CN7default2SAIG_E<Int64>&\)

// Class<T> -> T   no box
func foo<T>(x: T): Int64 {
    match (x) {
        case v: SA<Int64> => v.a // no unbox
        case _ => SA<Int64>(1).a
    }
    1
}

class SA<T> {
    var a: T
    init(y: T) {
        a = y
    }
}

func test1() {
    var r1 = foo<SA<Int64>>(SA<Int64>(1))
    if (r1 != 1) {
        return 1
    }
    return 0
}

main() {
    0
}
