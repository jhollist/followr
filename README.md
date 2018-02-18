# followr
R Package for accessing the Follow The Money API <https://followthemoney.org/our-data/apis/>

The `followr` package provides access to the Follow the Money API 
<https://followthemoney.org/our-data/apis/> and provides all output as tidy 
data frames.  This is a work in progress and at this time nothing should be 
considered stable or working!  

## Installation

Version 0.0.0.9999 of this package is not yet available from CRAN.

The development version (this repo) may installed with `devtools`:

```{r, eval=F}
library(devtools)
install_github("jhollist/followr")
```

## API Keys

The Follow the Money API requires an API Key.  Details for getting one are outline on their webiste at <https://www.followthemoney.org/our-data/apis/support/>`elevatr` packages will look for API keys stored as environment variables.  Currently the only API key required is from Mapzen.  Go to <https://mapzen.com/developers> and create a new key.  Copy this key and add to your `.Renviron` file.  This can be done using the method suggested [here](http://happygitwithr.com/api-tokens.html).  For example:

```
cat("mapzen_key=mapzen-XXXXXXX\n",
    file=file.path(normalizePath("~/"), ".Renviron"),
    append=TRUE)
```

You will need to restart R, but once the key is there you are good to go on that machine.  `elevatr` will access the key via `Sys.getenv("mapzen_key")`

## Attribution


