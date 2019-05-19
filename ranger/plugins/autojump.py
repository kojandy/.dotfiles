import subprocess

from ranger.api.commands import Command


class j(Command):
    """
    :j <directory>

    Uses autojump to set the current directory.
    """

    def execute(self):
        directory = subprocess.check_output(["autojump", self.arg(1)])
        directory = directory.decode("utf-8", "ignore")
        directory = directory.rstrip('\n')
        self.fm.execute_console("cd " + directory)
