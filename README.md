# elskwid.el

This is a reboot of my copy-pasta emacs configuration.

I'm using the general structure from [James Edward Gray II][jeg2-emacs], which
in turn takes a great deal from [Ryan Davis][zenspider-emacs]. I'm also
looking to [Avdi Grimm][avdi-emacs] and [Brandon Mitchell][bitbckt-emacs] for
inspiration. Thanks to each of them!

## Use it

Symlink the top-level directory (`emacs.d`) to `~/.emacs.d`

## Configuration

Make changes in `emacs.d\init.el`. Specifically:

```elisp
(setq my-user       "USER-NAME")
```

That will tell the rest of the config where to start looking for the files it
needs.

### Structure



[jeg2-emacs]: https://github.com/JEG2/dotfiles/tree/master/emacs.d
[zenspider-emacs]: https://github.com/zenspider/elisp
[avdi-emacs]: https://github.com/avdi/.emacs24.d
[bitbckt-emacs]: https://github.com/bitbckt/emacs.d
