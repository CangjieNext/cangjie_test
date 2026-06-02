// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func f(): String {
    var ret: String = "g"
    try {
        try {
        } finally {
            ret += "h"
            return ret;
        };
    } finally {
        ret += "k"
        return ret;
    };
    return ret
}

main() {
    var test = f();
    println(test) //"ghk"
    if (test != "ghk") {
        return 1
    }
    return 0
}
