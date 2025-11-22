// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %dump-ir %cmp_opt -O0 --apc=1 %save_temps_opt=. %f
// EXEC: %llvmDissembler %n.bc
// EXEC-PIPE-0: %cat %n.ll 2>&1 | compare %f

var arr = [false, false, false, false, false, false, false]

main() {
    if (arr[0]) {
        println(1)
        if (arr[1]) {
            println(2)
            if (arr[2]) {
                println(3)
            } else {
                println(-3)
            }
        } else {
            println(-2)
        }
    } else {
        println(-1)
    }
}

// Ensure that the relative sequence of %bb7, %bb2, and %bb8 is correct.
// ASSERT: scan-begin br i1 %28, label %bb7, label %bb8
// ASSERT: scan-next
// ASSERT: scan-next bb7:                                              ; preds = %bb5
// ASSERT: scan-next call void @_CNat7printlnHl(%Unit.Type* noalias sret(%Unit.Type) %1, i64 3),
// ASSERT: scan-next br label %bb2
// ASSERT: scan-next
// ASSERT: scan-next bb2:                                              ; preds = %bb10, %bb9, %bb8, %bb7
// ASSERT: scan-next ret void
// ASSERT: scan-next
// ASSERT: scan-next bb8:                                              ; preds = %bb5
// ASSERT: scan-next call void @_CNat7printlnHl(%Unit.Type* noalias sret(%Unit.Type) %1, i64 -3)
// ASSERT: scan-next br label %bb2