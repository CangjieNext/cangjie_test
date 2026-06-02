// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-4 unsafeFunc

class A {
    public unsafe func unsafeFunc() {
        println("unsafeFunc")
    }
}

class B {
    let a = A()

    public unsafe func get() {
        return a
    }

    public unsafe operator func[](index: UInt32) {
        return a
    }
}

unsafe main() {
    let b = B()
    var a = b.get()
    a.unsafeFunc()

    a = b[0]
    a.unsafeFunc()

    b.get().unsafeFunc()
    b[0].unsafeFunc()
}
