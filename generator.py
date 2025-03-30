#!/usr/bin/python
import os
import yaml
import getpass
from jinja2 import Environment, FileSystemLoader

user_name = getpass.getuser()

input_dir = "./config"

custom_files = {
        ".zshrc": f"/home/{user_name}",
        }

config_path_default = "./result"
config_path = input(f"[user config dir (default: \x1b[38;5;44m{config_path_default}\x1b[0m)]: ")
if config_path == "":
    config_path = config_path_default

if input("\x1b[38;5;1m!!contents of that dir will be overwriten by config templates evaluations!!\x1b[0m are you sure? [\x1b[38;5;44my/n\x1b[0m]:") != 'y':
    quit()

with open("values.yaml", encoding="latin1") as file:
    settings = yaml.safe_load(file)

env = Environment(
    loader=FileSystemLoader(input_dir),
    block_start_string='<<%<<',
    block_end_string='>>%>>',
    variable_start_string='{@{',
    variable_end_string='}@}',
    comment_start_string='{#{',
    comment_end_string='}#}',
)

def process_templates(src_dir, conf_dir, custom_files):
    for root, _, files in os.walk(src_dir):
        relative_path = os.path.relpath(root, src_dir)

        for file in files:
            if file in custom_files:
                dest_path = os.path.join(custom_files[file], relative_path)
                os.makedirs(dest_path, exist_ok=True)
            else:
                dest_path = os.path.join(conf_dir, relative_path)
                os.makedirs(dest_path, exist_ok=True)

            src_file_path = os.path.join(root, file)

            if file.endswith(".template"):
                file = file[:-9]

            dest_file_path = os.path.join(dest_path, file)

            if (relative_path == "util/wallpapers"):
                os.system(f"cp -r {src_file_path} {dest_path}")
                continue

            try:
                template = env.get_template(os.path.relpath(src_file_path, src_dir))
            except UnicodeDecodeError as e:
                print()
                print(f"Error occured ({e})")
                print(f"rel_path ({relative_path})")
                print(f"src_dir: ({src_dir})")
                print()
                raise

            rendered_copntent = template.render(settings)

            with open(dest_file_path, 'w') as file:
                file.write(rendered_copntent)

            print(f"{src_file_path} \x1b[38;5;44m-->>\x1b[0m {dest_file_path}")

# if os.path.exists(config_path):
    # shutil.rmtree(config_path)

if not os.path.exists(config_path):
    os.makedirs(config_path)

process_templates(input_dir, config_path, custom_files)

os.system("hyprctl reload > /dev/null")
