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

class File {
    var fileName: String
    var data: String
    static var directory = HashMap<String, File>()
    init( fileNames: String,  datas: String) {
        fileName = fileNames
        data = datas
        if ( (File.directory.get(fileName).isSome())) {
            print("Creating file named " + "${fileName}" + " that already exists")
            return
        } else {
            File.directory.add(fileName , this)
        }
    }
    static func open( fileName: String) : File {
        return File.directory.get(fileName).getOrThrow()
    }
    func read() : String {
        return data
    }
}
