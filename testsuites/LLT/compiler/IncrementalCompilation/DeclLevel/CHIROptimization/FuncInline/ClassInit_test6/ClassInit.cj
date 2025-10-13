// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare %f
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC-PIPE-0: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output 2>&1
// EXEC: %run %run_opt %output %run_args

open class A{
    public var a1 : Int64 = 0
    public var a2 : Int64 = 0
}

class B <: A{
    var b : Int32 = 0
}

main(): Int64 {
    var x = B()
    0
}

/* SCAN-IN
a1(l:9, c:5) -> b(l:14, c:5),main(l:17, c:1),
a2(l:10, c:5) -> b(l:14, c:5),main(l:17, c:1),
b(l:14, c:5) -> main(l:17, c:1),
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
