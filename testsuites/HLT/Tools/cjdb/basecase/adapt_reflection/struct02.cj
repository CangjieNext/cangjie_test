/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct C1<T> {
    public let length: T
    private var width: Int32 = 0
    protected let diagonalLength: Int32 = 0
    public var varBool: Bool = true
    public var varchar: Rune = '5'
    public var str: String = "strmao"
    public var arrayInt8: Array<Int8> = [10, 20, 30]
    public static var name: String = "Rec"
    public static var sta_num: Int32 = 0

    public init(length: T) {
        this.length = length
    }
}

let mc = C1<Int64>(3)
let mlength = mc.length
var mvarBool: Bool = mc.varBool

main() {
    let m_c = C1<Int64>(3)
    let m_length = m_c.length
    var m_varBool: Bool = m_c.varBool
    var m_varchar: Rune = m_c.varchar
    var m_varchar2 = m_c.diagonalLength
    var m_str: String = m_c.str
    var m_arrayInt8: Array<Int8> = m_c.arrayInt8
    var m_name: String = C1<Int64>.name

    return 0
}
