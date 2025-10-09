// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.HashMap

func getOne(dict: HashMap<String, Int64>, name: String): Int64 {
    return dict.get(name).getOrThrow()
}

main() {
    let a = Some(1)
    let b: ?Int64 = None
    let r1 = a.getOrThrow()

    return 0
}