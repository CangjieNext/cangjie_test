// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT: scan at default::Foo::i::set(Int64)

class Foo {
    public var j = 0
}

extend Foo {
    public mut prop i: Int64 {
        get() {
            j
        }
        set(v) {
            throw Exception()
            j = v
        }
    }
}

main() {
    Foo().i = 1
    0
}
