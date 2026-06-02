// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and LLVM) EXEC: %compiler %f -o %output
// (Linux and LLVM) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (Linux and LLVM) ASSERT: scan exported 0 => 2 release
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

class MockObj {
    public func Get(): Int32 {
        return i
    }
    public init(a : Int32) {
        i = a
    }
    private let i : Int32
}

var testInteropContext = TestInteropContext()
class TestExportedRef <: ExportedRef {
    init(obj : MockObj, context : InteropContext) {
        super(obj, context)
        validateHandle()
    }
    public func GetHandle(): UInt64 { return handle }
    ~init() {
        var b : Int32 = 0
        var r = ref as MockObj
        match(r) {
            case Some(v) => b = v.Get()
            case None => b = 0
        }
        println("exported ${handle} => ${b} release")
    }
}

main() {
    var m = MockObj(2)
    var test = TestExportedRef(m, testInteropContext)
    var handle = test.GetHandle()
    ExportTable.removeExportedRef(handle)
    GC()
    sleep(Duration.second * 2)
}