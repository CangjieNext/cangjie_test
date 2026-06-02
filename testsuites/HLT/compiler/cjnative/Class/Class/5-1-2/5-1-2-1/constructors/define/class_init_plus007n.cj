/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Data {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public var c: Data = Data()
    public init() {
        a = 10
        b = 20
        print("yes\n")
    }
}

func run(): Int64 {
    var data: Data = Data()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_recursive_constructor_call
