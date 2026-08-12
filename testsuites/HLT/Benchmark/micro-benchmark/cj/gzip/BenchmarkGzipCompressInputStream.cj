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
    //Array<(Int64,String,Int64)>：Size:Name:reps
    var count:Array<(Int64,String,Int64)>=[(32,"32",1000000),
                                           (256,"256",100000),
                                           (2*1024,"2M",10000),
                                           (16*1024,"16M",5000),
                                           (128*1024,"128M",1000),
                                           (1*1024*1024,"1G",1000),
                                           (8*1024*1024,"8G",1000),
                                           (64*1024*1024,"64G",1000)]
    for (i in count){
        var filename="gzipL${i[0]}"
        var file=File(filename, ReadWrite)
        timeBenchmarkGzipCompressInputStream(i[0],i[1],i[2],file)
    }
    return 0
}
public func BenchmarkGzipCompressInputStream(sourceArray:Array<CompressInputStream>,reps:Int64,tempBuf: Array<UInt8>){
    for (i in 0..reps){
        while(true){
           var result2=sourceArray[i].read(tempBuf)
           if(result2==0){
              break
           }
        }
        sourceArray[i].close()
    }
}
public func timeBenchmarkGzipCompressInputStream(count:Int64,dataSize:String,reps:Int64,source:InputStream):Int64{
    var compressInputStream: CompressInputStream = CompressInputStream(source,wrap:GzipFormat)
    var sourceArray=Array<CompressInputStream>(reps,repeat:compressInputStream)
    var tempBuf=Array<UInt8>(1024,repeat:0)
    var startTime = DateTime.now()
    BenchmarkGzipCompressInputStream(sourceArray,reps,tempBuf)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkGzipCompressInputStream_${dataSize}: ${perTime.format(".2")} ns/op")
    return 0
}