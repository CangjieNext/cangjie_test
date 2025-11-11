// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 * Global variable `directories` is array of system library path.
 * Global function `getPythonPathBySysLib()` can find python library in `dirs`.
 */

internal import std.fs.*

@When[os == "Linux"]
let suffixOfDy = ".so"
@When[os == "macOS"]
let suffixOfDy = ".dylib"

var directories = ["/lib/", "/usr/lib/", "/usr/local/lib/"]

func getPythonPathBySysLib(dirs: Array<String>): String {
    for (directory in dirs) {
        if (!exists(directory)) {
            continue
        }
        var fileList = Directory.readFrom(directory)
        var dstName = "libpython3."
        var minor = 20
        while (minor > 0) {
            for (fileInfo in fileList) {
                var filePathStr = fileInfo.path.toString()
                var isPythonLib = filePathStr.indexOf(dstName + minor.toString()) ?? -1
                var isSo = filePathStr.indexOf(suffixOfDy) ?? -1
                if (isPythonLib != -1 && isSo != -1) {
                    println("Found lib: ${filePathStr}.")
                    return filePathStr
                }
            }
            minor--
        }
    }
    print("Can\'t find lib in system library paths.\n")
    return ""
}