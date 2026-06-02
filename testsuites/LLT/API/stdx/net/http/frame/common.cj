/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package frameUtils

public let prism = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray()
public let settings: Array<UInt8> = [0, 0, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
public let settingsAck: Array<UInt8> = [0, 0, 0, 4, 1, 0, 0, 0, 0]
public let bigFrameHead: Array<UInt8> = [255, 255, 255, 255, 255, 255, 255, 255, 255]
public let headersWithPadding: Array<UInt8> = [0, 0, 53, 1, 12, 0, 0, 0, 1, 10, 63, 225, 31, 65, 139, 8, 157, 92, 11,
    129, 112, 220, 105, 176, 5, 159, 130, 135, 68, 131, 98, 121, 63, 122, 145, 189, 14, 156, 89, 114, 96, 225, 187, 6,
    216, 113, 96, 211, 190, 33, 68, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
public let normalHeader: Array<UInt8> = [0, 0, 42, 1, 4, 0, 0, 0, 1, 63, 225, 31, 65, 139, 8, 157, 92, 11, 129, 112, 220,
    105, 176, 5, 159, 130, 135, 68, 131, 98, 121, 63, 122, 145, 189, 14, 156, 89, 114, 96, 225, 187, 6, 216, 113, 96,
    211, 190, 33, 68, 15]
public let priorityUpdate: Array<UInt8> = [0, 0, 21, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 112, 114, 105, 111, 114, 105, 116,
    121, 32, 61, 32, 117, 61, 53, 44, 32, 105]
