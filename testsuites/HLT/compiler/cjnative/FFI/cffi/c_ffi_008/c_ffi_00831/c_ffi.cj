/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f



class TEST {
    foreign public func testfunc1(): CPointer<Bool>
    public foreign func testfunc2(): CPointer<Bool>
    foreign static func testfunc3(): CPointer<Bool>
    static foreign func testfunc4(): CPointer<Bool>
    foreign protected func testfunc5(): CPointer<Bool>
    protected foreign func testfunc6(): CPointer<Bool>
    foreign open func testfunc7(): CPointer<Bool>
    open foreign func testfunc8(): CPointer<Bool>
    foreign override func testfunc9(): CPointer<Bool>
    override foreign func testfunc10(): CPointer<Bool>
    foreign redef func testfunc11(): CPointer<Bool>
    redef foreign func testfunc12(): CPointer<Bool>
    foreign mut func testfunc13(): CPointer<Bool>
    mut foreign func testfunc14(): CPointer<Bool>
    foreign foreign func testfunc15(): CPointer<Bool>
}

main() {}
// ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_duplicate_modifier
