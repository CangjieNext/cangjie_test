// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// DEPENDENCE: import.pkg.cj
// EXEC: %compiler import.pkg.cj %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %f %n.%lib_extension -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package a::c
import a::b.{foo,bar}

main() {
    bar(1)-foo()
}