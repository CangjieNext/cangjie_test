/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.time.*
import std.convert.*

private let ONE_THOUSAND: Float64 = 1000.0
private let LOOP_COUNT = 1

public class BenchMark {
    
    let allJsFiles = [airBlob, babylonBlob, inspectorBlob, basicBlob]
    

    func parse(input: String, options: ParserOptions) : Node {
        return Parser(options, input).parse();
    }
    
    func runIteration() {
        var i = 0
        for (source in allJsFiles) {
            let options = ParserOptions()
            if (i == 1) {
                options.sourceType = "module"
            }
            let parser = Parser(options, source)
            let node = parser.parse()
            i += 1
        }
    }
    
    /*
    * @Benchmark
    */
    func run() {
        let startTime = Timer().getTime()
//        let startTime = Date().timeIntervalSince1970 * ONE_THOUSAND * ONE_THOUSAND
        for (_ in 0..LOOP_COUNT) {
            runIteration()
        }
        let endTime = Timer().getTime()
//        let endTime  = Date().timeIntervalSince1970 * ONE_THOUSAND * ONE_THOUSAND
        println("babylon: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
    }
    
}

// 提交文件
public class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}
