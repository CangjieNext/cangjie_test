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



enum TEST {
    | foreign public testfunc1(): CPointer<Bool>
    | public foreign testfunc2(): CPointer<Bool>
    | foreign static testfunc3(): CPointer<Bool>
    | static foreign testfunc4(): CPointer<Bool>
    | foreign protected testfunc2(): CPointer<Bool>
    | protected foreign testfunc2(): CPointer<Bool>
    | foreign open testfunc2(): CPointer<Bool>
    | open foreign testfunc2(): CPointer<Bool>
    | foreign override testfunc2(): CPointer<Bool>
    | override foreign testfunc2(): CPointer<Bool>
    | foreign redef testfunc2(): CPointer<Bool>
    | redef foreign testfunc2(): CPointer<Bool>
    | foreign mut testfunc2(): CPointer<Bool>
    | mut foreign testfunc2(): CPointer<Bool>
    | foreign foreign testfunc2(): CPointer<Bool>
}

main() {}
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_type
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_duplicate_modifier
