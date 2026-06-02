// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello

internal import std.collection.HashMap

main() {
    var map = HashMap<Int32, CString>()
    map.add(Int32(1), unsafe { LibC.mallocCString("hello") })
    match (map.remove(Int32(1))) {
        case Some(v) =>
            println(v)
            unsafe { LibC.free(v) }
        case _ => ()
    }
    return 0
}
