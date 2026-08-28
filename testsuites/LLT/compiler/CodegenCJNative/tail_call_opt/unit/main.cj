// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./test1.cj
// EXEC: %cjc -j1 %cmp_opt %compile_lib_opt %enableO2 ./test1.cj -o liblib.%lib_extension
// EXEC: %cjc -j1 %cmp_opt %enableO2 %f --save-temps . --output-type=dylib -o %output
// EXEC: %llvmDissembler %n.opt.bc -o %n.opt.ll
// EXEC-PIPE: %cat %n.opt.ll 2>&1 | compare %f
// ASSERT: scan define void @_CN7default3gooHl
// ASSERT: scan tail call token (...) @llvm.cj.gc.statepoint(i64 0, i32 0, void (%Unit.Type*, i64)* @_CN3lib3fooHl


import lib.*

public func goo(x: Int64): Unit {
    return foo(x)
}
