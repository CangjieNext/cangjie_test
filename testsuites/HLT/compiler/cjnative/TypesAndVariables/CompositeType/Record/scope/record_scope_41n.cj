/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



main(): Int64 {
return run()
}

struct Data {
let width: Int32
let length: Int32

init(x:Int32, y: Int32){
width = x
length = y
}

static operator func -(operand: Data): Data{ 
Data(operand.width-1, operand.length-1)
}
}

func run(): Int64 {
var a: Int32 = 3
var b: Int32 = 4
var data: Data = Data(a, b)
var d1 = -data
var res1: Int32 = d1.width
var res2: Int32 = d1.length
if (res1 == 2 && res2 == 3) {
return 0
}
return 1
}
// ASSERT: scan parse_conflict_modifier
