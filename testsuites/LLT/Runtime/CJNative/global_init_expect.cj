// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT:regex default::a\(.*global_init_expect.cj:[0-9]+

interface I1 {}

interface I2 {}

interface I3 {}

var a: Option<Exception> = Some(Exception())

main() {
    func b<c, d, e>() where c <: I1, d <: I2, e <: I3 {
        try {
            match (a) {
                case Some(v) => throw v
                case None => ()
            }
        } finally {}
    }
    b()
}
