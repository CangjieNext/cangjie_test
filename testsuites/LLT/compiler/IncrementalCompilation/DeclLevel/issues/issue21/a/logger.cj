package a

import std.fs.*

public class LoggerUtils {
    public static let PTE_LOGGER_PATH = checkLogFilePath()

    private static func checkLogFilePath() : Path {
        if (Configs.LOG_ROOT_PATH.isEmpty()) {
            throw Exception("LOG_ROOT_PATH is empty")
        }
        return Configs.LOG_ROOT_PATH
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
