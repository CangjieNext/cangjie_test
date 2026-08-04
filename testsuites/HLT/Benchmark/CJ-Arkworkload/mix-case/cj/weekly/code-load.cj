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
import std.random.*

private let LOOP_NUM: Int64 = 120
private let TIMES: Float64 = 1000.0

private let loadString: String = " "


/**
 * @State
 * @Tags Jetstream2
 */
private class Benchmark {
    /**
     * @Benchmark
     */
    func run() {
        let content = "let _____top_level_____ = " + "${Random().nextFloat64()}" + ";" + "${loadString}"
        let startTime = Timer().getTime()

        for( _ in 0..LOOP_NUM) {
            let codeLoad = CodeLoad(content)
        }
        let endTime = Timer().getTime()
        println("code-load: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
    }
}

private class CodeLoad {
    var text: String = ""
    var index: Int64 = 0
    init(content: String) {
        this.prepareForNextIteration(content)
    }
    
    func prepareForNextIteration(content: String) {
        this.text = "function test${index}() { ${content} }"

        if (!this.text.startsWith("f")) {
            println("Error - f")
        } else if (!this.text.endsWith("}")) {
            println("Error - }")
        } else {
            this.index += 1
        }
//        
    }
}

private let isDebug: Bool = false
private func debugLog(msg: String) {
    if (isDebug) {
        print("${msg}")
    }
}

private class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    Benchmark().run()
}
