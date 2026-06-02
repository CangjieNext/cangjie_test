// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -g -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

public interface I {
    static func ff1(): Int64
    func ff2(): Unit
}

extend Int64 <: I {
    public static func ff1(): Int64 {
        3
    }
    public func ff2() {
        ()
    }
}

public interface I2 <: I {
    static func ff3(): Int64 {
        let a = ff1
        a()
    }
}

extend Int64 <: I2 {}

main() {
    1.ff2()
    0
}
