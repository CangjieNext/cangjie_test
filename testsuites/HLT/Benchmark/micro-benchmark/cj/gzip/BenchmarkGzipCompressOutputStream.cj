/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import stdx.compress.zlib.*
import std.io.*
import std.fs.*
import std.time.*
import std.convert.*

main(){
    var count: Array<(Int64,String,Int64)> = [(32,"32",100000),
                                               (256,"256",10000),
                                               (2*1024,"2M",1000),
                                               (16*1024,"16M",500),
                                               (128*1024,"128M",100),
                                               (1*1024*1024,"1G",100),
                                               (8*1024*1024,"8G",100),
                                               (64*1024*1024,"64G",100)]
    for (i in count){
        var filename="gzipL${i[0]}"
        var file=File(filename, ReadWrite)
        timeBenchmarkGzipCompressOutputStream(i[0],i[1],i[2],file)
    }
    return 0
}
public func BenchmarkGzipCompressOutputStream(sourceArray:Array<CompressOutputStream>,count:Int64,reps:Int64,tempBuf:Array<UInt8>){
   for (i in 0..reps){
        sourceArray[i].write(tempBuf)
        sourceArray[i].close()
   }
}
public func timeBenchmarkGzipCompressOutputStream(count:Int64,dataSize:String,reps:Int64,file:File):Int64{
    var tempBuf=readToEnd(file)
    var source= ByteBuffer()
    var compressOutputStream = CompressOutputStream(source,wrap:GzipFormat)
    var compressOutputStreamArray=Array<CompressOutputStream>(reps,repeat:compressOutputStream)
    for (i in 0..reps){
        source= ByteBuffer()
        compressOutputStream = CompressOutputStream(source,wrap:GzipFormat)
        compressOutputStreamArray[i]=compressOutputStream
    }
    var startTime = DateTime.now()
    BenchmarkGzipCompressOutputStream(compressOutputStreamArray,count,reps,tempBuf)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkGzipCompressOutputStream_${dataSize}: ${perTime.format(".2")} ns/op")
    return 0
}