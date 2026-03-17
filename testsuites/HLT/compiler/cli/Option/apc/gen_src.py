# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

s = ''

s += '''
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

'''

scale = 100

for i in range(scale):
    f = f'''
public func test_{i}(): Unit {{

}}
'''
    s += f

s += '''
main(): Unit {
'''

for i in range(scale):
    s += f'test_{i}()\n'


s += '''
}
'''

with open(r'main.cj', 'w', encoding='utf-8') as f:
    f.write(s)
