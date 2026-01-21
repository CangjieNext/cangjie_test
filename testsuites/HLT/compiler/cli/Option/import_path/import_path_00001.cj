/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: libs
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt libs/myModule/myModule.cj -o libs/myModule/
// (not CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %compile_cbclib_opt libs/myModule/myModule.cj -o libs/myModule/
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt --import-path libs -L libs/myModule -l myModule.myModule %f -o %output
// (not CJNATIVE) EXEC-PIPE: %compiler %cmp_opt --import-path libs libs/myModule/myModule.myModule.pdba %f -o %output
// (CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (not CJNATIVE) RUN-EXEC-PIPE: %run --cbc-path libs/myModule %output %run_args

import myModule.myModule.*

main() {
    return test()
}
