// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: cast.c
// EXEC: clang -fstack-protector-all -fPIC -shared ./cast.c -o %cffi_output
// EXEC: %compiler %pyffi-link -l%n -L./ %f -o %output
// EXEC-PIPE: export cjStackSize=1MB && %run %run_opt %output %run_args

internal import std.core.sleep
internal import std.core.Duration
internal import ffi_python.*
internal import std.collection.*

@C
func cfoo(a1: Bool): Int8 {
    var f = spawn {sleep(Duration.second * 1);return 1}
    f.get()
    return 0
}

foreign func cast(f: CFunc<(Bool) -> Int8>): CPointer<Unit>

main(): Int64 {
    let fut = spawn {
        var x = Python.load()
        var f1 = PyCFunc(unsafe {cast(cfoo)}, 
                argsTy: [PyCBool], 
                retTy: PyCPointer)
        f1([true])
    }

    fut.get()
    
    return 0
}
