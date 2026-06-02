// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_opt 2>&1 >a.t
// EXEC: %touch b.t
// check no warnings under normal, -g, -O2 compilation options
// EXEC: %diff a.t b.t
// EXEC: %compiler %f -g 2>&1 >a.t
// EXEC: %diff a.t b.t
// EXEC: %compiler %f -O2 2>&1 >a.t
// EXEC: %diff a.t b.t

var a = 1

func bar(chain: Array<Int64>) {
    for (cert in chain) {
    }
    unsafe {
        if (a <= 0) {
        }
    }
}

main() {
}
