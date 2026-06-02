// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
    var z = 3;
    init(x: Int64) {
        z = x
    }
}

func f(): A {
    var ret: A = A(44)
    try {
        try {
        } finally {
            return ret;
        };
    } finally {
        ret = A(66)
    };
    return ret
}

main() {
    var a = f();
    println(f().z) // 44 
    if (f().z != 44) {
        return 1
    }
    return 0
}
