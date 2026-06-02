/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    // func test(a:Int8):Int64{return 1}
    func test(a: Int16): Int64 {
        return 1
    }
    var a = this.test
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
