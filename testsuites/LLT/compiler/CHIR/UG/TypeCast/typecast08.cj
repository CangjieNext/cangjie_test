// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix
// (DEBUG_OPTION)RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: regex Class-_CN7default2I3E& = TypeCast\(%[0-9]+, Class-_CN7default2I3E&\)

class CA<T> {
    var x: T
    init(_x: T) {
        x = _x
    }
}

class I1 {
    public let field: Int64 = 6
    func foo(): Int64 {
        0
    }
}

interface I3 {
    func goo(): I1
}

extend<T> CA<T> <: I3 where T <: I1 {
    public func goo(): I1 {
        x.field
        I1()
    }
}

main() {
    var k: I3 = CA<I1>(I1())
    k.goo()
    0
}
