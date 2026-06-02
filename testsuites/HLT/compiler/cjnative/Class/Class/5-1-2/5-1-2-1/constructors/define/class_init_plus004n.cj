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
    public init() {
        var a: Int32 = 5
    }
    public var f: Int32 = this()
}

func run(): Int64 {
    var data: Data = Data()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
