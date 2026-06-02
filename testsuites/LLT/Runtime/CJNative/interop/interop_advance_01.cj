// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and LLVM) EXEC: %compiler %f -o %output
// (Linux and LLVM) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (Linux and LLVM) ASSERT: scan exported 0 release

import std.interop.*
import std.runtime.*
import std.sync.*

class TestInteropContext <: InteropContext {
    init() {
        super({a: ExportedRef, b: ForeignProxy => return })
    }
    public operator func == (data:InteropContext): Bool {
        return true
    }
}

var testInteropContext = TestInteropContext()
class TestExportedRef <: ExportedRef {
    init(obj : Any, context : InteropContext) {
        super(obj, context)
        validateHandle()
    }
    public func GetHandle(): UInt64 { return handle }
    ~init() {
        println("exported ${handle} release)
    }
}

main() {
    var i : Int64 = 0
    var test = TestExportedRef(i, testInteropContext)
    ExportTable.removeExportedRef(test.GetHandle())
    GC()
    sleep(Duration.second * 2)
}