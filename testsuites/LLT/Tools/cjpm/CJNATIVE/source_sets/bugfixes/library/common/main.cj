// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@NonProduct
features {}
package testing 

import xml_ffi.xmlFFICall
import simple_ui.indexcall

main(): Int64 {
	xmlFFICall()
	indexcall()
	return 0
}
