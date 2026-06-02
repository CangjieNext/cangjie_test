/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct Test {
    let a: Int32 = 0
    var b: Int32 = 0
    func foo(): Int32 {
        a = a + 1
        return a
    }
}

let res = Test(2, 2).foo()

func run(): Int64 {
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_modify_var
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_wrong_number_of_arguments
