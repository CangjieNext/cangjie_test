// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization --no-sub-pkg %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default1IIG_E<Generic-_CN7default3gooIG_HvE2K1E>&->@_CN7default1IIG_E3getHv

interface I<K> {
    func get(): Int64 {
        0
    }
}

open class Key<K, V> <: I<K> {}

class Key2<K, V> <: Key<K, V> {
    public func get(): Int64 {
        1
    }
}

func foo<K, V, G>(): I<K> {
    print(1)
    return Key<K, G>()
}

public func goo<K1>(): Int64 {
    let a: I<K1> = foo<K1, Int32, Int64>()
    a.get() // => Key<K1, Int64>
}

main() {
    goo<Int64>() - 0
}
