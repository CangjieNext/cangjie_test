#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import xml.dom
from xml.etree import ElementTree as ET
def build_sitemap(attrNums,depth,nodeNums):
    filename = "xmlA%dD%dN%d" % (attrNums, depth, nodeNums)
    if(depth<=0):
        raise Exception("depth must more than 1")
    elif(depth==1):
        ele = ET.Element("nodeRoot")
        for i in range(attrNums):
            attrName="attr0%d"%(i+1)
            ele.set(attrName,"%d"%(i+1))
        for j in range(nodeNums):
            subnode=ET.SubElement(ele,"subNode%d"%(j+1))
            subnode.text="content"
        tree = ET.ElementTree(ele)
        tree.write("%s.xml"%("../../cj/xml/"+filename))
        tree.write("%s.xml"%("../../go/xml/"+filename))
        tree.write("%s.xml"%("../../java/xml/"+filename))
    else:
        ele=ET.Element("nodeRoot")
        tempNode=ele
        for i in range(attrNums):
            attrName="attr0%d"%(i+1)
            ele.set(attrName,"%d"%(i+1))
        for j in range(nodeNums):
            subnode=ET.SubElement(ele,"subNode%d"%(j+1))
            subnode.text="content"
        for i in range(depth):
            tempNode = ET.SubElement(tempNode,"depthNode%d"%(i+1))
            tempNode.text = "content"
        tree = ET.ElementTree(ele)
        tree.write("%s.xml"%("../../cj/xml/"+filename))
        tree.write("%s.xml"%("../../go/xml/"+filename))
        tree.write("%s.xml"%("../../java/xml/"+filename))
if __name__ == '__main__':
    attrNums=[512,4*1024,32*1024]
    nodeNums= [512,4*1024,32*1024]
    depths=[2,4,8,32]
    for i in attrNums:
        for j in depths:
            for k in nodeNums:
                build_sitemap(i,j,k)