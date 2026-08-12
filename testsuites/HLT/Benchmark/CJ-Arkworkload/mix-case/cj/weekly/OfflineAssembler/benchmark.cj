/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*

let isDebug: Bool = false
func DeBugLog( msg: Any) {
    if ( isDebug) {
        print("${(msg as ToString).toString()}")
    }
}

/**
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    var ast: ?Sequence
    init() {
        this.ast = Option<Sequence>.None
    }
    
    /**
     * @Steup
     */
    func setup() {
        LowLevelInterpreter64()
    }
    
    /**
     * @Benchmark
     */
    func runIteration() {
        resetAST()
        ast = parse("LowLevelInterpreter64.asm")
    }
    
    func validate() {
        let astDumpedAsLines: Array<String> = ast.getOrThrow().dump().split("\n")
        if ( (astDumpedAsLines.size != expectedASTDumpedAsLines.size)) {
            print("Actual number of lines (" + "${astDumpedAsLines.size}" + ") differs from expected number of lines(" + "${expectedASTDumpedAsLines.size}" + ")")
        }
        
        var index = 0
        for ( line in astDumpedAsLines) {
            let expectedLine = expectedASTDumpedAsLines[index]
            if ( line != expectedLine) {
                println("Line #" + "${index + 1}" + " differs.  Expected: " + "${expectedLine}" + ",\n got " + "${line}")
            }
            index += 1
        }
    }
}

func run() {
    let startTime = Timer().getTime()
    
    let benchMark = Benchmark()
    benchMark.setup()
    benchMark.runIteration()
    benchMark.validate()
    let endTime = Timer().getTime()
    let duration = (endTime - startTime) / 1000
    println("OfflineAssembler: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}



class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }

}
