// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package core

internal import std.collection.*

let GCOV_SPLIT_NUM = 4
let GCOV_SEGMENT_SOURCE_PATH = 3
let GCOV_SOURCE_SEGMENT_NUM = 2

public struct GcovData {
    var noncode = ArrayList<Int64>()
    var uncovered = ArrayList<Int64>()
    var covered = HashMap<Int64, Int64>()
    var branches = HashMap<Int64, HashMap<Int64, Int64>>()
}
