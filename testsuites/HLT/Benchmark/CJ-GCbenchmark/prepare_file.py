# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import shutil
import pathlib
import tools as tl

workspace = pathlib.Path(os.path.dirname(__file__)).absolute()


def delete_data(csv_file):
    path = pathlib.Path.joinpath(workspace, "tmp")
    if pathlib.Path.exists(pathlib.Path.joinpath(path, csv_file)):
        print(tl.current_time(), end=" ")
        print("Please delete {}".format(csv_file))
        return False
    else:
        shutil.rmtree(path=path, ignore_errors=True)
        pathlib.Path.mkdir(path)
    return True


def prepare_dir(csv_file, case_path, onlydirs, env=None):
    """
    csv_file：结果保存文件名称
    case_path：用例的路径
    onlydirs：需要统计的用例名称，以列表形式传参
    env：执行命令时的环境变量，只需要传入额外要添加的环境变量，以字典形式传参
    """
    if not delete_data(csv_file):
        return False
    for i in onlydirs:
        if not os.path.exists(pathlib.Path.joinpath(workspace, "tmp", i)):
            pathlib.Path.mkdir(pathlib.Path.joinpath(workspace, "tmp", i))
            
            try:
                shutil.copytree(pathlib.Path.joinpath(pathlib.Path(case_path), i), pathlib.Path.joinpath(workspace, "tmp", i, 'code'))
            except FileNotFoundError:
                pass
    if not os.path.exists(pathlib.Path.joinpath(workspace, "result")):
        pathlib.Path.mkdir(pathlib.Path.joinpath(workspace, "result"))
    os.chdir(workspace)
    print(tl.current_time(), end=" ")
    print("prepare the file is OK")
    return True
