// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %f 2>&1 | compare %f
// ASSERT: scan 8 errors printed.

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
