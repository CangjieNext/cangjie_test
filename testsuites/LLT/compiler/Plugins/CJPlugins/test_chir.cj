// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)DEPENDENCE: a.cj a.c
// (CJNATIVE and Linux)EXEC: %clang a.c -shared -o liba.so
// (CJNATIVE and Linux)EXEC: %compiler %f --output-type=dylib -o libplugin1.so -l:libcangjie-std-chir.so -la
// (CJNATIVE and Linux)EXEC: %compiler a.cj --plugin=./libplugin1.so -o %output
// (CJNATIVE and Linux)EXEC: %run %run_opt %output %run_args

import std.chir.*
import std.convert.*

@C foreign func cpointerValue(a: CPointer<UInt8>): Int64

func toString<T>(a: CPointer<T>) where T <: CType {
    unsafe { cpointerValue(CPointer<UInt8>(a)) }.format("#x")
}

@C public func transformCHIRPackage(mp: CPointer<Memory>): Unit {
    try {
        var mem = unsafe { mp.read() }
        let pkg = Package.deserialize(mem)
        pkg.processGlobalVar { gv =>
            if (let Some(expr: ConstantExpr) <- gv.initializer && let Some(int: IntLiteral) <- expr.getValue()) {
                let newVal = int.value * 10
                let newLiteral = IntLiteral(int.identifier, int.`type`, newVal)
                gv.initializer = Some(ConstantExpr(newLiteral))
            }
        }
        println(pkg)
        let res = pkg.serialize()
        unsafe {
            mp.write(res)
        }
    } catch (e: Exception) {
        e.printStackTrace()
    }
}