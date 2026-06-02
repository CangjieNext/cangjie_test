// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f
// EXPECTED: regex-not error
class NdArray<T> {
    public var data: Array<T>
    public var shape: Array<Int64>
    public init(ori: NdArray<T>) {
        this.data = ori.data
        this.shape = ori.shape
    }
}
