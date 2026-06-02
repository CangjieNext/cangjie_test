/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

@C
struct teststruct {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

unsafe main(): Unit {
    var ptr1 = CPointer<UInt8>(1)
    var ptr2 = CPointer<UInt8>(1, 2)
    var ptr3 = CPointer<UInt8>(CPointer<UInt8>(), 2)
    var ptr4 = CPointer<Int64>(1)
    var ptr5 = CPointer<Int64>(1, 2)
    var ptr6 = CPointer<Int64>(CPointer<Int64>(), 2)
    var ptr7 = CPointer<Float64>(1)
    var ptr8 = CPointer<Float64>(1, 2.0)
    var ptr9 = CPointer<Float64>(CPointer<Float64>(), 2.0)
    var ptr10 = CPointer<CString>(unsafe { LibC.mallocCString("a") }, unsafe { LibC.mallocCString("b") })
    var ptr11 = CPointer<teststruct>(teststruct(0, 0), teststruct(1, 1))
}
// ASSERT: scan sema_pointer_single_element_type_error
// ASSERT: scan sema_pointer_too_much_argument
