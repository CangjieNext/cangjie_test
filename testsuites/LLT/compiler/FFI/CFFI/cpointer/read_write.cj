// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello
// ASSERT: scan World

foreign func malloc(size: UIntNative): CPointer<CFunc<() -> Unit>>
foreign func free(ptr: CPointer<CFunc<() -> Unit>>): Unit

@C
unsafe func foo(ptr: CPointer<CFunc<() -> Unit>>) {
    var f: CFunc<() -> Unit> = ptr.read()
    f()

    var f1: CFunc<() -> Unit> = {
        => println("World")
    }
    ptr.write(f1)
}

unsafe main() {
    var ptr = malloc(8)

    var f: CFunc<() -> Unit> = {
        => println("Hello")
    }

    unsafe { ptr.write(f) }

    foo(ptr)

    f = ptr.read()
    f()

    unsafe{ free(ptr) }
}
