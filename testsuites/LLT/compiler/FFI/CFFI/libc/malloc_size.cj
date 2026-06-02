// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -o %output
// EXEC-PIPE-0: %pwd_to_ld_path %run %run_opt %output

// test asan

@C
struct Data {
    var a: UInt8
    var b: UInt16
    var c: UInt32
    var d: UInt64

    init(a: UInt8, b: UInt16, c: UInt32, d: UInt64) {
        this.a = a
        this.b = b
        this.c = c
        this.d = d
    }
}

main() {
    var data: CPointer<Data> = LibC.malloc()
    unsafe {
        data.write(Data(1, 2, 3, 4))
        LibC.free(data)
    }

    var data0: CPointer<Data> = LibC.malloc(count: 2)
    unsafe {
        data0.write(Data(1, 2, 3, 4))
        var data1 = data0 + 1
        data1.write(Data(1, 2, 3, 4))
        LibC.free(data0)
    }
    0
}
