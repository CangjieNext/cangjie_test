// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.fs.*

foreign func CJ_MRT_DumpHeapSnapshot(fd: Int32) : Unit
foreign func CJ_MRT_ForceFullGC() : Unit

main() {
    let a = 1
    unsafe {
        CJ_MRT_ForceFullGC()
        try (file = File(Path("./cjheap"), ReadWrite)) {
            CJ_MRT_DumpHeapSnapshot(Int32(file.fileDescriptor.fileHandle))
        }
    }
}
