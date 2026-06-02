// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f -L . -l %n -o %output
// EXEC: %run %run_opt %output %run_args

@C
public struct Data {
    public Data(
        public let x1!: Float32,
        public let x2!: Float32,
        public let y1!: Float32,
        public let y2!: Float32,
        public let z1!: Float32,
        public let z2!: Float32,
        public let t1!: Float32,
        public let t2!: Float32
    ) {}
}

foreign {
    func CreateX1(data: Data, delta: Float32, errCode: CPointer<Int32>): Int64
}

@C
func CreateX2(data: Data, delta: Float32, errCode: CPointer<Int32>): Int64 {
    0
}

let createX: CFunc<(Data, Float32, CPointer<Int32>) -> Int64> = { data, delta, errCode =>
    0
}

public func create(data: Data, delta: Float32): Unit {
    unsafe {
        let errCode = LibC.malloc<Int32>(count: 1)
        var id = CreateX1(data, delta, errCode)
        var data1 = data
        id = CreateX1(data1, delta, errCode)
    }
    unsafe {
        let errCode = LibC.malloc<Int32>(count: 1)
        var id = CreateX2(data, delta, errCode)
        var data1 = data
        id = CreateX2(data1, delta, errCode)
    }
    unsafe {
        let errCode = LibC.malloc<Int32>(count: 1)
        var id = createX(data, delta, errCode)
        var data1 = data
        id = createX(data1, delta, errCode)
    }
}

main() {}
