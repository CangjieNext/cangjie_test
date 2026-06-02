// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default1fHF0llE
// (CJNATIVE) ASSERT: scan define void @_CN7default2f2HF0uE
// (CJNATIVE) ASSERT: scan define void @_CN7default8printAddHF0lllEll
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7default9returnAddHvE3addHll
// (CJNATIVE) ASSERT: scan define i32 @_CN7default6atexitHFCuE
// (CJNATIVE) ASSERT: scan define void @_CN7default9testCFuncHFCuPaE

// func
func f(a1: (Int64) -> Int64): Int64 {
    a1(1)
}

func f2(lam: () -> Unit) {}

func printAdd(add: (Int64, Int64) -> Int64, a: Int64, b: Int64): Unit {
    println(add(a, b))
}

func returnAdd(): (Int64, Int64) -> Int64 {
    func add(a: Int64, b: Int64) {
        a + b
    }
    add
}

// cfunc 
func atexit(cb: CFunc<() -> Unit>): Int32 {
    0
}

func testCFunc(f1: CFunc<(CPointer<Int8>) -> Unit>) {}
