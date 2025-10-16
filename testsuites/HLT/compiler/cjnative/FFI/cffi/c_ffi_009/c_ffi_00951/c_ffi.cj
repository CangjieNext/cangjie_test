/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output %boundscheck
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
struct teststruct {
    public var num: Int8 = 0
    public var next: CPointer<teststruct> = CPointer<teststruct>()
    public init(num!: Int8 = 5, next!: CPointer<teststruct> = CPointer<teststruct>()) {
        this.num = num
        this.next = next
    }
}

foreign {
    func testfunc(num: Int8, ppst: CPointer<CPointer<teststruct>>): CPointer<CPointer<teststruct>>

    func GetDoublePtr(): CPointer<CPointer<teststruct>>

    func MallocWithZero(size: UIntNative): CPointer<Unit>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(num: 8)

    var p1 = MallocWithZero(16)
    var pst1 = CPointer<teststruct>(p1)
    pst1.write(struct1)

    var ppst1 = GetDoublePtr()
    ppst1.write(pst1)

    var ppst2 = testfunc(9, ppst1)

    if (ppst2.read().read().num == 10) {
        free(CPointer<Unit>(ppst2))
        free(CPointer<Unit>(pst1))
        return 0
    } else {
        return 1
    }
}
