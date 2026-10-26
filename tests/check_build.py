"""Compile the book and check its pages, titles, and embedded jazz fonts."""

import os
from pathlib import Path
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]


def run(*args):
    return subprocess.run(
        args, cwd=ROOT, check=True, text=True,
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
    ).stdout


def check(condition, message):
    if not condition:
        raise RuntimeError(message)


def main():
    includes = re.findall(r'\\include "([^"]+)"', (ROOT / 'scores/all.ly').read_text())
    check(bool(includes), 'The book must include at least one score.')
    titles = []
    for filename in includes:
        score = (ROOT / 'scores' / filename).read_text()
        titles.append(re.search(r'title\s*=\s*"([^"]+)"', score).group(1))

    with tempfile.TemporaryDirectory(prefix='realbook-check-') as directory:
        output = Path(directory) / 'realbook'
        log = run(
            os.environ.get('LILYPOND', 'lilypond'), '-dwarning-as-error',
            '-I', str(ROOT / 'lilyjazz/otf'), '-o', str(output), 'main.ly',
        )
        print(log, end='')
        pdf = str(output.with_suffix('.pdf'))
        info = run('pdfinfo', pdf)
        count = int(re.search(r'^Pages:\s+(\d+)', info, re.MULTILINE).group(1))
        check(count == len(titles), f'Expected {len(titles)} pages, got {count}.')
        pages = run('pdftotext', '-layout', pdf, '-').split('\f')
        for number, title in enumerate(titles):
            check(
                ' '.join(title.split()) in ' '.join(pages[number].split()),
                f'Page {number + 1} is missing its title: {title}',
            )

        fonts = run('pdffonts', pdf)
        for font in ('LilyJAZZ-20', 'lilyjazz-text', 'lilyjazz-chord'):
            rows = [line for line in fonts.splitlines() if f'+{font} ' in line]
            check(bool(rows), f'Missing required font: {font}')
            check(
                all(re.search(r'\s+yes\s+(?:yes|no)\s+(?:yes|no)\s+\d+\s+\d+\s*$', row)
                    for row in rows),
                f'Font is not embedded: {font}',
            )
        print(f'Passed: {count} titled pages, embedded jazz fonts, no build warnings.')


if __name__ == '__main__':
    try:
        main()
    except subprocess.CalledProcessError as error:
        print(error.stdout, end='')
        raise SystemExit(error.returncode)
