// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let a = "test"
    let b = """
    ${a + "_abc"}
    """
    println(b)
    let UPDATE_USAGE: String = """
    Update the module.json to module-resolve.json.

    Usage:
      cpm update [flag]

    Available flags:
      -h, --help   help for update."""
}
