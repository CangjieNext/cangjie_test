// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: ToString {
    public func toString(): String {
        return "A"
    }
}

main() {
    let a = try {
        A()
    } catch (_) {
        true
    } finally {
    }
    if (a.toString() == "A") {
        return 0
    }
    return 1
}
