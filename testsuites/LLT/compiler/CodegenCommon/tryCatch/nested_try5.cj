// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %overflowOpt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func f(): (String, Int64) {
    var loopTimeVar_1666684699867_5184: Int64 = 0;
    var ret: (String, Int64) = ("", 11)
    while (loopTimeVar_1666684699867_5184 < 10) {
        loopTimeVar_1666684699867_5184++;
        try {
            try {
            } finally {
                ret = ("g", 22)
                return ret;
            };
        } finally {
            if (true) {
                ret = ("k", 33)
                try {
                } finally {
                    ret = ("gh", 44)
                    break;
                };
            }
        };
    }
    return ret
}

main() {
    var test = f()
    println(test[0]) //"gh"
    println(test[1]) //44
    if (test != ("gh", 44)) {
        return 1
    }
    return 0
}
