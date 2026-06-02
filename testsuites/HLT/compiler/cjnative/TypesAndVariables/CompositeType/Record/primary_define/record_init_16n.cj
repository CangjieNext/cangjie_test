/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

struct GenRec {
    public let b: Int32 = 1
    public var c: Int64 = 2
    public GenRec(str: String) {
        if (str == "hi") {
            this.b = 2
            this()
            this.c = 4
        } else {
            this.b = b + 2
            this.c = this.c + 1
        }
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
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_illegal_place_of_calling_this_primary_constructor
// ASSERT: scan sema_wrong_number_of_arguments
