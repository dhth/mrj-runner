import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--template", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--build-num", required=True)
    parser.add_argument("--content-file", required=True)
    args = parser.parse_args()

    with open(args.template) as f:
        template = f.read()
    with open(args.content_file) as f:
        content = f.read()

    html = template.replace("{{BUILD_NUM}}", args.build_num)
    html = html.replace("{{CONTENT}}", content)

    with open(args.output, "w") as f:
        f.write(html)


if __name__ == "__main__":
    main()
