// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 0
// ASSERT: scan 1
@C
func foo(ptr: CPointer<Int64>) {
    unsafe { ptr.read() }
}

var a = Int64(0)

var arr: VArray<Int64, $3> = [1, 2, 3]

@C
struct Data {
    var ptr: CPointer<Int64>

    init(ptr: CPointer<Int64>) {
        this.ptr = ptr
    }
}

unsafe main() {
    println(foo(inout a))
    println(foo(inout arr))
    0
}
