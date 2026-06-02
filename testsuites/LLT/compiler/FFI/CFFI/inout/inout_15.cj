// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %f 2>&1

func cj_foo(ptr1: CPointer<Int64>, ptr2: CPointer<Byte>, len: UInt32): Int32 {
    unsafe {
        var data = Data()
        let res = c_foo(ptr1, ptr2, len, inout data)
        return res
    }
}

main() {
    var ptr1 = CPointer<Int64>()
    var ptr2 = CPointer<Byte>()
    cj_foo(ptr1, ptr2, 0)
}

@C
struct Data {
    var a = 0
    var b = 0
}

foreign func c_foo(ptr1: CPointer<Int64>, ptr2: CPointer<Byte>, len: UInt32, data: CPointer<Data>): Int32
