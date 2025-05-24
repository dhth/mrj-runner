import argparse
import os


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--template", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--runs-dir", required=True)
    args = parser.parse_args()

    run_files = sorted(
        (
            f
            for f in os.listdir(args.runs_dir)
            if f.startswith("run-") and f.endswith(".html")
        ),
        reverse=True,
    )

    run_list = "\n".join(
        f'<li><a class="hover:underline" href="{fname}">{fname.replace(".html", "")}</a></li>'
        for fname in run_files
    )

    with open(args.template) as f:
        template = f.read()

    html = template.replace("{{RUN_LIST}}", run_list)

    with open(args.output, "w") as f:
        f.write(html)


if __name__ == "__main__":
    main()
