// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not [Devirtualization] The function call to get at [28,5] was optimized.

interface I<K> {
    func get() {}
}

open class Key<K, V> <: I<K> {}

class Key2<K, V> <: Key<K, V> {
    public func get() {}
}

func foo<K, V, G>(): I<K> {
    print(1)
    return Key<K, G>()
}

public func goo<K1>() {
    let a: I<K1> = foo<K1, Int32, Int64>()
    a.get() // => Key<K1, Int64>
}

main() {
    0
}
