/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: libs libs2
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt libs/myModule/myModule.cj -o libs/myModule/
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt libs2/myModule1/myModule1.cj -o libs2/myModule1/
// EXEC-PIPE: %compiler %cmp_opt --import-path libs --import-path libs2 -L libs/myModule -L libs2/myModule1 -l myModule.myModule -l myModule1.myModule1 %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args


import myModule.myModule.*
import myModule1.myModule1.*

main() {
    if (test() == 0 && test1() == 1) {
        return 0
    }
    return 1
}
