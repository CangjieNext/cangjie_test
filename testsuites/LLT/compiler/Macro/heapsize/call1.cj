// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) DEPENDENCE: define.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro define.cj
// (CJNATIVE and Linux) EXEC: export cjHeapSize=1gb && %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (Windows) EXEC: set cjHeapSize=1gb && %run_macro %compiler %cmp_opt %macro_lib %f -o %output 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan 1073741824

import define.*

// cjHeapSize=1gb is within the valid range of heapsize,
// so the heapsize is set to 1073741824(1gb) in macro evaluation.
@M
func test() {}

main() {}
