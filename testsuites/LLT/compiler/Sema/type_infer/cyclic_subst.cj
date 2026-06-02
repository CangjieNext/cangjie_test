// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface BiMap<K, V> {
    func inverse(): ?BiMap<V, K>
}

class HashBiMap<K, V> <: BiMap<K, V> {
    public func inverse(): ?BiMap<V, K> {
        return HashBiMap<V, K>()
    }
}

main() {
    let a = HashBiMap<Int64, String>()
    0
}
