### newhome

These are the files that go into my home directory the minute I get a new account on any system.
They include settings for aliases, command history, syntax highlighting, and more.
Personalize them and use them whenever you get a new login!

Install them by running `./install_newhome` in this directory.
To force overwriting of destination files (i.e., to answer 'yes' to all the "overwrite?" prompts), run as `./install_newhome -f`.

*Tip:* If you've already copied the files to your `$HOME` directory, you can install them by running the following command in `$HOME`:
```bash
rename 's/(.*)/.$1/' {bash,input,screen,vim}rc bash_aliases vim/
```
If needed, you can undo this with the following command:
```bash
rename 's/\.//' .{bash,input,screen,vim}rc .bash_aliases .vim/
```
