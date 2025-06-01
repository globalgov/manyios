#' @export
code_orgs <- function(text, code = TRUE, max_count = 1){
  
  if(missing(text)) return(orgRegex)
  
  text <- stringi::stri_trans_general(text,"latin-ascii")
  
  purrr::map_chr(text, function(x) {
    out <- as.data.frame(orgRegex)[
      which(stringi::stri_detect_regex(x, 
                                       unlist(orgRegex[, 3]),
                                       max_count = max_count,
                                       opts_regex = list(case_insensitive = TRUE))),
      ifelse(code, 1, 2)]
    if(length(out)==0) NA_character_ else 
      if(max_count > 1 && length(out)>1) 
        paste0("{",paste(out, collapse = ","),"}") else out
  })
}

