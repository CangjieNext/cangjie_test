/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

import std.collection.*
import std.sync.*

let ArrayLength: Int64 = 500000;
let object3: Object3 = Object3();

class Object1 {
    private static let instance: Object1 = Object1();
    private var var1: AtomicInt64 = AtomicInt64(0);
    private var var2 = AtomicReference(Object2(0));

    private init() {}

    public static func getObject1(): Object1 {
        return instance;
    }

    public func add(): Unit {
        this.var1.fetchAdd(1);
        this.var2 = AtomicReference(Object2(this.var1.load()))
    }
}

class Object3 {
    private var var1: AtomicInt64

    public init() {
        this.var1 = AtomicInt64(0)
    }

    public func add(): Unit {
        this.var1.fetchAdd(1);
    }

    public func getVar1(): Int64 {
        return this.var1.load();
    }
}

class Object2 {
    private let var1: Int64
    private let var2: Object3 = object3;

    public init(a: Int64) {
        this.var1 = a
        this.var2.add();
    }

    public func getVar1(): Int64 {
        return this.var1;
    }

    public func getVar2(): Int64 {
        return this.var2.getVar1();
    }
}

main(): Int64 {
    let array = ArrayList<Future<Unit>>(ArrayLength);
    for (i in 0..ArrayLength) {
        array.add(spawn {
            Object1.getObject1().add();
        })
    }
    for (f in array) {
        f.get();
    }
    print("success");
    return 0;
}
