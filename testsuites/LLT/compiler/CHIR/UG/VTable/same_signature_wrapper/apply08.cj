// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

class E <: Exception {}

interface I<T> {
    func f(): T
}

class A <: I<Any> {
    public override func f(): Nothing {
        throw E()
    }
}

main() {
    0
}
