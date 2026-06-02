// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: define.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro define.cj
// (CJNATIVE and Linux) EXEC: export cjStackSize=128 && %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (Windows) EXEC: set cjStackSize=128 && %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan unsupported cjStackSize for macro, using 4MB as default size

import define.*

// cjStackSize=128 is not within the valid range of stacksize,
// The value of cjHeapSize must end with "kb", "mb", "gb", and is case insensitive.
// so the stacksize is set to default value 4MB in macro evaluation.
@M
func test() {}

main() {}
