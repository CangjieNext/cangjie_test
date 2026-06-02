// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and LLVM) EXEC: %compiler %f -o %output
// (Linux and LLVM) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (Linux and LLVM) ASSERT: scan e: 2
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
    init(input : Int32) {
        f = input
    }

    func Get(): Int32 {
        return f
    }
    private let f : Int32
}

var testInteropContext = TestInteropContext()
class TestExportedRef <: ExportedRef {
    init(obj : MockObj, context : InteropContext) {
        super(obj, context)
        validateHandle()
    }
    public func GetHandle(): UInt64 { return handle }
    public func GetMock(): MockObj {
        match (ref as MockObj) {
            case Some(v) => return v
            case None => return MockObj(3)
        }
    }
}

main() {
    var m = MockObj(2)
    var test = TestExportedRef(m, testInteropContext)
    var handle = test.GetHandle()
    var e = ExportTable.getExportedRef(handle)
    var f = match(e) {
        case Some(v) => v
        case None => TestExportedRef(MockObj(4), testInteropContext)
    } as TestExportedRef
    ExportTable.removeExportedRef(handle)
    GC()
    match(f) {
        case Some(v) =>
            sleep(Duration.second * 2)
            println("e: ${v.GetMock().Get()}")

        case None => println("e: invalid")
    }
}