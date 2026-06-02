// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_opt 2>&1 >a.t
// EXEC: %touch b.t
// check no warnings under normal, -g, -O2 compilation options
// EXEC: %diff a.t b.t
// EXEC: %compiler %f -g 2>&1 >a.t
// EXEC: %diff a.t b.t
// EXEC: %compiler %f -O2 2>&1 >a.t
// EXEC: %diff a.t b.t

import std.collection.*

public func getDepSet(fullName: String, requiresMap: HashMap<String, HashSet<String>>): HashSet<String> {
    var linkPkgs = HashSet<String>()
    var queue = ArrayList<String>()
    queue.add(fullName)
    while (queue.size != 0) {
        var cur = queue[0]
        queue.remove(at: 0)
        if (!requiresMap.contains(cur)) {
            continue
        }
        for (k in requiresMap[cur]) {
            if (!linkPkgs.contains(k)) {
                linkPkgs.add(k)
                queue.add(k)
            }
        }
    }
    return linkPkgs
}

main() {}
