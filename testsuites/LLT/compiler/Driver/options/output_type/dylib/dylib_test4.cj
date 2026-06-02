// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) DEPENDENCE: pkg.cj
// (not CJNATIVE) EXEC:%compiler %cmp_opt --output-type=staticlib pkg.cj
// (not CJNATIVE) EXEC:%compiler %cmp_opt %f pkg.bc -o %output
// (not CJNATIVE) EXEC: %run %run_opt %output %run_args | compare %f
// (not CJNATIVE) ASSERT: scan Hello cangjie!

internal import pkg.*

main() {
    foo()
    return 0
}
