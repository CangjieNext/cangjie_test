// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare %f
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output 2>&1

func foo(a!: Int32 = 0 ): Int32 {
    foo()
}

main(): Int32 {
    foo()
}

/* SCAN-IN
foo(l:6, c:1) -> main(l:10, c:1),
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
