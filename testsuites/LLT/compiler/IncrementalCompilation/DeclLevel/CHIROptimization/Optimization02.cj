// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %optimization_level_2 %n.cj
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %cmp_opt -Woff unused %optimization_level_2 %incrementalCompile %n.cj 2>&1 | compare %f

func goo() {
    println(1)
}

func foo() {
    goo()
    println(2)
}

main() {
    foo()
}

// ASSERT: scan-not The apply node in the line:38 and the column:5 was optimized by The opt: Function Inline
/* SCAN-IN
foo(l:37, c:1) -> main(l:42, c:1),
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
