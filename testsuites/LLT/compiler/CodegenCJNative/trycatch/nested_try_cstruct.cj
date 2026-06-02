// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@C
struct S1 {
    var x: Int64 = 1
    init(d: Int64) {
        x = d
    }
}

@C
func f(): S1 {
    var ret: S1 = S1(11)
    var i = 0
    while (i < 2) {
        i++;
        try {
            try {
            } finally {
                ret = S1(22)
                return ret;
            };
        } finally {
            ret = S1(33)
        };
    }
    return ret
}

main() {
    var test = unsafe { f() };
    println(test.x)
    if (test.x != 22) {
        return 1;
    }
    return 0;
}
