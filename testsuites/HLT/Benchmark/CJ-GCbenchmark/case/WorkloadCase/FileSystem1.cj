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
import std.fs.*
import std.collection.*
import std.time.*
import std.math.*

var seed: Int64 = 49734321

func resetSeed(): Unit {
    seed = 49734321
}

func operate(lhs: Int64, rhs: Int64): Int64 {
    if (lhs >= 0) {
        return lhs >> rhs
    } else {
        return (Int64.Max + lhs + 1) >> rhs | (1 << (63 - rhs))
    }
}

let random = { =>  { =>
        // Robert Jenkins' 32 bit integer hash function.
        seed = ((seed + 0x7ed55d16) + (seed << 12)) & 0xffffffff
        seed = ((seed ^ 0xc761c23c) ^ (operate(seed, 19))) & 0xffffffff
        seed = ((seed + 0x165667b1) + (seed << 5))  & 0xffffffff
        seed = ((seed + 0xd3a2646c) ^ (seed << 9))  & 0xffffffff
        seed = ((seed + 0xfd7046c5) + (seed << 3))  & 0xffffffff
        seed = ((seed ^ 0xb55a4f09) ^ (operate(seed, 16))) & 0xffffffff
        return Float64(seed & 0xfffffff) / Float64(0x10000000)
    }
}()

func randomFileContents(bytes!: Int64 = (operate(Int64(random() * Float64(128)), 0)) + 2056): Array<UInt8> {
    var result = Array<UInt8>(bytes, repeat: 0)
    for (i in 0..bytes) {
        result[i] = (UInt8(operate(Int64(random() * Float64(255)), 0)))
    }
    return result
}

class File {
    private var _data: Array<UInt8>
    init(dataView: Array<UInt8>) {
        _data = dataView
    }
    public mut prop data: Array<UInt8> {
        set(newValue) {
            _data = newValue
        }
        get() {
            return _data
        }
    }
    func swapByteOrder() {
        for (i in 0..data.size) {
            data[i] = data[data.size-1-i]
        }
    }
}


class Directory {
    var structure: HashMap<String, Any>

    init() {
        structure = HashMap<String, Any>()
    }

    // 异步调用
    func addFile(name: String, file: File): File {
        let entry = structure.get(name)
        if (entry.isSome()) {
            if (entry is File){
                throw Exception("Can't replace file with file.")
            }
            if (entry is Directory){
                throw Exception("Can't replace a file with a new directory.")
            }
            throw Exception("Should not reach this code")
        }
        structure[name] = file
        return file
    }

    func addDirectory(name: String, directory!: Directory = Directory()): Directory {
        let entry = structure.get(name)
        if (entry.isSome()) {
            if (entry is File){
                throw Exception("Can't replace file with directory.")
            }
            if (entry is Directory){
                throw Exception("Can't replace directory with new directory.")
            }
            throw Exception("Should not reach this code")
        }
        structure[name] = directory
        return directory
    }

    // 异步调用 [(name: String, entry: Any, isDirectory: Bool)]
    func ls(): ArrayList<(String, Any, Bool)> {
        var result = ArrayList<(String, Any, Bool)>()
        for (item in structure) {
            result.add((item[0], item[1], (item[1] is Directory)))
        }
        return result
    }

    // 异步调用 [(name: String, entry: Any, isDirectory: Bool)]
    func forEachFile(): ArrayList<(String, Any, Bool)> {
        var result = ArrayList<(String, Any, Bool)>()
        var thread0 = spawn {
            ls()
        }
        for (item in thread0.get()) {
            if (!item[2]) {
                result.add(item)
            }
        }
        return result
    }
    
    // 异步调用
    func forEachFileRecursively(): ArrayList<(String, Any, Bool)> {
        var result = ArrayList<(String, Any, Bool)>()
        var thread0 = spawn {
            ls()
        }
        for (item in thread0.get()) {
            if (item[2]) {
                var thread1 = spawn {
                    (item[1] as Directory).getOrThrow().forEachFileRecursively()
                }
                for (file in thread1.get()) {
                    result.add(file)
                }
            } else {
                result.add(item)
            }
        }
        return result
    }

    func forEachDirectoryRecursively(): ArrayList<(String, Any, Bool)> {
        var result = ArrayList<(String, Any, Bool)>()
        var thread0 = spawn {
            ls()
        }
        for (item in thread0.get()) {
            if (!item[2]) {
                continue
            }
            var thread1 = spawn {
                (item[1] as Directory).getOrThrow().forEachDirectoryRecursively()
            }
            for (dirItem in thread1.get()) {
                result.add(dirItem)
            }
            result.add(item)
        }
        return result
    }
    
    func fileCount(): Int64 {
        var count = 0
        var thread0 = spawn {
            ls()
        }
        for (item in thread0.get()) {
            if (!item[2]) {
                count += 1
            }
        }
        return count
    }
    
    func rm(name:String): Bool {
        return structure.remove(name).isSome()
    }
}

    // 异步调用
func setupDirectory(): Directory {
    let fs = Directory()
    var dirs = ArrayList<Directory>([fs])

    for (index in 0..250) {
        let dir = dirs[index]
        for (i in 0..8) {
            if (dirs.size < 250 && random() >= 0.3) {
                var thread0 = spawn {
                    dir.addDirectory("dir-${i}")
                }
                dirs.add(thread0.get())
            }
        }
    }
    
    for (dir in dirs) {
        for (i in 0..5) {
            if (random() >= 0.6) {
                var thread1 = spawn {
                    dir.addFile("file-${i}", File(randomFileContents()))
                }
                thread1.get()
            }
        }
    }
    
    return fs
}

//以下是测试打印日志相关代码
let isDebug = false
func printLog(str: String): Unit {
    println(str)
}
/*
 * @State
 * @Tags Jetstream2
 */
class FileSystem1 {
    /*
   * @FileSystem1
   */
    static func runIteration(): Unit { 
        resetSeed()
        var thread0 = spawn {
            setupDirectory()
        }
        let fs = thread0.get()
        if (isDebug) {
            let dirs = spawn {
                fs.forEachDirectoryRecursively()
            }
            let files = spawn {
                fs.forEachFileRecursively()
            } 

        }
        var thread1 = spawn {
            fs.forEachFileRecursively()
        }
        for (file in thread1.get()) {
            (file[1] as File).getOrThrow().swapByteOrder()
        }
        var thread2 = spawn {
            fs.forEachDirectoryRecursively()
        }
        for (item in thread2.get()) {
            let dir = (item[1] as Directory).getOrThrow()
            if (dir.fileCount() > 3) {
                if (isDebug) {
                    let deles = dir.fileCount()

                }
                for (name in dir.forEachFile()) {
                    let result = dir.rm(name[0])
                    if (!result) {
                        throw Exception("rm should have returned true")
                    }
                }
            }
        }
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

func addLoop(times: Int64) {
    let startTime = Timer().getTime()
    var threads = Array<Future<Unit>>(times) { _ =>
        spawn {
            FileSystem1.runIteration()
        }
    }
    for (thread in threads) {
        thread.get()
    }
    let endTime = Timer().getTime()
    println("FileSystem1: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}

main() {
    addLoop(10)
}