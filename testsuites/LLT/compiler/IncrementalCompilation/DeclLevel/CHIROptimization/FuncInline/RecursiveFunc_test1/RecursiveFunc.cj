// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare %f
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output 2>&1
// EXEC-2: %run %run_opt %output %run_args

func goo(a!: Int32 = 1): Int32 {
    if (a < 10) {
        return 0
    } else {
        spawn {
            goo(a: 0)
        }
    }
    return 2
}

main(): Int32 {
    goo()
}

// ASSERT: scan goo(l:8, c:1) -> main(l:19, c:1),


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
