import json
import os

tag_base = 'ollieparsley/minecraft-server'

with open('versions.json','r') as string:
    categories=json.load(string)
string.close()

tags = []

for category,versions in categories.items():
    print("category: "+category)
    for version,data in versions.items():
        # Only build supported versions
        if data["supported"] != True:
            continue

        print(" - version: "+version)
        separator = ' '
        cmd_parts = ["docker", "build", "--no-cache"]

        # Add build arguments
        cmd_parts.append("--build-arg")
        cmd_parts.append("download_url=" + data["download_url"])

        # Server properties
        cmd_parts.append("--build-arg")
        cmd_parts.append("server_properties_location=" + data["server_properties"])

        # Server properties environment variables
        cmd_parts.append("--build-arg")
        cmd_parts.append("default_env_location=" + data["default_env_variables"])

        # Custom launcher environment variables
        cmd_parts.append("--build-arg")
        cmd_parts.append("launcher_location=" + data["launcher"])

        # Tags
        tag = tag_base + ":" + category + "-" + version
        if category == "vanilla":
            tag = tag_base + ":" + version
        tags.append(tag)
        cmd_parts.append("-t")
        cmd_parts.append(tag)

        # Add location of source files
        cmd_parts.append(".")
        cmd = separator.join(cmd_parts)
        #print(" - cmd: "+cmd+"\n")
        print(" --- Building tag: " + tag)
        exit_code = os.system(cmd + " > /dev/null 2>&1")
        if exit_code != 0:
            print(" --- Failed to build tag: " + tag)
        else:
            print(" --- Built tag: " + tag)


# Output tags to file
with open(sys.argv[1]) as f, open('tags.txt', 'w') as out:
    for tag in tags:
        out.write(tag+'\n')
