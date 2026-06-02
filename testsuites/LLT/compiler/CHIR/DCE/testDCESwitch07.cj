// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

class A {
    func test() {
        match (1) {
            case 1 | 2 | 3 => return 1
            case _ => return 2
        }
        return 1
    }
}

main() {
    A().test()
    return 0
}

/* SCAN
warning: unreachable pattern
  ==> testDCESwitch07.cj:14:18:
   | 
14 |             case _ => return 2
   |                  ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
