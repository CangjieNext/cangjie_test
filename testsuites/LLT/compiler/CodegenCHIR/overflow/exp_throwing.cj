// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %n.cj %disableReflection --int-overflow=throwing -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %n.%suffix

func tryf_exp(x: Int64, y: UInt64): Int64 {
    try {
        return x ** y
    } catch (e: OverflowException) {
        return 1
    }
}

main() {
    var res = -2
    res += tryf_exp(2, 65)
    res += tryf_exp(-3, 65)
    return res
}
