### Basic Vim Cheat Sheet

#### Starting and Exiting Vim
- **Start Vim**: `vim filename`
- **Save and Quit**: `:wq` or `ZZ`
- **Quit Without Saving**: `:q!`
- **Save Without Quitting**: `:w`
- **Save As**: `:w newfilename`

#### Modes
- **Normal Mode**: Press `Esc`
- **Insert Mode**: `i` (before cursor), `a` (after cursor), `o` (new line below)
- **Visual Mode**: `v` (character), `V` (line), `Ctrl-v` (block)
- **Command-Line Mode**: `:` (enter commands like saving or quitting)

#### Navigation
- **Arrow Keys**: Move cursor
- **h, j, k, l**: Left, Down, Up, Right
- **w, b, e**: Next word, Back word, End of word
- **0, ^, $**: Start of line, First non-blank, End of line
- **gg, G**: Start of file, End of file
- **Ctrl-d, Ctrl-u**: Half-page down, Half-page up
- **Ctrl-f, Ctrl-b**: Full-page down, Full-page up

#### Editing
- **x**: Delete character
- **dd**: Delete line
- **dw**: Delete word
- **cw**: Change word
- **yy**: Yank (copy) line
- **p**: Paste after cursor
- **u**: Undo
- **Ctrl-r**: Redo

### Intermediate Vim Cheat Sheet

#### Advanced Navigation
- **H, M, L**: Top, Middle, Bottom of screen
- **:number**: Go to line number
- **/pattern**: Search for pattern
- **n, N**: Repeat search forward, backward
- **%**: Go to matching parenthesis/bracket

#### Visual Mode
- **v, V, Ctrl-v**: Enter visual modes
- **d, y, c**: Delete, Yank, Change selection
- **>**: Indent selection
- **<**: Unindent selection

#### Buffers and Windows
- **:e filename**: Edit a new file
- **:bnext, :bprev**: Next, Previous buffer
- **:split, :vsplit**: Horizontal, Vertical split
- **Ctrl-w w**: Switch windows
- **Ctrl-w q**: Quit window

#### Registers and Macros
- **"ayw**: Yank word to register `a`
- **"ap**: Paste from register `a`
- **q[a-z]**: Start recording macro in register `[a-z]`
- **@a**: Play macro from register `a`

#### Search and Replace
- **:%s/old/new/g**: Replace all occurrences in file
- **:n,m s/old/new/g**: Replace all occurrences between lines `n` and `m`
- **:noh**: Clear search highlighting

### Advanced Vim Cheat Sheet

#### Advanced Movements
- **Ctrl-o, Ctrl-i**: Go to older, newer cursor positions
- **zt, zz, zb**: Scroll line to top, center, bottom of screen

#### Advanced Text Manipulation
- **:g/pattern/d**: Delete all lines matching pattern
- **:sort**: Sort lines

#### Scripting and Automation (Vimscript)
- **Example Function**:
  ```vim
  function! HelloWorld()
      echo "Hello, World!"
  endfunction
  ```
