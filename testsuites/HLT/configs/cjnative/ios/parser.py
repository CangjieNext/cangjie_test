#!/usr/bin/env python3
"""
增强版Cangjie测试类提取器
支持嵌套类、泛型类等复杂情况
"""

import sys
from dataclasses import dataclass
from typing import List, Dict, Any, Optional

@dataclass
class TestClassInfo:
    """测试类信息"""
    name: str
    line_number: int
    generics: List[str] = None
    annotations: List[str] = None
    
    def __post_init__(self):
        if self.generics is None:
            self.generics = []
        if self.annotations is None:
            self.annotations = []

class AdvancedCangjieParser:
    """增强版解析器"""
    
    def __init__(self):
        self.class_keywords = {'class', 'struct', 'interface'}
        self.annotation_keywords = {'Test', 'Bench', 'Types', 'Configure', 'Expect'}
    
    def parse_file(self, file_path: str) -> List[TestClassInfo]:
        """解析文件并返回详细的测试类信息"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            return self.parse_content(content, file_path)
            
        except Exception as e:
            print(f"解析文件出错 {file_path}: {e}")
            return []
    
    def parse_content(self, content: str, file_name: str = "unknown") -> List[TestClassInfo]:
        """解析内容并返回测试类信息"""
        lines = content.split('\n')
        test_classes = []
        current_annotations = []
        brace_stack = []
        i = 0
        
        while i < len(lines):
            line = lines[i].strip()
            line_num = i + 1
            
            # 收集注解
            if line.startswith('@'):
                annotation = line[1:].split()[0].split('(')[0]
                if annotation in self.annotation_keywords:
                    current_annotations.append(annotation)
            
            # 查找类定义
            elif any(line.startswith(kw + ' ') for kw in self.class_keywords):
                # 检查是否有@Test注解
                if 'Test' in current_annotations:
                    # 提取类信息
                    class_info = self.extract_class_info(line, line_num)
                    class_info.annotations = current_annotations.copy()
                    test_classes.append(class_info)
                
                # 清空当前注解（新类开始）
                current_annotations.clear()
            
            # 处理花括号（跟踪嵌套）
            for char in line:
                if char == '{':
                    brace_stack.append(line_num)
                elif char == '}':
                    if brace_stack:
                        brace_stack.pop()
            
            i += 1
        
        return test_classes
    
    def extract_class_info(self, class_line: str, line_num: int) -> TestClassInfo:
        """从类定义行提取类信息"""
        # 移除开头的class关键字
        class_decl = class_line.split(' ', 1)[1].strip()
        
        # 提取类名（处理泛型）
        class_name = class_decl.split()[0]
        if '<' in class_name:
            class_name = class_name.split('<')[0]
        
        # 提取泛型参数
        generics = []
        if '<' in class_decl and '>' in class_decl:
            generics_start = class_decl.find('<')
            generics_end = class_decl.find('>')
            generics_str = class_decl[generics_start+1:generics_end]
            generics = [g.strip() for g in generics_str.split(',')]
        
        return TestClassInfo(
            name=class_name,
            line_number=line_num,
            generics=generics
        )

def main():
    """主函数"""
    if len(sys.argv) != 2:
        print("用法: python extract_test_classes.py <文件路径>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    
    # 使用增强版解析器
    parser = AdvancedCangjieParser()
    test_classes = parser.parse_file(file_path)
    
    print("测试类详细信息:")
    for i, class_info in enumerate(test_classes, 1):
        print(f"{i}. {class_info.name}")
        print(f"   行号: {class_info.line_number}")
        print(f"   注解: {', '.join(class_info.annotations)}")
        if class_info.generics:
            print(f"   泛型: {', '.join(class_info.generics)}")
        print()

if __name__ == "__main__":
    main()
