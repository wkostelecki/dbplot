covr = covr::package_coverage()
covr::report(covr)

devtools::spell_check()
devtools::check() # R CMD check
devtools::check_win_devel()
devtools::check_rhub()
devtools::release()