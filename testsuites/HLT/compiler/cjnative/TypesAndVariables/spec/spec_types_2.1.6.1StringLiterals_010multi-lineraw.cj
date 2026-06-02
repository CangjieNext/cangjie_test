/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let empty1 = #""# // empty multi-line raw string
    let empty2 = ##""## // empty multi-line raw string
    let s2 = ##"
        This
      is a multi-line raw string"##
    let s3 = #"This is a\n
        multi-line string"#
    let s4 = ##" This is a "#
    "##
    print("${empty1}\n")
    print("${empty2}\n")
    print("${s2}\n")
    print("${s3}\n")
    print("${s4}\n")
    return 0
}
