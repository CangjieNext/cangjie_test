/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %overflow_wrapping %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10000

import std.collection.*
import std.sync.*
import asan.*

let Object1ArrayLength = 500;
let ArrayLength = 10000;
let m = ReentrantMutex();

class Object4 {
    public var var41: Int64 = 12;
}

class Object1 {
    public var var1: Int64 = 2;
    public var var2: Float32 = 3.14;
    public var var3: String = "string";
    public var var4:ArrayList<Object4> = ArrayList<Object4>(Object1ArrayLength);

    public func test(): Unit {
        this.var1 = 5
    }
}

class Object2 {
    public var var21: Int32 = 35;
    public var var22: Object1 = Object1();

    public func test(): Unit {
        this.var21 = 50
    }
}

class Object3 {
    public var var31: Object1 = Object1();
    public var var32: Object2 = Object2();
    public init(ob1: Object1, ob2: Object2) {
        this.var31 = ob1
        this.var32 = ob2
    }

    public func changeOb1(ob1: Object1):Unit {
        synchronized(m) {
            this.var31 = ob1
        }
    }

    public func changeOb2(ob2: Object2):Unit {
        synchronized(m) {
            this.var32 = ob2
        }
    }

    public func addVar4toObject1():Unit {
        synchronized(m) {
            for (i in 0..Object1ArrayLength) {
                var31.var4.add(Object4());
            }
        }
    }
}

func Test1() {
    let array = ArrayList<Object3>(ArrayLength);
    for (i in 0..ArrayLength) {
        array.add(Object3(Object1(), Object2()));
    }
    let spawn1: Future<Unit> = spawn {
        for (i in 0..ArrayLength) {
            try {
                let ob1 = Object1();
                ob1.test();
                array.get(i).getOrThrow().changeOb1(ob1);
            } catch (_) {
                print("oops!! in ${i} of thread1");
            }
        }
    }
    let spawn2: Future<Unit> = spawn {
        for (i in 0..ArrayLength) {
            try {
                let ob2 = Object2();
                ob2.test();
                array.get(i).getOrThrow().changeOb2(ob2);
            } catch (_) {
                print("oops!! in ${i} of thread2");
            }
        }
    }
    let spawn3: Future<Unit> = spawn {
        for (i in 0..ArrayLength) {
            try {
                array.get(i).getOrThrow().addVar4toObject1();
            } catch (_) {
                print("oops!! in ${i} of thread3");
            }
        }
    }
    spawn1.get();
    spawn2.get();
    spawn3.get();
    var i = 0;
    var count = 0;
    if (array.size == ArrayLength) {
        for (a in array) {
            if (a.var31.var1 == 5 && a.var32.var21 == 50) {
                count++;
                continue;
            } else {
                print("there is a error in ${count} of array, ${a.var31.var1}, ${a.var32.var21}");
                break;
            }
        }
    } else {
        print("The size of array is wrong!");
    }
    print(count);
}

main(): Int64 {
    Test1();
    asanGC()
    return 0;
}
