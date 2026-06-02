/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

const AF_INET: Byte = 2
@When[os == "Linux"]
const os = "linux"
@When[os == "Linux"]
const AF_UNIX: Byte = 1
@When[os == "Linux"]
const AF_INET6: Byte = 10
@When[os == "Linux"]
const AF_NETLINK: Byte = 16
@When[os == "Linux"]
const AF_PACKET: Byte = 17
@When[os == "Windows"]
const os = "windows"
@When[os == "Windows"]
const AF_UNIX: Byte = 0
@When[os == "Windows"]
const AF_INET6: Byte = 23
@When[os == "macOS"]
const os = "macOS"
@When[os == "macOS"]
const AF_UNIX: Byte = 1
@When[os == "macOS"]
const AF_INET6: Byte = 30

@When[os == "macOS"]
func getSocketFamily(family: Byte): Array<Byte> {
    match {
        case family == AF_INET => [16, family]
        case family == AF_INET6 => [28, family]
        case family == AF_UNIX => [110, family]
        case _ => [0, family]
    }
}

@When[os != "macOS"]
func getSocketFamily(family: Byte): Array<Byte> {
    match {
        case family == AF_INET => [family, 0]
        case family == AF_INET6 => [family, 0]
        case family == AF_UNIX => [family, 0]
        case _ => [family, 0]
    }
}
