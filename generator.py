#!/usr/bin/python

import os
import yaml
import shutil
import getpass
from jinja2 import Environment, FileSystemLoader

user_name = getpass.getuser()

input_dir = "./config"

custom_files = {
        ".zshrc": f"/home/{user_name}",
        }

config_path = input("[user home dir (enter for default)]: ")
if config_path == "":
    config_path = "./result"

with open("settings.yaml") as file:
    settings = yaml.safe_load(file)

env = Environment(loader=FileSystemLoader(input_dir))

def process_templates(src_dir, conf_dir, custom_files):
    for root, _, files in os.walk(src_dir):
        relative_path = os.path.relpath(root, src_dir)

        for file in files:
            if file in custom_files:
                print(">> home file <<")
                dest_path = os.path.join(custom_files[file], relative_path)
                os.makedirs(dest_path, exist_ok=True)
            else:
                print(">> conf file <<")
                dest_path = os.path.join(conf_dir, relative_path)
                os.makedirs(dest_path, exist_ok=True)

            src_file_path = os.path.join(root, file)

            if file.endswith(".template"):
                file = file[:-9]

            dest_file_path = os.path.join(dest_path, file)

            template = env.get_template(
                    os.path.relpath(src_file_path, src_dir)
                )
            rendered_copntent = template.render(settings)

            with open(dest_file_path, 'w') as file:
                file.write(rendered_copntent)

            print(f"{src_file_path} -->> {dest_file_path}")

if os.path.exists(config_path):
    shutil.rmtree(config_path)
os.makedirs(config_path)

process_templates(input_dir, config_path, custom_files)
