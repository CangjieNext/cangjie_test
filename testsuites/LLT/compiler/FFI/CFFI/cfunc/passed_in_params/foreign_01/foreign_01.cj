// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: native.c
// (CJNATIVE) EXEC: %clang -c native.c && ar -rc libnative.a native.o
// (CJNATIVE) EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f -L. -lnative -o %output
// (not CJNATIVE) EXEC: %clang -shared -fPIC native.c -o libnative.so
// (not CJNATIVE) EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f -L. -lnative -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 0\narg: 0\n

foreign {
    func xxx(cb: CFunc<(CPointer<Int8>) -> Bool>, arg: CPointer<Int8>): Unit

    func cb(ptr: CPointer<Int8>): Bool
}

main() {
    let f: CFunc<(CPointer<Int8>) -> Bool> = { arg: CPointer<Int8> =>
        println(arg.toUIntNative())
        return false
    }
    unsafe {
        xxx(f, CPointer<Int8>())
        xxx(cb, CPointer<Int8>())
    }
    return 0
}
