// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

public interface IB {
    prop a: Int64
}

class A <: IB {
    var b = 1
    public prop a: Int64 {
        get() {
            return b
        }
    }
}

main() {
    return A().a
}
