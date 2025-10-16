// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)DEPENDENCE: %n.file.cj
// (CJNATIVE and Linux)EXEC: %compiler %f --output-type=dylib -o libplugin1.so --import-path $CANGJIE_STDX_PATH -L$CANGJIE_STDX_PATH -lstdx.chir
// (CJNATIVE and Linux)EXEC: %set_stdx_path %compiler %n.file.cj --plugin=./libplugin1.so -o %output
// (CJNATIVE and Linux)EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args | compare %f

import stdx.chir.*

@C public func transformCHIRPackage(mp: CPointer<Memory>): Unit {
    try {
        var mem = unsafe { mp.read() }
        let pkg = Package.deserialize(mem)
        pkg.processGlobalVar { gv =>
            if (let Some(expr: ConstantExpr) <- gv.initializer && let Some(int: IntLiteral) <- expr.getValue() && int.`type`.kind == TypeKind.`Int64`) {
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

// ASSERT: scan aaa: 11110, bbb: 22220, ccc: 33330