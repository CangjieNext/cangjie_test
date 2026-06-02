/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class C1 {
    let a: Int64
    init() {
        this.a = 1
    }
    let initExpression = {b: Int64 => this()}
}

func test(): Int64 {
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
