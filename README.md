Install:

* pandoc
* texlive-most

Create a symlink in `~/.local/bin/` to both `md2pdf` and `mdview`:

```
$ cd ~/.local/bin/
$ ln -s ~/src/md2pdf/md2pdf.sh md2pdf
$ ln -s ~/src/md2pdf/mdview.sh mdview
```

```
$ ls -l ~/.local/bin/md2pdf 
lrwxrwxrwx 1 xxx xxx 5 May 17 10:00 /home/xxx/.local/bin/md2pdf -> /home/xxx/src/md2pdf/md2pdf.sh
$ ls -l ~/.local/bin/mdview 
lrwxrwxrwx 1 xxx xxx 5 May 17 10:00 /home/xxx/.local/bin/mdview -> /home/xxx/src/md2pdf/mdview.sh
```

# Mac

* basictex

Run these commands:

```
$ tlmgr install sectsty
$ tlmgr install enumitem
$ texhash
```

