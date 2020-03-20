# ~/.ipython/profile_default/startup
from IPython import get_ipython
from IPython.terminal.prompts import Prompts, Token


class MyPrompt(Prompts):
    def continuation_prompt_tokens(self, cli=None, width=None): return []
    def in_prompt_tokens(self, cli=None): return []

    def out_prompt_tokens(self):
        return [
            (Token.OutPrompt, '#['),
            (Token.OutPromptNum, str(self.shell.execution_count)),
            (Token.OutPrompt, ']> '),
        ]

ip = get_ipython()
ip.prompts = MyPrompt(ip)
