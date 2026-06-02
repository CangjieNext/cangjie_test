// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

open class interface1 {
    protected open func func789(): Int64 {
        2
    }
}

class cassB <: interface1 {
    public override func func789() {
        12
    }
}

main() {
    var x: (Int64, cassB) = (12, cassB())
    var ddd: (Int64, interface1) = x
    if (ddd[1].func789() == 12) {
        return 0
    }
    return 1
}
