// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler -p pkg/ %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %cmp_opt %f pkg.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import pkg.a as b
import pkg

main() {
    pkg.b - 1
}
