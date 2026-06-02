/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Data {
    var a: Int32 = 1
    var b: Int32 = this.a
    Data() {
        var b: Int32 = this.a
    }
    func f(): Int32 {
        var one: Int32 = 2
        var b: Int32 = this.a
        return one
    }
}

func run(): Int64 {
    var data: Data = Data()
    var res: Int32 = data.f()
    print(res.toString() + "n")
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_illegal_this_outside_struct_constructor
