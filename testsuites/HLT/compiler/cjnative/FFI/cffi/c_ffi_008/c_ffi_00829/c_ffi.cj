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



foreign {
    public func testfunc1(): CPointer<Bool>
    public func testfunc2(): CPointer<Bool>
    foreign func testfunc3(): CPointer<Bool>
    func testfunc4(): CPointer<Bool>
}

main() {}
// ASSERT: scan parse_conflict_modifier
// ASSERT: scan parse_duplicate_modifier
