import IPython  # awkward but let's not polute namespace


class MyPrompt(IPython.terminal.prompts.Prompts):
    def continuation_prompt_tokens(self, cli=None, width=None): return []
    def in_prompt_tokens(self, cli=None): return []

    def out_prompt_tokens(self):
        return [
            (IPython.terminal.prompts.Token.OutPrompt, '#['),
            (IPython.terminal.prompts.Token.OutPromptNum, str(self.shell.execution_count)),
            (IPython.terminal.prompts.Token.OutPrompt, ']> '),
        ]


get_ipython().prompts = MyPrompt(get_ipython())
