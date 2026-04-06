/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: libs2
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt libs2/myModule1/myModule1.cj -o libs2/myModule1/
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt libs2/myModule2/myModule2.cj -o libs2/myModule2/
// EXEC-PIPE: %compiler %cmp_opt --import-path libs2 -L libs2/myModule1 -L libs2/myModule2 -l myModule1.myModule1 -l myModule2.myModule2 %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import myModule1.myModule1.*
import myModule2.myModule2.*

main() {
    if (test1() == 1 && test2() == 2) {
        return 0
    }
    return 1
}
