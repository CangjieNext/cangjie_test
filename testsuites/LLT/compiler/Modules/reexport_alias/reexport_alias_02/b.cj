// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a.cj main.cj
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_shared_lib_opt a.cj -o liba.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -L. -la %compile_shared_lib_opt %f -o lib%n.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt -L. -la -lb main.cj -o %output
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args
package b

public import a.x as X

public func x(input: Int64) {
    return input
}
