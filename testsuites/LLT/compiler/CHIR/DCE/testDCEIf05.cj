// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

func cond() {
    var temp = true
    return temp
}

func temp() {
    var res = 1
    return res
}

func test() {
    var a = 1
    if (cond()) {
        a = temp() - 1
    } else {
        a = temp() - 1
    }
}

main() {
    test()
    0
}

/* SCAN
warning: unused variable:'a'
  ==> testDCEIf05.cj:21:9:
   | 
21 |     var a = 1
   |         ^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
