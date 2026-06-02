// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: define.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro define.cj
// (CJNATIVE and Linux) EXEC: export cjStackSize=32KB && %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (Windows) EXEC: set cjStackSize=32KB && %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan unsupported cjStackSize for macro, the valid range is [64KB, 1GB], using 4MB as default size

import define.*

// cjStackSize=32KB is not within the valid range of stacksize,
// so the stacksize is set to default value 4MB in macro evaluation.
@M
func test() {}

main() {}
