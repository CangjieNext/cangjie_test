// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

class B<K, V> {
    private var ins1: B<K, V> = B<K, V>()
    private var ins2: B<K, V> = B<K, V>()
    private var ins3: B<K, V> = B<K, V>()
    private var ins4: B<K, V> = B<K, V>()
    public init() {}
    public func set(temp: B<K, V>) {
        this.ins1 = B<K, V>()
        this.ins2 = B<K, V>()
        this.ins3 = B<K, V>()
        this.ins4 = B<K, V>()
        return ins4.get()
    }
    public func get() {
        return 0
    }
}

main() {
    var b = B<Int64, Int32>()
    return b.set(b)
}

/* SCAN
error: recursive constructor calling detected
  ==> generic_class2.cj:10:33:
   | 
10 |     private var ins1: B<K, V> = B<K, V>()
   |                                 ^^^^^^^ 
   | 
note: depends on
  ==> generic_class2.cj:14:12:
   | 
14 |     public init() {}
   |            ^^^^ 
   | 
note: depends on
  ==> generic_class2.cj:10:33:
   | 
10 |     private var ins1: B<K, V> = B<K, V>()
   |                                 ^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
