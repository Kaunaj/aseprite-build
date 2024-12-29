While setting up skia, if you get an error about `bzip2`, run the following command and retry:
```
sudo apt install bzip2
```

Then, during compilation of aseprite, if you see any errors like `python: not found`, it could be because python3 is the one being used in your system. Run the following command to resolve this:
```
sudo apt install python-is-python3
```
