/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output --ip=0.0.0.0 --port=8080
import std.argopt.*
import std.collection.*

func paserMainArgs(args: Array<String>): ArgOpt {
    return ArgOpt(args.toArray(), "ds:fd:fd:", ["ip=", "port="])
}

main(args: Array<String>) {
    let parsedArgs = paserMainArgs(args);
    var ip = parsedArgs.getArg("--ip").getOrThrow()
    var port = parsedArgs.getArg("--port").getOrThrow()
    //未解析
    var allnot = parsedArgs.getUnparseArgs()
    if (allnot.size != 0) {
        println("allnot.size=" + allnot.size.toString())
        return 1
    }
    //解析后得到的hashset
    var allmap = parsedArgs.getArgumentsMap()
    //hashset：解析后拿到的所有的key
    var keys = allmap.keys()
    var expect_keys = HashSet<String>(["--ip", "--port"])
    for (i in keys) {
        for (j in expect_keys) {
            if (!(expect_keys.contains(i) && keys.contains(j))) {
                println("Fail")
                return 2
            }
        }
    }
    //hashset：解析后拿到的所有的value
    var values = allmap.values()
    var act_values = HashSet<String>(values)
    var expect_values = HashSet<String>(["8080", "0.0.0.0"])
    if (!(act_values.contains(all: expect_values) && expect_values.contains(all: act_values))) {
        return 3
    }
    println("Success")
    return 0
}
