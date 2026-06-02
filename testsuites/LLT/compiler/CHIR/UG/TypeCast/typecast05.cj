// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %disInst %f %dumpCHIRDebug -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows) ASSERT: regex Class-_CN7default2CBIG_E<Int64>& = TransformToConcrete\(%[0-9]+, Class-_CN7default2CBIG_E<Int64>&\)

open class CA<T> {
    var abc: T
    init(y: T) {
        abc = y
    }
}

open class CB<T> {
    var abc: T
    init(y: T) {
        abc = y
    }
}

class A<T, U> where T <: CB<Int64>, U <: CA<Int64> {
    var ddd: T
    init(y: T) {
        ddd = y
    }
}

struct SA<T, U> where T <: CB<Int64>, U <: CA<Int64> {
    var x: A<T, U>
    init(y: A<T, U>) {
        x = y
    }
    func fff() {
        x.ddd.abc
    }
}

main() {
    0
}
