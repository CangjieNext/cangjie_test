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
    public init(str: String) {
        this.b = foo()
    }
    private func foo(): Int32 {
        return b + 1
    }
}

main(): Int64 {
    var rec = GenRec("hi")
    var res = rec.foo()
    if (res == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_no_match_function_declaration_for_call
