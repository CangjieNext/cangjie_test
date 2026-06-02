/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

func run(): Int64 {
    var x1: Father = Father(3)
    var x2: Son = Son(3)
    var x3: Father = Son(3)
    var res1 = Data(x: x1)
    var res2 = Data(x2)
    var res3 = Data(x: x3)
    print(res3.x.fv.toString() + "\n")
    if (res1.x.fv == 7 && res2.x.fv == 4 && res3.x.fv == 104) {
        return 0
    }
    return 1
}

class Data {
    public var x: Father = Father(1)
    public var z: Son = Son(1)
    public var y: Int32 = 2
    public init(x!: Father, y!: Int32 = 4) {
        this()
        this.x = Father(x.fv + y)
    }
    public init(x: Son) {
        this()
        this.x = Father(x.sv + 1)
    }
    public init() {
        print("yes")
    }
}

open class Father {
    public var fv: Int32 = 100
    public init() {}
    public init(v: Int32) {
        this.fv = v
    }
}

class Son <: Father {
    public var sv: Int32 = 10
    public init(v: Int32) {
        super()
        this.sv = v
    }
}
