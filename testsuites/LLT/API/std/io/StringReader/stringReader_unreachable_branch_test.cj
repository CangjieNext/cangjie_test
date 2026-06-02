/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: input.txt
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test Test description:This test case is designed to test the hard-to-reach branches of the code.
 * Test API: public init(input: InputStream)
 *           public func readToEnd(): String
 */

internal import std.io.*
internal import std.fs.*

main() {
    var file = File("input.txt", Read)
    var bas = ByteBuffer()
    var buff = Array<Byte>(10000, repeat: 0)
    file.read(buff)
    bas.write(buff)
    file.close()
    var sr = StringReader(bas)
    sr.readToEnd()
    if (sr.readToEnd() != "") {
        return -1
    }
    return 0
}
