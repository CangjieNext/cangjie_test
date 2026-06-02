/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

struct Data {
    let width: Int32 = 2
    let length: Int32 = 4
    init(x: Int32, y: Int32) {
        width = x
        length = y
    }
    func area() {
        return width * length
    }
}

func run(): Int64 {
    let data: Data = Data()
    var res = data.area1()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_not_member_of
