# skratch

Create a "skratch" file in a specific place.

### Why

I often make small files that I want saved in git but don't warrent a whole repo. I would not organize this well enough without a tool to do it.

### Usage

##### 1. Make an empty Python file

```
sk .py
```

##### 2. Make an empty file

```
sk
```

##### 3. Commit the current files

```
sk commit
```

##### 4. Navigate to skratch directory

```
sk-goto
```

This requires adding the following alias:

```sh
alias skcd='cd ~/Repos/skratch'
```

### Install

```sh
make install
```
