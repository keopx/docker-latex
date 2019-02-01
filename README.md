# Latex docker container [![Docker hub](https://img.shields.io/docker/pulls/keopx/latex.svg)](https://hub.docker.com/r/keopx/latex/)


Quick Setup
-----------

Compile latex sources using docker:


## Change to your project

```bash
cd my_latex_project
```

## Download the command wrapper and make it executable

```bash
wget https://raw.githubusercontent.com/keopx/docker-latex/master/latexdockercmd.sh
chmod +x latexdockercmd.sh
```

## Optional: Change the version (see above, default blang/latex:ubuntu)

```bash
edit ./latexdockercmd.sh
```

## Compile using pdflatex (docker will pull the image automatically)

```bash
./latexdockercmd.sh pdflatex main.tex
```

### Common errors

```
LaTeX Warning: Reference `LastPage' on page 1 undefined on input line 111.
```

**Solution**: Run command again


## Or use latexmk (best option)

```bash
./latexdockercmd.sh latexmk -cd -f -interaction=batchmode -pdf main.tex
```

## Cleanup: 

`./dockercmd.sh latexmk -c or -C`

## Or make multiple passes (does not start container twice)

```bash
../latexdockercmd.sh /bin/sh -c "pdflatex main.tex && pdflatex main.tex"
```
