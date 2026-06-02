// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

foreign func testfunc(): CPointer<Float32>

unsafe main():Int64 {
    var ptr: CPointer<Float32> = testfunc()
    var ptrtmp: CPointer<Float32> = ptr + 1

    if ( (ptr.read(0) == 3.14) && (ptr.read(1) == 0.0) && (ptr.read(2) == -3.14) ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(-1) == 3.14) && (ptrtmp.read() == 0.0) && ((ptrtmp+1).read() == -3.14) ){
        print("ptrtmp: pass\n")
    }

    return 0
}