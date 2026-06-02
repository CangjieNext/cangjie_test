/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



struct Data1 {
let width: Int32 = 1
let length: Int32 =2
}

abstract struct Data2 { 
let width: Int32 = 1
let length: Int32 =2
}

open struct Data3 { 
let width: Int32 = 1
let length: Int32 =2
}

private struct Data4 { 
let width: Int32 = 1
let length: Int32 =2
}

main(): Int64 {
return run()
}

func run(): Int64 {
var res: Int32
var a: Int32 = 3
var b: Int32 = 4
let data1: Data1 = Data1(3, 4)
let data2: Data2 = Data2(3, 4)
let data3: Data3 = Data3(3, 4)
let data4: Data4 = Data4(3, 4)
return 1
}
// ASSERT: scan parse_illegal_modifier_in_scope
