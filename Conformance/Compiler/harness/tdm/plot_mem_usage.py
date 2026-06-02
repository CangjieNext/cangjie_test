# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import logging
import plotly.express as px
import pandas as pd
from datetime import datetime
from os.path import exists, isfile


def create_parser():
  '''Gantt plot arguments parser'''
  parser = argparse.ArgumentParser(
      description='Building a memory usage chart for running tests in Cangjie. Based on mprof report file.', formatter_class=argparse.RawTextHelpFormatter)
  parser.add_argument('--data-file', '-i', action='append', dest='data_files', required=True,
                      help='Path to file with test run data')
  parser.add_argument('--output-file', '-o', action='store', dest='output_file', required=True,
                      help='Path to the file to save the HTML with Gantt chart.')
  return parser


def process_args(parser: argparse.ArgumentParser):
  '''Process arguments from arguments parser'''
  args = parser.parse_args()
  # input data
  data_files = []
  for data_file in args.data_files:
    if exists(data_file) and isfile(data_file):
      logging.info('The data file: %s', data_file)
      data_files.append(data_file)
    else:
      logging.warning('The path to the data file is incorrect: %s . Skipped.', data_file)
  if len(data_files) == 0:
    logging.error('No one data file was found to process')
    exit(1)

  # output file
  if exists(args.output_file) and isfile(args.output_file):
    logging.warning('The output file %s already exists. It will be overwritten.', args.output_file)

  report_file = args.output_file
  logging.info('The output file: %s', report_file)

  return data_files, report_file


def create_memory_chart(data_files, report_file):
  '''Create memory chart from data file and store it to report file'''
  fig = None
  data = []
  command = ''
  for data_file in data_files:
    with open(data_file, 'r', encoding='utf-8') as read_file:
      lines = read_file.readlines()
      command = ' '.join(lines[0].strip().split(' ')[1:])
      last_option = ' '.join(command.split(' ')[-2:])
      start_time = float(lines[1].strip().split(' ')[2])
      for line in lines:
        if line.startswith('MEM'):
          split_line = line.strip().split(' ')
          row = dict(mem=float(split_line[1]), tick=float(split_line[2]) - start_time, name=last_option)
          data.append(row)

  logging.info('Total number of measurements: %s', len(data))
  df = pd.DataFrame(data)
  command = ' '.join(command.split(' ')[:-2])
  fig = px.line(df, x='tick', y='mem', title=f'Memory usage of command: {command}',
                labels={
                    'mem': 'Memory usage (MiB)',
                    'tick': 'Testing time (s)',
                    'name': 'Last option'
                },
                color='name',
                render_mode='webg1'
                )
  fig.update_xaxes(rangeslider_visible=True)
  fig.write_html(report_file, auto_open=False)

def main():
  '''Initialization of plotter and generate report'''
  parser = create_parser()
  data_files, report_file = process_args(parser)
  create_memory_chart(data_files, report_file)


if __name__ == '__main__':
  main()
