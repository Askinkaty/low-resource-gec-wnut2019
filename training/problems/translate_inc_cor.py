import re
import os
import argparse
import glob

from tensor2tensor.data_generators import problem
from tensor2tensor.data_generators import text_problems
from tensor2tensor.utils import registry


@registry.register_problem
class TranslateIncCor(text_problems.Text2TextProblem):

    @property
    def approx_vocab_size(self):
        return 2 ** 15  # ~32k

    @property
    def is_generate_per_split(self):
        # custom train/test split
        return True

    def generate_samples(self, data_dir, tmp_dir, dataset_split):
        parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
        parser.add_argument("--t2t_usr_dir", type=str)
        parser.add_argument("--data_dir", type=str)
        parser.add_argument("--tmp_dir", type=str)
        parser.add_argument("--problem", type=str)
        parser.add_argument("--lang", type=str)

        args = parser.parse_args()
        del data_dir
        del tmp_dir
        input_path = '/scratch/project_2002016/datasets/data-gec/clang8rulecrl/valid.src'
        output_path = '/scratch/project_2002016/datasets/data-gec/clang8rulecrl/valid.trg'

        with open(input_path, 'r') as inp, open(output_path, 'r') as out:
            out_data = out.readlines()
            inp_data = inp.readlines()
            for j, line in enumerate(inp_data):
                line = line.strip('\n')
                if not line:
                    continue
                t_line = out_data[j]
                yield {"inputs": line, "targets": t_line}


