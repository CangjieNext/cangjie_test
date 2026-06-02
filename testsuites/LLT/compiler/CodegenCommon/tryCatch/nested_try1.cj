// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func func_1666684699867_176<T0>(): String {
    var loopTimeVar_1666684699867_5184: Int64 = 0;
    var ret: String = ""
    while (loopTimeVar_1666684699867_5184 < 10) {
        loopTimeVar_1666684699867_5184++;
        try {
            try {
            } finally {
                break;
            };
        } finally {
            if (true) {
                ret += "k"
            } else {
                ret += "m"
            }
        };
    }
    return ret
}

main() {
    var zz = func_1666684699867_176<Int64>();
    println(zz);
    if (zz != "k") {
        return 1;
    }
    return 0;
}
