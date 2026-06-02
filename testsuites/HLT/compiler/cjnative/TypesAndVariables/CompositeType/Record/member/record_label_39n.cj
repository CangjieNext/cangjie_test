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

struct Data{
let width2: Int32
let length2: Int32
var perimeter2: Unit -> Int32 = {  => 2 * (width2 + length2)} 
init(x: Int32, y: Int32, z: Unit -> Int32) {
}
}

func run(): Int64 {
var res: Int32
let a: Int32 = 5
let b: Int32 = 6
var c: Unit -> Int32 = {  => a}
let data = Data(a, b, c)
res = data.perimeter2()
return 0
}
// ASSERT: scan parse_expected_parentheses
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_character
