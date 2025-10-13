// EXEC: %compiler %incrementalCompile %cmp_opt %f -o %output
// EXEC: %compiler %incrementalCompile %cmp_opt %f %incrementalCompile -o %output 2>&1 | compare %f
// ASSERT: scan no change

var ctx: Int64 = 0
func ctr(): Int64 {
    ctx++
    ctx
}
let (_, _): (Int64, Int64) = (3, 18)
let _ = ctr()
let _ = ctr()
let _ = ctr()

main(): Unit {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
