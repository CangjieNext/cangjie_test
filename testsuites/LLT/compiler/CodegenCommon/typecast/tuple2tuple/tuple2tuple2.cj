// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

open class classA {
    protected open func func789() {
        13
    }
}

class cassB <: classA {
    public override func func789() {
        12
    }
}

main() {
    var zz = cassB()
    var x = match ((12, zz)) {
        case newVar: (Int64, classA) => Some(newVar)
        case newVar1: (Int64, Int64) => return 2
        case _ => return 1
    }
    var y = (x ?? (12, cassB()))[1]
    if (y.func789() == 12) {
        return 0
    }
    return 1
    0
}
