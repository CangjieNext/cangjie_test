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

main() {
    let s1 = """
    """ // empty multi-line string
    print("${s1}\n")
    let s2 = """
    This
        is a multi-line string"""
    print("${s2}\n")
    let s3 = """
        This
      is a multi-line string"""
    print("${s3}\n")
    let s4 = """
    This
        is a
    multi-line string
    """
    print("${s4}\n")
    let s5 = """
    This is a\n
        multi-line string
    """
    print("${s5}\n")
    return 0
}
