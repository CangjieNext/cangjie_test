/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f


interface Base {
    func getNum() {
        return 1
    }
}

interface Base1 {
    func getNum1() {
        return 2
    }
}

class Data <: Base  & Data implements Base1 {
    public var res: Int64 = getNum()
    public var res1: Int64 = getNum1()
}
// ASSERT: scan parse_decl_cannot_inherit_their_self
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_decl
