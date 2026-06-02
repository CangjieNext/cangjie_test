// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@When[os]
main() {
    return 0
}

@When[!!debug]
main() {
    return 0
}

@When[!!!debug]
main() {
    return 0
}

@When[os == "Linux"]
main() {
    print("linux\n")
    return 0
}

@When[os == "Windows"]
main() {
    print("windows\n")
    return 0
}

@When[os == "macOSX"]
main() {
    print("macOSX\n")
    return 0
}

@When[os == "wasi"]
main() {
    print("wasi\n")
    return 0
}

@When[os == "ios"]
main() {
    print("ios\n")
    return 0
}

@When[os == "android"]
main() {
    print("android\n")
    return 0
}

@When[os == "unix"]
main() {
    return 0
}

@When[os == "freeBSD"]
main() {
    return 0
}

extend Unit {
    func foo() {
        0
    }
}

@When[backend == "cjnative"]
main() {
    var m = Mutex()
    (synchronized(m) {}).foo()
}
