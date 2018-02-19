# followr
R Package for accessing the Follow The Money API <https://followthemoney.org/our-data/apis/>

The `followr` package provides access to the Follow the Money API 
<https://followthemoney.org/our-data/apis/> and provides all output as tidy 
data frames.  This is a work in progress and at this time nothing should be 
considered stable or working!  

That being said, the plan is for all functions to use the `flw_` prefix.

## Installation

Version 0.0.0.9999 of this package is not yet available from CRAN.

The development version (this repo) may installed with `devtools`:

```{r, eval=F}
library(devtools)
install_github("jhollist/followr")
```

## API Keys

The Follow the Money API requires an API Key.  The `followr` package will look for the API keys stored as environment variables named `follow_the_money_key`.   You can manually add this to your `.Renviron` file or use the helper function, `flw_set_api_key()` which uses the method suggested [here](http://happygitwithr.com/api-tokens.html).  For example:

```
flw_set_api_key("yourapikey")
```

You will need to restart R, but once the key is there you are good to go on that machine.  `followr` will access the key via `Sys.getenv("follow_the_money_key")`  Alternatively, you can include the API key directly in the functions, but you wouldn't want to do that if you are sharing your code with someone else.  The `flw_set_api_key()` method is preferrable.

In my experience, locating your API key is not very straightforward.  I had to go to <https://beta.followthemoney.org/show-me> and log in.  Once in, scroll down to the "Export" section.  Clink on on of the download options (I chose `json`) and that will open a page with the API link with your API key in it.  

## Attribution


