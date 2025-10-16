// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
import std.collection.enumerate
 
class Solution {
    func minimumArea(grid: Array<Array<Int64>>): Int64 {
        // 遍历所有为1点，记录横纵坐标最大值
        let m = grid.size
        let n= grid[0].size
        var maxX = 0;
        var maxY = 0;
        var minX = m;
        var minY = n;
        for ((i, row) in enumerate(grid)) {
            for ((j, cell) in enumerate(row)) {
                if (cell == 1) {
                    maxX = max(maxX, i)
                    maxY = max(maxY, j)
                    minX = min(minX, i)
                    minY = min(minY, j)
                }
            }
        }
        // 计算矩形面积
        return (maxX - minX + 1) * (maxY - minY + 1);
    }
}
 
main(): Int64 {
// 输入： grid = [[0,1,0],[1,0,1]]
 
// 输出： 6
    
    println(Solution().minimumArea([[0,1,0],[1,0,1]]))
    return 0
}