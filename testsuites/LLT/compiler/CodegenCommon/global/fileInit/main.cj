// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: student.cj

// (not CJNATIVE)EXEC: %compiler %cmp_opt student.cj %compile_lib_opt

// (not CJNATIVE)EXEC: %compiler %cmp_opt %f student.%middle -o %output
// (not CJNATIVE)RUN-EXEC: %run %run_opt %output %run_args

internal import student.{Teacher}

main(): Int64 {
    var teacher = Teacher<String, String>()
    0
}
