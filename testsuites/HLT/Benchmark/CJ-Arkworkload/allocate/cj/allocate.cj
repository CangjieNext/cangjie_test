/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms


import std.time.*
import std.collection.*
import std.random.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}

let timer = Timer()

class Obj {
    public var num: Int64
    public init (num: Int64) {
        this.num = num;
    }
}


func AllocateObj() {
    let count = 100000;
    var data: Array<Obj> = [Obj(1), Obj(1), Obj(1), Obj(1), Obj(1)];
    let resources: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84];
    let resourcesLength = resources.size - 1;
    timer.start();
    for (i in 0..count) {
        if ((resources[i & resourcesLength] & 1) == 0) {
            data[i & 4] = Obj(i);
        } else {
            data[i & 4] = Obj(i - 5);
        }
    }
    let time = timer.stop();
    var res = 0;
    for (i in 0..data.size) {
        res += data[i].num;
    }
    println("Allocate Obj :\t${Float64(time.toNanoseconds())/1000000.0}\tms");
}


main(){
   AllocateObj();
   return 0
}
