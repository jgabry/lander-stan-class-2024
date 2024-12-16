# Installation instructions for Stan/Bayes course

Here are instructions for installing the necessary software for the workshop,
including R, RStudio, various R packages, and Stan itself. For this class we'll
be using the newer CmdStanR interface (pronounced "command Stan R") instead of
the older RStan interface. It is **very important** that you get your
installations set up before the class because we won’t have time to help
everyone with installation during the class. If you run into trouble when
installing Stan please ask for help on the 
[Stan forums](https://discourse.mc-stan.org/) with plenty of time before the class!


## Install R and RStudio

(Skip this section if you already have a recent version of R and RStudio)

If you don't already use R or don't have a very recent R version then you can
install R from <https://cran.r-project.org/>.

If you don’t already use RStudio you can install the free version from
<https://posit.co/products/open-source/rstudio/>. If you don’t want to use
RStudio you will still be able to run all the code for the class (e.g. running R
from the command line) but RStudio will make it easier to follow along and
interactively evaluate the R markdown document we’ll be using.


## Install R packages

In an R session run the following to install packages we'll use (or might use,
time permitting) in the workshop.

```
install.packages(
  c("remotes", "dplyr", "lubridate", 
    "ggplot2", "bayesplot", "posterior", "loo")
)
```

Then run this line to install the CmdStanR R package. This will serve as our
interface to Stan, although we'll need to install Stan separately (see below).

```
remotes::install_github("stan-dev/cmdstanr")
```

## Install Stan

CmdStanR, which you installed above in the Install R packages section, comes
with an R function that will install Stan for you. Unfortunately, Stan requires
a modern C++ compiler, which some users may not already have set up. To
check from R run

```
# on windows you can also use the argument fix=TRUE 
# and it will try to fix problems for you (only some issues can be fixed this way)
cmdstanr::check_cmdstan_toolchain() 
```

If there is a problem then you can find instructions for installing the required
toolchain here (there are separate instructions for each operating system):

<https://mc-stan.org/docs/cmdstan-guide/installation.html#cpp-toolchain>

Once the toolchain is set up properly you can then install Stan from R using 

```
# you can use more than 2 cores if you want
cmdstanr::install_cmdstan(cores = 2) 
```

If installation is successful then you can check that you can successfully run a Stan model by running

```
cmdstanr::cmdstanr_example()
```

If installation or model fitting fails then please ask for help on the 
[Stan forums](https://discourse.mc-stan.org/) with plenty of time before the class!
To make sure your post gets attention mention something like "CmdStan
installation error" in the title and you can use the tag "cmdstanr".
You can also send me an email about the installation problem, but I'm not an expert 
in all operating systems, which is why you may have more luck on the Stan forums.


## (Optional) Install RStan

I also recommend installing RStan because, even though we won’t use it to fit
models (we’ll use CmdStanR), it has some useful features that we might have time
to demonstrate during the workshop. If you run into errors installing RStan
don't worry about it (it's much more important to get CmdStanR working).

```
install.packages("rstan")
```
