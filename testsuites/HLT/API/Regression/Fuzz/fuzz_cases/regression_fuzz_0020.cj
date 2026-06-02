/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows)RUN-EXEC: %run %run_opt %output %run_args

import std.fs.*
import std.posix.*
import std.process.*
import std.runtime.*
import std.argopt.*
import std.collection.ArrayList

main(): Int64 {
    Directory.create("./images")
    File.create("./images/customer1.eaeb6b15.png")
    File.create("./images/customer2.477954d8.png")
    File.create("./images/customer3.fs31a9e0.png")
    File.create("./images/demo1.11f9a480.jpg")
    File.create("./images/demo2.63c13aeb.jpg")
    File.create("./images/disanfanghub.fa2c528e.png")
    File.create("./images/fanwuliangwang.a3fbcce5.png")
    File.create("./images/illustration.a04dd7ad.png")
    File.create("./images/img1.146c9df4.png")
    File.create("./images/shape0.25dbd788.png")
    File.create("./images/shape1.756c33cd.png")
    File.create("./images/shape2.06bc9f37.png")
    File.create("./images/shape3.c22ad469.png")
    File.create("./images/shape4.25c477ae.png")
    File.create("./images/shape5.e0c78db6.png")
    File.create("./images/shape6.032f71b4.png")
    File.create("./images/yidongkuangjia.eb84eb17.png")
    chdir("./images")
    let files = getFileList(Process.current.workingDirectory.toString())
    remove(FileInfo(Process.current.workingDirectory).path, recursive: true)
    if (files.size == 17) {
        let ao = ArgOpt(Process.current.arguments, "", ["asan"])
        let map = ao.getArgumentsMap()
        if (map.contains("--asan")) {
            GC()
            sleep(Duration.second * 2)
        }
        return 0
    }
    return 1
}

func getFileList(path: String): ArrayList<FileInfo> {
    let infos = ArrayList<FileInfo>()
    Directory.walk(path) {
        info =>
        infos.add(info)
        true
    }
    return infos
}
