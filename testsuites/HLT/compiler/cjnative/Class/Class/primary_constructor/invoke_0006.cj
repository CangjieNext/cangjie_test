/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Data {
    var b: Int32
    public Data() {
        this.b = 3
    }
    public init(input: Int32) {
        this.b = input

        this()
        // Data() is ok, same as Java new Data()
        // this() is same as Java this()
    }
}

func run(): Int32 {
    var a: Int32 = 5
    var data: Data = Data(a)
    return data.b - 5
}

main(): Int64 {
    return Int64(run())
}
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
