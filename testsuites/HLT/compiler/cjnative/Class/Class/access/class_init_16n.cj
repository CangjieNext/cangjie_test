/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class GenRec {
    public let b: Int32 = 1
    public var c: Int64 = 2
    public init(str: String) {
        if (str == "hi") {
            this()
            this.c = 4
        } else {
            this.c = this.c + 1
        }
    }
    public init() {
        this.c = 4
    }
}

main(): Int64 {
    var rec = GenRec("hi")
    print(rec.b.toString())
    print(rec.c.toString())
    if (rec.c == 4 && rec.b == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
