/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum Time {
    Day(Int64) | Hour
}

struct GenRec {
    public let b: Time
    public var c: Int64
    public GenRec() {
        var time = Day(3)
        b = time
        this.c = match (this.b) {
            case Day(x) => x + 1
            case Hour => 2
        }
    }
}

main(): Int64 {
    var rec = GenRec()
    if (rec.c == 4) {
        return 0
    }
    return 1
}
