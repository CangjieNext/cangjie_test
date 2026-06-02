// LEVEL: 0
// DEPENDENCE: pkg1 pkg2
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2/b.cj pkg1.%middle --fchir-devirtualization -o pkg2.%middle
// EXEC: %compiler %cmp_opt %f pkg2.%middle pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import pkg2.*

main() {
  call()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
