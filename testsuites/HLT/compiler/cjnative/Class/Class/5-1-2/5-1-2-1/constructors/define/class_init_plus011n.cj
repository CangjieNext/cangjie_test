/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



main(): Int64 {
    return run()
}

class A {
    public let t1 :Int32 = 1
    public let t2 :Int64 = 2
    public let t4 :Int32
    t4 = 4 
    public var v1 :Int32 = 5
    public var v2 :Int64 = 6
    public var v4 :Int32
    v4 = 8 
}

func run(): Int64 {
   var day :A = A()
   return 0
}
// ASSERT: scan parse_expected_decl
