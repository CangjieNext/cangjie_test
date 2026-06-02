// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Interface_AAA {}

class Class_AAA <: Interface_AAA {}

class Class_BBB <: Interface_AAA {}

func moo(): (Array<Int64>, Interface_AAA) {
    try {
        ([180], Class_AAA())
    } finally {
    }
}

func hoo(): (Array<Int64>, Interface_AAA) {
    try {
        (([180], Class_AAA()), 166)
    } finally {
    }[0]
}

func goo(): (Array<Int64>, Interface_AAA) {
    (([180], Class_AAA()), 166)[0]
}

main() {
    moo()
    hoo()
    goo()
    return 0
}
