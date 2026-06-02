// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %error_count_limit_opt=all %f 2>&1 | compare %f
// ASSERT: scan 20 errors generated, 20 errors printed.
// Will check the initializer of an assignment even if the annotated type on the left-hand side is wrong.

main() {
    let b: ArrayList<Int64> = ArrayList<Int64>()
    let b: ArrayList<Unit> = ArrayList<Int64>()
    let b: ArrayList<Int32> = ArrayList<Int64>()
    let b: ArrayList<Float32> = ArrayList<Int64>()
    let b: ArrayList<String> = ArrayList<Int64>()
    let b: ArrayList<Bool> = ArrayList<Int64>()
    let b: ArrayList<Float64> = ArrayList<Int64>()
    return 42
}
