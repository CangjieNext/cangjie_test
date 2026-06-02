// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt %enableO2 -g %f -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args

main() {
    try {
        1
    } finally {} << try {
        2
    } finally {}
    try {
        3
    } finally {} >> try {
        4
    } finally {}

    var a: Int64 = try {
        5
    } finally {} & try {
        6
    } finally {}
    var b: Int64 = try {
        7
    } finally {} | try {
        8
    } finally {}
    var c: Int64 = try {
        9
    } finally {} ^ try {
        10
    } finally {}
    print(a)
    print(b)
    print(c)
    return 0
}
