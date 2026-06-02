// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkgA.cj
// EXEC-PIPE: %compiler %cmp_opt pkgA.cj %compile_lib_opt -o pkgA.%middle
// EXEC-PIPE: %compiler %cmp_opt %f pkgA.%middle -g -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

internal import pkgA.*

public interface I2 <: I {
    func ff3() {
        ff1()
    }
}

public interface I3 <: I2 {
    func ff4() {
        ff3()
    }
}

extend Int64 <: I3 {}

main() {
    1.ff4()
    0
}
