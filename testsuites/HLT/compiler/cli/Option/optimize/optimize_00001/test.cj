/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg
// (CJNATIVE) EXEC: %compiler %cmp_opt -O1 %compile_dylib_opt pkg/a.cj -o liba.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -L . -la %f -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
// (not CJNATIVE) EXEC: %compiler %cmp_opt --experimental -O1 %compile_cbclib_opt pkg/a.cj -o a.%suffix
// (not CJNATIVE) EXEC: %compiler %cmp_opt a.%symbol_file_suffix %f -o %output
// (not CJNATIVE) RUN-EXEC: %run %run_cbc_opt %output %run_args

import pkg.*

main() {
    return test()
}
