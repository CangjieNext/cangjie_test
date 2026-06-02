/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.io.*
import std.fs.*
import stdx.compress.zlib.*

public func compressCj(srcpath: String, descpath: String, wrap: WrapType, compressLevel: CompressLevel, bufLen: Int64) : Unit{
    var inputStream: ByteBuffer = ByteBuffer()
    inputStream.write(File.readFrom(srcpath))

    var descFile = File(descpath, Write)
    var compressInputStream = CompressInputStream(inputStream, wrap: wrap, compressLevel: compressLevel, bufLen: bufLen)
    var buffer: Array<UInt8> = Array<UInt8>(128, repeat: 0)
    while (true) {
        var readNum = compressInputStream.read(buffer)
        if (readNum == 0) {
            break
        }
        descFile.write(buffer[0..readNum])
    }
    compressInputStream.close()
    descFile.close()
}
