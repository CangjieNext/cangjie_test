// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
 * 绑定参数，index 从 0 开始，当 index 不存在会抛异常
 * 可以对同一个位置重复 set，后值会覆盖前值
 * value 如果是 None 表示 SQL NULL
 * 参数 index - 参数所处的位置 index
 * 参数 value - 绑定指定下标位置的值，是一个 Option 类型。如果存在该值，将会绑定该值，如果不存在该值，绑定 SQL NULL
 */
main() {
    return DataModelStruct()
        .add(field<String>("name", name))
        .add(field<Int32>("tblOid", tblOid))
        .add(field<Int16>("tblAttrNum", tblAttrNum))
        .add(field<Int32>("datatypeOid", datatypeOid))
        .add(field<Int16>("datatypeLen", datatypeLen))
        .add(field<Int32>("typeModifier", typeModifier))
        .add(field<Int16>("fmtCode", fmtCode))
}
