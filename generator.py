#!/usr/bin/python

import os
import yaml
import shutil
from jinja2 import Environment, FileSystemLoader

input_dir = "./templates"

home_files = [
        ".zshrc",
        ]

home_path = input("[user home dir (enter for default)]: ")
if home_path == "":
    home_path = "./home"

config_path = input("[user home dir (enter for default)]: ")
if config_path == "":
    config_path = "./result"

print(f"{home_path} {config_path}")

with open("settings.yaml") as file:
    settings = yaml.safe_load(file)

env = Environment(loader=FileSystemLoader(input_dir))

def process_templates(src_dir, conf_dir, home_dir, home_files):
    for root, _, files in os.walk(src_dir):
        # print(f"root:{root} , files:{files}")
        relative_path = os.path.relpath(root, src_dir)

        for file in files:
            # print(f"file:{file}")
            print(f"{file} [{home_files}]")
            if file in home_files:
                print(">> home file <<")
                dest_path = os.path.join(home_dir, relative_path)
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

            # print(f"{src_file_path} -->> {dest_file_path}")

if os.path.exists(config_path):
    shutil.rmtree(config_path)
os.makedirs(config_path)

process_templates(input_dir, config_path, home_path, home_files)
