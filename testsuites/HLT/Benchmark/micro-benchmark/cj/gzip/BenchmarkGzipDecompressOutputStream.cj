/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args2>&1 | compare %f
// ASSERT: scan ns/op

import stdx.compress.zlib.*
import std.io.*
import std.fs.*
import std.time.*
import std.convert.*
let reps = 1000

main(){
    var count:Array<(Int64,String,Int64)>=[(32,"32",100000),
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
        timeBenchmarkGzipDecompressOutputStream(i[0],i[1],i[2],file)
    }
    return 0
}

public func timeBenchmarkGzipDecompressOutputStream(count:Int64,dataSize:String,reps:Int64,file:File):Int64{
    var desc=gzipcompress(file)
    var outputStream = ByteBuffer()
    var decompressOutputStream = DecompressOutputStream(outputStream,wrap:GzipFormat)
    var decompressOutputStreamArray=Array<DecompressOutputStream>(reps,repeat:decompressOutputStream)
    for (i in 0..reps){
       outputStream=ByteBuffer()
       decompressOutputStreamArray[i]=DecompressOutputStream(outputStream,wrap:GzipFormat)
    }
    var startTime = DateTime.now()
    BenchmarkGzipDecompressOutputStream(desc,decompressOutputStreamArray,reps)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkGzipDecompressOutputStream_${dataSize}: ${perTime.format(".2")} ns/op")
    return 0
}

public func BenchmarkGzipDecompressOutputStream(desc:ByteBuffer,decompressOutputStreamArray:Array<DecompressOutputStream>,reps:Int64){
   for (i in 0..reps){
        decompressOutputStreamArray[i].write(readToEnd(desc))
        decompressOutputStreamArray[i].close()
   }
}

public func gzipcompress(file:File):ByteBuffer{
    var source=file
    var desc: ByteBuffer = ByteBuffer()
    var compressInputStream: CompressInputStream = CompressInputStream(source,wrap:GzipFormat)
    var tempBuf: Array<UInt8> =Array<UInt8>(1024,repeat:0)
    while(true){
       var result=compressInputStream.read(tempBuf)
       if(result==0){
          break
       }
       desc.write(tempBuf[0..result])
    }
    compressInputStream.close()
    return desc
}
