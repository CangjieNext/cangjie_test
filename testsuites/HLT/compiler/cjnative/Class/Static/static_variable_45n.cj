/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class Data {
    public static let a: Int32 = 2
    public var b: Int32
    public init(x: Int32) {
        init()
        b = this.a + x      
    }
}

func run(): Int64 {
    var data: Data = Data(1)
    if (Data.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_expr_or_decl_in
