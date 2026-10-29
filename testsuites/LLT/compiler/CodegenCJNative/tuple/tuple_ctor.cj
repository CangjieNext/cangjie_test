// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// RUN-EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-begin define i8 addrspace\(1\)\* @_CN7default3fooHl\(i64 %x\)
// ASSERT: regex-after (?P<num0>%\d+) = alloca %"Tuple<Int64,Int64>", align 8
// ASSERT: regex-after %\d+ = getelementptr inbounds %"Tuple<Int64,Int64>", %"Tuple<Int64,Int64>"\* (?P=num0), i32 0, i32 0, !dbg !\d+
// ASSERT: regex-after store i64 %x, i64\* %\d+, align 8, !dbg !\d+
// ASSERT: regex-after %\d+ = getelementptr inbounds %"Tuple<Int64,Int64>", %"Tuple<Int64,Int64>"\* (?P=num0), i32 0, i32 1, !dbg !\d+
// ASSERT: regex-after store i64 2, i64\* %\d+, align 8, !dbg !\d+

internal import std.collection.HashMap

func foo(x: Int64) {
    let a = HashMap<Int64, Int64>([(x, 2), (3, 4)])
    a
}

main() {
    foo(1)
    0
}
