// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

public interface Test {
    prop i: Int64 {
        get() {
            1
        }
    }
}

public class test <: Test {
    public prop i: Int64 {
        get() {
            2
        }
    }
}

main() {
    var t: Test = test()
    if (t.i == 2) {
        return 0
    }
    return 1
}
